<?php

namespace App\Form;

use App\Entity\Message;
use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class ContactType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('message', TextType::class, [
                'label' => "Quelle est votre demande?",
                'attr' => [
                    'placeholder' => "Veuillez saisir votre message."
                ],
            ])
            ->add('public', CheckboxType::class, [
                'label'    => 'Souhaitez-vous partager votre question dans la foire aux questions?',
                'required' => false,
            ])
            ->add('author', EntityType::class, [
                'class' => User::class,
                'choice_value' => function (?User $user) {
                    return $user ? $user->getEmail() : '';
                },
                'required' => true,
            ])
            ->add('submit', SubmitType::class,[
                'label' => 'Envoyer votre message',
                'attr' => [
                    'class' => 'btn btn-light',
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Message::class,
        ]);
    }
}
