<?php

namespace App\Controller;

use App\Entity\Associations;
use App\Repository\AssociationsRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class AssociationController extends AbstractController
{
    #[Route('/associations', name: 'association')]
    public function index(AssociationsRepository $repo): Response
    {
        return $this->render('association/index.html.twig', [
            'controller_name' => 'AssociationController',
            'associations' => $repo->findAll(),

        ]);
    }
}
