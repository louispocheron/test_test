<?php

namespace App\Controller;

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
}
