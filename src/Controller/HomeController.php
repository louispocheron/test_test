<?php

namespace App\Controller;

use App\Entity\User;
use App\Entity\Associations;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(): Response
    {

        $securityContext = $this->container->get('security.authorization_checker');
        if ($securityContext->isGranted('IS_AUTHENTICATED_REMEMBERED')) {
            
            $user = $this->getUser();
            $role = $user->getRoles()[0];
    
    
            if(strpos($role, 'ROLE_ADMIN') !== false){
                $userIsAdmin = true;
            }else{
                $userIsAdmin = false;
            }

        }



        
        return $this->render('home/index.html.twig', [
            'controller_name' => 'HomeController',

            // set variable if user is connected
            'userIsAdmin' => $userIsAdmin ?? false,
        ]);
    }
}
