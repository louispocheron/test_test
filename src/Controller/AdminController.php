<?php

namespace App\Controller;

use App\Repository\ActionRepository;
use App\Entity\Action;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use App\Repository\AssociationsRepository;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin', name: 'admin')]
    public function index(AssociationsRepository $repo, ActionRepository $actionRepo): Response
    {   
        $user = $this->getUser();
        $assocs = $repo->findAssociation($user);


        

        foreach ($assocs as $assoc) {
            
            $action = $actionRepo->findByAssociation($assoc);
        }

       

        // dd($userAction);

        // $actions = $actionRepo->findByAssociation($assoc);
        
        // $actions = $assoc->getActions();
        // dd($actions);

        // $actions = $actionRepo->findByAssociation($assoc);
        
        
        // dd($actions);


        return $this->render('admin/index.html.twig', [
            'users' => $userAction ?? null,
            'actions' => $action ?? null,
            'assocs' => $assocs ?? null,
            'controller_name' => 'AdminController',
        ]);
    }
}
