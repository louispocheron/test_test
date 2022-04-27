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

    private function denyeAcess(Request $request, AssociationsRepository $repo){
        $user = $this->getUser();
        $userId = $user->getId();

        $assocId = $request->attributes->get('idAssoc');
        $association = $repo->find($assocId);
        
        return $userId != $association->getUser()->getId();
    }


    #[Route('/admin/{idAssoc}', name: 'admin')]
    public function index(AssociationsRepository $repo, ActionRepository $actionRepo, Request $request): Response
    {   
        $user = $this->getUser();
        $userId = $user->getId();
        $assocId = $request->attributes->get('idAssoc');
        $association = $repo->find($assocId);

        if($this->denyeAcess($request, $repo)){
            // TU PEUX RENVOYER UNE ERREUR ICI CAR LE MEC ESSAYE DE TRICHER
            return $this->redirectToRoute('home');
        }

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
    public function userInfo(Request $request, UserRepository $userRepo, AssociationsRepository $repo, ActionRepository $actionRepo): Response
{   
    if($this->denyeAcess($request, $repo)){
        // TU PEUX RENVOYER UNE ERREUR ICI CAR LE MEC ESSAYE DE TRICHER
        return $this->redirectToRoute('home');
    }

    $user = $this->getUser();
    $userId = $request->attributes->get('id');  
    $uniqueUser = $userRepo->find($userId);
  

    $association = $request->attributes->get('idAssoc');
    // RESTREINT L'ACCES A LA PAGE ADMIN . IDASSOC
    $this ->denyAccessUnlessGranted('ROLE_ADMIN'.$association, null, 'Vous n\'avez pas accès à cette page');

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
    
        return new JsonResponse([
             'content' => $this->renderView(
                'admin/action_user.html.twig', [
                    'association' => $uniqueAssociation,
                    'user' => $uniqueUser,
                    'userAction' => $actionYear,
                    'controller_name' => 'AdminController',
                ]
            )
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

        if($this->denyeAcess($request, $repo)){
            // TU PEUX RENVOYER UNE ERREUR ICI CAR LE MEC ESSAYE DE TRICHER
            return $this->redirectToRoute('home');
        }


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


    #[Route('/admin/{idAssoc}/user/{id}/remove/{action}', name: 'remove_action')]
    public function removeAction(EntityManagerInterface $em, Request $request, ActionRepository $actionRepo, AssociationsRepository $repo, $action): Response
    {

        if($this->denyeAcess($request, $repo)){
            // TU PEUX RENVOYER UNE ERREUR ICI CAR LE MEC ESSAYE DE TRICHER
            return $this->redirectToRoute('home');
        }

        
        $association = $request->attributes->get('idAssoc');
        $userId = $request->attributes->get('id');
        $actionId = $actionRepo->find($action);
        $em -> remove($actionId);
        $em -> flush();

        return $this->redirectToRoute('admin_user', ['idAssoc' => $association, 'id' => $userId]);
    }

}

