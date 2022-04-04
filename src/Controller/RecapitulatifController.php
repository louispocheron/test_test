<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use App\Repository\ActionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Service\PdfService;

class RecapitulatifController extends AbstractController
{
    #[Route('/recapitulatif', name: 'recapitulatif')]
    public function index(ActionRepository $repo): Response
    {

        $user = $this->getUser();
        $actions = $repo->findByUsers($user);
        $latest = $repo->findLatestAction($user);	

        return $this->render('recapitulatif/index.html.twig', [
            'controller_name' => 'RecapitulatifController',
            'user' => $user,
            'actions' => $actions,
            'latest' => $latest,
        ]);
    }

#[Route('/recapitulatif/remove/{id}', name: 'recapitulatif_remove')]
    public function removeAction(ActionRepository $repo, $id, EntityManagerInterface $entityManager){
        $action = $repo->find($id);
        $entityManager->remove($action);
        $entityManager->flush();

        return $this->redirectToRoute('recapitulatif');
    }


    #[Route('/recapitulatif/pdf/{id}/{userId}', name: 'recapitulatif_pdf')]
    public function pdfAction(ActionRepository $repo, $id, PdfService $pdfService, $userId){

        $user = $this->getUser();
        $userRealId = $user->getId();

        if($userId != $userRealId){
            // TU PEUX RENVOYER UNE ERREUR ICI CAR LE MEC ESSAYE DE TRICHER
            return $this->redirectToRoute('home');
        }
        else{
            $action = $repo->find($id);
            $html = $this->renderView('recapitulatif/pdf.html.twig', [
                'action' => $action,
                'user' => $user,
            ]);
            $pdfService->generatePdf($html);
        }
    }

}
