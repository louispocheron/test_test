<?php

namespace App\Controller;
use App\Entity\Associations;    
use Symfony\Component\Validator\Constraints as Assert;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;  
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Routing\Annotation\Route;

class AssociationRegistrationController extends AbstractController
{
    #[Route('/register/associations', name: 'association_registration')]
    public function index(Request $request, EntityManagerInterface $entityManager): Response
    {
        $association = new Associations();
        $form = $this->createFormBuilder($association)
                ->add('name', TextType::class,[
                    'label' => 'Nom'
                 ])
                ->add('description', TextType::class,[
                    'label' => 'Description'
                    ])
                ->add('logo', FileType::class,[
                    'label' => 'logo de l\'association',
                    'multiple' => false,
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
                ->add('password', TextType::class,[
                    'label' => 'Mot de passe',
                    'constraints' => [
                        new Assert\Length([
                            'min' => 6,
                            'minMessage' => 'Votre mot de passe doit faire au moins 6 caractères',
                            'max' => 4096,
                        ]),
                    ],
                ])
                ->add('save', SubmitType::class, ['label' => 'Enregistrer'])
                ->getForm();
                $form->handleRequest($request);

                if($form->isSubmitted() && $form->isValid()){
                    // on recupère l'image
                    $file = $form->get("logo")->getData();
                    
                    // on lui donne un nom avec un script
                    $fileName = md5(uniqid()) . "." . $file->guessExtension();

                    // on déplace l'image dans le dossier
                    $file->move(
                        $this->getParameter("logo_directory"),
                        $fileName
                    );

                    $entityManager->persist($association);
                    $entityManager->flush();
                    return $this->redirectToRoute('home');
                }

        return $this->render('association_registration/index.html.twig', [
            'controller_name' => 'AssociationRegistrationController',
            'form' => $form->createView(),
        ]);
    }
}
