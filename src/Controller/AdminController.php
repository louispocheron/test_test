<?php

namespace App\Controller;

use App\Repository\ActionRepository;
use App\Repository\UserRepository;

use App\Entity\Action;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use App\Repository\AssociationsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;

class AdminController extends AbstractController
{
    #[Route('/admin/{idAssoc}', name: 'admin')]
    public function index(AssociationsRepository $repo, ActionRepository $actionRepo, Request $request): Response
    {   
        $user = $this->getUser();
        $assocId = $request->attributes->get('idAssoc');


        $association = $repo->find($assocId);
        $actions = $actionRepo->findByAssociation($association);
        $userAction = $actionRepo->findByUsers($user);


        // get all users from $assocation
        foreach($association->getUsers() as $user){
            $users[] = $user;
        }
    
    

        return $this->render('admin/index.html.twig', [
            'association' => $association,
            'actions' => $actions ?? false,
            'users' => $users ?? false,
            'controller_name' => 'AdminController',
        ]);
    }




    #[Route('/admin/{idAssoc}/user/{id}', name: 'admin_user')]
    public function userInfo(Request $request, UserRepository $userRepo, EntityManagerInterface $entityManager, AssociationsRepository $repo, ActionRepository $actionRepo): Response
{   
    $user = $this->getUser();
    $userId = $request->attributes->get('id');  
    $uniqueUser = $userRepo->find($userId);
  

    $association = $request->attributes->get('idAssoc');
    $uniqueAssociation = $repo->find($association);


    // CODE POUR MANAGER UN USER DANS L'ASSOC AVEC L'ID PASSÉ EN PARAMETRE ICI


// PAR ASSOCIATION ET PAR USER CA MARCHE
  $userAction = $actionRepo->findByAssociationAndUser($uniqueAssociation, $uniqueUser);

    return $this->render('admin/user.html.twig', [
        'user' => $uniqueUser,
        'userAction' => $userAction,
        'controller_name' => 'AdminController',
    ]);



    }

}