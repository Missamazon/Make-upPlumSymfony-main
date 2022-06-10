<?php

namespace App\Classes;

use Symfony\Component\HttpFoundation\RequestStack;
use App\Repository\MessageRepository;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\Response;

class Contact
{
    private $stack;
 
    public function __construct(EntityManagerInterface $entityManager, RequestStack $stack)
 
    {
        $this->stack = $stack;
        $this->entityManager = $entityManager;
    }

    public function getAll(MessageRepository $mr)
    {
        $messages = $mr->findAll();

        return $messages;
    }

    public function get()
    {
        $message = $this->stack->getSession();
        return $message->get('messages', []);
    }

}