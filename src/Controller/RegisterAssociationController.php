<?php

namespace App\Controller;


use App\Entity\User;
use App\Entity\Associations;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class RegisterAssociationController extends AbstractController
{
    #[Route('/register/association', name: 'register_association')]
    public function index(Request $request, EntityManagerInterface $entityManager): Response
    {

        $user = $this->getUser();
        $association = new Associations();

        $form = $this->createFormBuilder($association)
                     ->add('name', TextType::class, ['label' => 'Nom de l\'association'])
                     ->add('logo', FileType::class, [
                        'label' => 'logo de l\'association',
                        'multiple' => false,
                        'mapped' => false,
                        'constraints' => [   
                            new Assert\File([
                                'maxSize' => '1024k',
                                'mimeTypes' => [
                                    'image/jpeg',
                                    'image/png',
                                    'image/jpg',
                                ],
                                'mimeTypesMessage' => 'Uploadez une image valide',
                            ])
                        ]])
                     ->add('description', TextType::class, ['label' => 'Description'])
                     ->add('enregister', SubmitType::class, ['label' => 'Enregistrer'])
                     ->getform();

                     $form->handleRequest($request);

                        if($form->isSubmitted()){
                                // RECUPERATION DE L'IMAGE
                            $file = $form->get('logo')->getData();
                                // GENERATION DU NOM DU FICHIER
                            $fileName = md5(uniqid()).'.'.$file->guessExtension();
                                // DEPLACEMENT DU FICHIER VERS LE DESTINATION
                            $file->move(
                                $this->getParameter('logo_directory'),
                                $fileName
                                );
                                // ENREGISTREMENT DU NOM DU FICHIER DANS L'ENTITE
                            // $association->setLogo($fileName);
                            $association->setLogo($fileName);
                            $association = $form->getData();
                            $entityManager->persist($association);
                            $entityManager->flush();

                            // $admin->setUser($user);
                            // $admin->setAssociation($this->getUser()->getAssociation());
                            // $entityManager->persist($admin);
                            // $entityManager->flush();




                            return $this->redirectToRoute('association');
                        }

        return $this->render('register_association/index.html.twig', [
            'controller_name' => 'RegisterAssociationController',
            'form' => $form->createView(),
        ]);
    }
}
