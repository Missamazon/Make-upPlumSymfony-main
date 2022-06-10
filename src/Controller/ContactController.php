<?php

namespace App\Controller;

use App\Entity\Message;
use App\Form\ContactType;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\MessageRepository;
use Symfony\Component\HttpFoundation\Request;

class ContactController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $em)
    {
        $this->entityManager =$em;
    }

    #[Route('/contact', name: 'contact')]
    public function index(): Response
    {
        return $this->render('contact/index.html.twig');
    }

    #[Route('/FAQ', name: 'FAQ')]
    public function listing(MessageRepository $mr): Response
    {
        $faq = [];
        $messages = $mr->findAll();

        foreach ($messages as $message) {
            if ($message->getPublic()) 
            {
                $faq[] = $message;
            }
        }

        return $this->render('contact/faq.html.twig', [
           'faq' => $faq,
        ]);
    }

    #[Route('/myMessages', name: 'myMessages')]
    public function mylisting(MessageRepository $mr): Response
    {
        $myMessages = [];
        $messages = $mr->findAll();
        
        foreach ($messages as $message) {
            if (!$message->getPublic()) 
            {
                $myMessages[] = $message;
            }
        }
        return $this->render('contact/myMessages.html.twig', [
            'myMessages' => $myMessages,
        ]);
    }

    #[Route('/sendMessage', name: 'sendMessage')]
    public function contact(Request $request): Response
    {
        $form = $this->createForm(ContactType::class);

        $form->handleRequest($request);

        if($form->isSubmitted() && $form->isValid()) {
            $msg = $form->get('message')->getData();
            $public = $form->get('public')->getData();
            $author = $form->get('author')->getData();

            $newMessage = new Message();
            $newMessage->setMessage($msg);
            $newMessage->setPublic($public);
            $newMessage->setAuthor($author);

            $this->entityManager->persist($newMessage);
            $this->entityManager->flush();
        }

        return $this->render('contact/contact.html.twig', [
            'form' => $form->createView(),
        ]);
    }
}
