<?php

namespace App\Controller;

use App\Repository\MessageRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class HomeController extends AbstractController
{
    #[Route('/', name: 'home')]
    public function index(MessageRepository $mr): Response
    {
        $m = $mr->findBy(array (), array ('id' => 'DESC') , 3, 0);

        return $this->render('home/index.html.twig', [
            'm' => $m,
            
        ]);
    }

}
