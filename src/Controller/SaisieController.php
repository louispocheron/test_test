<?php

namespace App\Controller;

use App\Entity\Action;
use App\Entity\User;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class SaisieController extends AbstractController
{
    #[Route('/saisie', name: 'saisie')]
    public function index(Request $request, EntityManagerInterface $entityManager): Response
    {
        $user = $this->getUser();
        $action = new Action();
        
        $form = $this->createFormBuilder($action)
                ->add('villeDepart', TextType::class, ['label' => 'Ville de départ'])
                ->add('villeArrive', TextType::class, ['label' => 'Ville d\'arrivée'])
                ->add('km', null, ['label' => 'Kilomètres'])
                ->add('raisons', null, ['label' => 'Raisons'])
                ->add('heureDepart', TimeType::class, ['label' => 'Heure de départ'])
                ->add('heureArrivee', TimeType::class, ['label' => 'Heure d\'arrivée'])
                ->add('date', null, ['label' => 'Date'])
                ->add('enregistrer', SubmitType::class, ['label' => 'Enregistrer'])
                ->getForm();

        $form->handleRequest($request);

        if($form->isSubmitted()){
            $action = $form->getData();
            $action->setUserID($user);
            $entityManager->persist($action);
            $entityManager->flush();
            return $this->redirectToRoute('home');
        }

        // $entityManager->persist($action);
        // $entityManager->flush();

        return $this->render('saisie/index.html.twig', [
            'controller_name' => 'SaisieController',
            'form' => $form->createView(),
        ]);
    }
}
