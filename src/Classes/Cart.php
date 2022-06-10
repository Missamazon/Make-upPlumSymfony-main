<?php

namespace App\Classes;

use Symfony\Component\HttpFoundation\RequestStack;
use App\Entity\Product;
use Doctrine\ORM\EntityManagerInterface;

class Cart
{
    private $stack;
    private $entityManager;
 
    public function __construct(EntityManagerInterface $entityManager, RequestStack $stack)
 
    {
        $this->stack = $stack;
        $this->entityManager = $entityManager;
    }

    public function add($id)
    {
        $session = $this->stack->getSession();
        $cart = $session->get('cart', []);


        if(!empty($cart[$id])) {

            $cart[$id]++;
        } else {
            $cart[$id] = 1;
        }

        $session->set('cart', $cart);
    }

    public function get()
    {
        $getmeth = $this->stack->getSession();
        return $getmeth->get('cart', []);
    }

    public function remove()
    {
        $removemeth = $this->stack->getSession();
        return $removemeth->remove('cart');
    }

    public function delete($id)
    {
        $delmeth = $this->stack->getSession();
        $cart = $delmeth->get('cart', []);

        unset($cart[$id]);

        return $delmeth->set('cart', $cart);
    }

    public function decrease($id)
    {
        $session = $this->stack->getSession();
        $cart = $session->get('cart', []);

        if($cart[$id] > 1) {
            $cart[$id] --;
        } else {
            unset($cart[$id]);
        }

        return $session->set('cart', $cart);
    }

    public function getFull()
    {
        $cartComplete = [];

        if ($this->get()) {
            foreach ($this->get() as $id => $quantity) {
                
                // protect against attack of strange id
                $product_object = $this->entityManager->getRepository(Product::class)->findOneBy(['id' => $id]);
                if(!$product_object) {
                    $this->delete($id);
                    continue;
                }
                
                $cartComplete[] = [
                    'product' => $product_object,
                    'quantity' => $quantity,
                ];
            }
        }
        return $cartComplete;
    }
}