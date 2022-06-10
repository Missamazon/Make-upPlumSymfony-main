<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Doctrine\ORM\EntityManagerInterface;
use App\Entity\Product;
use App\Classes\Search;
use App\Form\SearchType;
use App\Repository\ProductRepository;
use Symfony\Component\HttpFoundation\Request;

class ProductController extends AbstractController
{
    private $entityManager;

    public function __construct(EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
    }
    #[Route('/nos-produits', name: 'products')]
    public function index(Request $request, ProductRepository $prodRepo): Response
    {
        $search = new Search();
        $form = $this->createForm(SearchType::class, $search);

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()){
            //$search = $form->getData();
            $products = $prodRepo->findWithSearch($search);

        } else {
            $products = $prodRepo->findAll();

        }
        

        return $this->render('product/index.html.twig', [ 
            'products' => $products,
            'form' => $form-> createView(),
        ]);
    }

    #[Route('/product/{slug}', name: 'product')]
    public function show($slug): Response
    {
        $product = $this->entityManager->getRepository(Product::class)->findOneBy(['slug' => $slug]);

        if(!$product) {
            return $this->redirectToRoute('products');
        }

        return $this->render('product/show.html.twig', [ 
            'product' => $product
        ]);
    }
}
