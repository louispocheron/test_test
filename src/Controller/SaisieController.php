<?php

namespace App\Controller;

use App\Entity\Action;
use App\Entity\Associations;
use App\Entity\User;
use App\Repository\UserRepository;
use App\Repository\AssociationsRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TimeType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Form\Extension\Core\Type\DateType;
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
                ->add('villeDepart', TextType::class, [
                    'label' => 'Ville de départ',
                    'attr' => [
                        'class' => 'villeDepart',
                    ],
                    ])
                ->add('villeArrive', TextType::class, ['label' => 'Ville d\'arrivée'])
                ->add('km', null, ['label' => 'Kilomètres'])
                ->add('raisons', null, ['label' => 'Raisons'])
                ->add('heureDepart', TimeType::class, [
                    'input'  => 'timestamp',
                    'label' => 'Heure de départ',
                    ])
                ->add('heureArrivee', TimeType::class, [
                    'label' => 'Heure d\'arrivée',
                    'attr' => [
                        'class' => 'heureArrivee'
                    ],
                    ])
                ->add('duree', null, [
                    'label' => 'durée',
                    'attr' => [
                        'class' => 'duration'
                    ],
                    ])
                ->add('frais', null, ['label' => 'Frais'])


                ->add('date', DateType::class, [
                    'label' => 'Date',
                    'widget' => 'single_text',
                    'format' => 'dd/MM/yyyy',
                    'html5' => false,
                    'attr' => ['class' => 'flatpickr'],
                    
                    ])
                // UTILISE SELECT 2 https://select2.org/
                ->add('association', EntityType::class , [
                    'label' => 'Association',
                     "class" => Associations::class,
                     "choice_label" => "name",
                     "query_builder" => function(AssociationsRepository $assocRepo) use ($user) {
                        return $assocRepo->createQueryBuilder('associations')
                        ->andWhere(':user MEMBER OF associations.users')
                        ->setParameter('user', $user->getId())
                
        ;


                    }])

                ->add('enregistrer', SubmitType::class, ['label' => 'Enregistrer'])

                ->getForm();

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()){


            $action = $form->getData();
            $action->setUserID($user);
            
            $action->setCreatedAt(new \DateTime());

            $entityManager->persist($action);
            $entityManager->flush();
            return $this->redirectToRoute('home');
        }

        $userAssoc = $this->getUser()->getAssociation()->getValues();

        // $entityManager->persist($action);
        // $entityManager->flush();

        return $this->render('saisie/index.html.twig', [
            'controller_name' => 'SaisieController',
            'form' => $form->createView(),
            'assocs' => $userAssoc
        ]);
    }
}
