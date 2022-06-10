<?php

namespace App\Controller\Admin;

use App\Entity\User;
use App\Entity\Category;
use App\Entity\Product;
use App\Entity\Carrier;
use App\Entity\Message;
use App\Entity\Order;
use EasyCorp\Bundle\EasyAdminBundle\Router\AdminUrlGenerator;
use EasyCorp\Bundle\EasyAdminBundle\Config\MenuItem;
use EasyCorp\Bundle\EasyAdminBundle\Config\Dashboard;
use EasyCorp\Bundle\EasyAdminBundle\Controller\AbstractDashboardController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;


class DashboardController extends AbstractDashboardController
{
    /**
    * @Route("/admin", name="admin")
    */

    public function index(): Response
    {
        // return parent::index();

        // Option 1. You can make your dashboard redirect to some common page of your backend
        //
        $adminUrlGenerator = $this->container->get(AdminUrlGenerator::class);
        return $this->redirect($adminUrlGenerator->setController(OrderCrudController::class)->generateUrl());

        // Option 2. You can make your dashboard redirect to different pages depending on the user
        //
        // if ('jane' === $this->getUser()->getUsername()) {
        //     return $this->redirect('...');
        // }

        // Option 3. You can render some custom template to display a proper dashboard with widgets, etc.
        // (tip: it's easier if your template extends from @EasyAdmin/page/content.html.twig)
        //
        // return $this->render('some/path/my-dashboard.html.twig');
    }

    public function configureDashboard(): Dashboard
    {
        return Dashboard::new()
            ->setTitle(title:"Make-up Plum")
            ->setFaviconPath('favicon.svg');
    }

    public function configureMenuItems(): iterable
    {
        return [
            MenuItem::section('Retour à la page d\'accueil de Make-up Plum'),
            MenuItem::linkToRoute('Accueil', 'fa fa-home', 'home'),

            MenuItem::section('Gestions des composants du site'),
            MenuItem::linkToCrud("Utilisateurs", "fas fa-user", User::class),
            MenuItem::linkToCrud("Orders","fas fa-shopping-cart", Order::class),
            MenuItem::linkToCrud("Categories", "fas fa-list", Category::class),
            MenuItem::linkToCrud("Produits","fas fa-tags", Product::class),
            MenuItem::linkToCrud("Transporteurs","fas fa-truck", Carrier::class),
            MenuItem::linkToCrud("Messages","fas fa-envelope", Message::class),
        ];
    }
}
?>