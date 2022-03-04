<?php

namespace App\Controller;

use App\Entity\Associations;
use App\Entity\User;
use App\Repository\AssociationsRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use Knp\Component\Pager\PaginatorInterface;

class AssociationController extends AbstractController
{
    #[Route('/associations', name: 'association')]
    public function index(AssociationsRepository $repo, Request $request, EntityManagerInterface $entityManager, PaginatorInterface $paginator): Response
    {

        $user = $this->getUser();
        $assoc = $repo->findAssociationByUser($user);

        $association = $paginator->paginate(
            $repo->findAll(),
            $request->query->getInt('page', 1),
            10
        );

        // TOUT LES ADHERANT D'UNE ASSOCIATION
        // $associations = $entityManager->getRepository(Associations::class)->find('13')->getUsers()->getValues();
        // dd($associations);
     

        return $this->render('association/index.html.twig', [
            'controller_name' => 'AssociationController',
            'associations' => $association,

        ]);
    }


    // PERMET D'ADHERER A UNE ASSOCIATION
    #[Route('/associations/{id} ', name: 'association_adherer')]
    public function adhererAssociation(Associations $assoc, EntityManagerInterface $entityManager, UserRepository $repo, AssociationsRepository $assocRepo): response
    {
        $user = $this->getUser();
        if(!$user) return $this->json([
            'code' => 403,
            'message' => 'Vous devez être connecté pour adhérer à une association'
        ], 403);


        if($assoc->getUsers()->contains($user)){
            $assoc->removeUser($user);
            $entityManager->persist($assoc);
            $entityManager->flush();

            return $this->json([
                'code' => 200,
                'message' => 'Vous avez bien quitté l\'association',
                'adherer' => false
            ], 200);
        }

        $assoc->addUser($user);
        
        $entityManager->persist($assoc);
        $entityManager->flush();
        return $this->json([
            'code' => 200,
            'message' => 'Vous avez bien adhéré à l\'association',
            'adherer' => true
        ], 200);

        
    }
}
