<?php

namespace App\Form;

use App\Entity\Adress;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CountryType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class AdressType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options): void
    {
        $builder
            ->add('name', TextType::class, [
                'label' => 'Quel nom souhaitez-vous donner à votre adresse?',
                'attr' => [
                    'placeholder' => 'Nommez votre adresse'
                ]
            ])
            ->add('firstName', TextType::class, [
                'label' => 'Quel est votre prénom?',
                'attr' => [
                    'placeholder' => 'Entrez votre prénom'
                ]
            ])
            ->add('lastName', TextType::class, [
                'label' => 'Quel est votre nom?',
                'attr' => [
                    'placeholder' => 'Entrez votre nom'
                ]
            ])
            ->add('company', TextType::class, [
                'label' => 'Quel est le nom de votre société (facultatif)?',
                'required' => false,
                'attr' => [
                    'placeholder' => 'Entrez le nom de votre société (facultatif)',
                ]
            ])
            ->add('adress', TextType::class, [
                'label' => 'Quelle est l\'adresse de livraison ?',
                'attr' => [
                    'placeholder' => 'Entrez l\'adresse de livraison ex: 6 rue de l\'espérence'
                ]
            ])
            ->add('postal', TextType::class, [
                'label' => 'Quel est le code postal du lieu de livraison?',
                'attr' => [
                    'placeholder' => 'Entrez le code postal'
                ]
            ])
            ->add('city', TextType::class, [
                'label' => 'Quelle est la ville de livraison?',
                'attr' => [
                    'placeholder' => 'Entrez la ville de livraison'
                ]
            ])
            ->add('country', CountryType::class, [
                'label' => 'Quel est le pays du lieu de livraison ?',
                'attr' => [
                    'placeholder' => 'Le pays'
                ]
            ])
            ->add('phone', TelType::class, [
                'label' => 'Quel est votre numéro de téléphone?',
                'attr' => [
                    'placeholder' => 'Votre numéro de téléphone'
                ]
            ])
            ->add('submit', SubmitType::class, [
                'label' => 'Valider mon adresse',
                'attr' => [
                    'class' => 'btn btn-light'
                ]
            ])
        ;
    }

    public function configureOptions(OptionsResolver $resolver): void
    {
        $resolver->setDefaults([
            'data_class' => Adress::class,
        ]);
    }
}
