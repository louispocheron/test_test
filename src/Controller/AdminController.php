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
       

        $form = $this->createFormBuilder(){
            
        }
        

        // find all actions that are in $assocs
        $actions = $actionRepo->findAll();
        $actionsInAssoc = [];
        foreach($actions as $action){
            foreach($assocs as $assoc){
                if($action->getAssociation() == $assoc){
                    array_push($actionsInAssoc, $action);
                }
            }
        }

       

        // dd($userAction);

        // $actions = $actionRepo->findByAssociation($assoc);
        
        // $actions = $assoc->getActions();
        // dd($actions);

        // $actions = $actionRepo->findByAssociation($assoc);
        
        
        // dd($actions);


        return $this->render('admin/index.html.twig', [
            'actions' => $actionsInAssoc ?? null,
            'assocs' => $assocs ?? null,
            'controller_name' => 'AdminController',
        ]);
    }
}
