<?php

namespace App\Controller;

use Doctrine\ORM\EntityManagerInterface;
use App\Repository\ActionRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

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
}
