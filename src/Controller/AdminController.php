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
use Symfony\Component\HttpFoundation\JsonResponse;

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
    
        //convert getDuree to hours and minutes
      


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
    $year = $request->get("year");

    $userAction = $actionRepo->findByAssociationAndUser($uniqueAssociation, $uniqueUser, $year);
    $actionYear = $actionRepo->findByAssociationAndUserAndYear($uniqueAssociation, $uniqueUser, $year);

    
    foreach($actionYear as $action){
        $duree[] = $action->getDuree();
    }
//    dd($actionYear);
//   ON VERIFIE SI IL Y A DE l'AJAX 
    if($request->get("ajax")){
        
        // get every actionYear

    
        return new JsonResponse([
            'actionYear' => $duree,
        ]);
    }
    


    return $this->render('admin/user.html.twig', [
        'association' => $uniqueAssociation,
        'user' => $uniqueUser,
        'userAction' => $userAction,
        'controller_name' => 'AdminController',
    ]);
}


    #[Route('/admin/{idAssoc}/user/remove/{id}', name: 'remove_user')]
    public function removeUserFromAssoc(Request $request, UserRepository $userRepo, EntityManagerInterface $entityManager, AssociationsRepository $repo, ActionRepository $actionRepo): Response
    {

        // DELETE USER FROM ASSOC AND ALL ACTIONS HE HAS DONE WITH THIS ASSOC
        $user = $this->getUser();
        $userId = $request->attributes->get('id');
        $uniqueUser = $userRepo->find($userId);
        $association = $request->attributes->get('idAssoc');
        $uniqueAssociation = $repo->find($association);

        $userAction = $actionRepo->findByAssociationAndUser($uniqueAssociation, $uniqueUser);

        foreach($userAction as $action){
            $entityManager->remove($action);
        }

        // remove selected user from association
        $uniqueAssociation->removeUser($uniqueUser);
        $entityManager->flush();
    

        return $this->redirectToRoute('admin', ['idAssoc' => $association]);
    }



    #[Route('/admin/{idAssoc}/user/{id}/test', name: 'year_user')]
    public function findUserActionByYear(Request $request, UserRepository $userRepo, EntityManagerInterface $entityManager, AssociationsRepository $repo, ActionRepository $actionRepo): Response
    {   
        // $user = $this->getUser();   
        $userId = $request->attributes->get('id');  
        $uniqueUser = $userRepo->find($userId);
        $association = $request->attributes->get('idAssoc');
        $assocation = $repo->find($association);
        $year = $request->attributes->get('year');
        // dd($year);

        $actionYear = $actionRepo->findByAssociationAndUserAndYear($assocation, $uniqueUser, 1965);

        
        return $this->json([
            
            'actionYear' => $actionYear
        ]);
    }
}

// MET CA AU DESSUS DANS LE FUNCTION PAS /YEAR, ET GET LES VARIABLES QUE TU AS PASSE EN AJAX PIS LA FUNCTION DU REPO
