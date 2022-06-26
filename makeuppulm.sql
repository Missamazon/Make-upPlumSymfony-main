-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : dim. 26 juin 2022 à 18:37
-- Version du serveur : 5.7.36
-- Version de PHP : 8.1.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

CREATE DATABASE  IF NOT EXISTS `heroku_83a5572442e5ad9` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `heroku_83a5572442e5ad9`;
--
-- Base de données : `heroku_83a5572442e5ad9`
--
-- --------------------------------------------------------

--
-- Structure de la table `adress`
--

DROP TABLE IF EXISTS `adress`;
CREATE TABLE IF NOT EXISTS `adress` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `first_name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `company` varchar(255) COLLATE utf8_general_ci DEFAULT NULL,
  `adress` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `postal` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `city` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `country` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_5CECC7BEA76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `adress`
--

INSERT INTO `adress` (`id`, `name`, `first_name`, `last_name`, `company`, `adress`, `postal`, `city`, `country`, `phone`, `user_id`) VALUES
(3, 'Domaine', 'Mélissa', 'Editor', NULL, '9 rue de l\'espérance', '33600', 'Pessac', 'FR', '0636363636', 1);

-- --------------------------------------------------------

--
-- Structure de la table `carrier`
--

DROP TABLE IF EXISTS `carrier`;
CREATE TABLE IF NOT EXISTS `carrier` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `description` longtext COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `carrier`
--

INSERT INTO `carrier` (`id`, `name`, `description`, `price`) VALUES
(1, 'Coliss', 'Profitez d\'une livraison premium avec une livraison dans les 48 prochaines heures (jours ouvrés) à votre bureau de poste.', 9.9),
(2, 'Relais', 'Profitez de la livraison de notre transporteur dans le point relais le plus proche de chez vous en moins de 72 heures !', 8.9);

-- --------------------------------------------------------

--
-- Structure de la table `category`
--

DROP TABLE IF EXISTS `category`;
CREATE TABLE IF NOT EXISTS `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `category`
--

INSERT INTO `category` (`id`, `name`) VALUES
(1, 'Beauté des yeux'),
(2, 'Beauté des lèvres'),
(3, 'Correcteurs de teint'),
(4, 'Soins du visage'),
(5, 'Vernis à ongles'),
(6, 'Accessoires');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

DROP TABLE IF EXISTS `doctrine_migration_versions`;
CREATE TABLE IF NOT EXISTS `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_general_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220208180845', '2022-04-28 11:31:38', 37),
('DoctrineMigrations\\Version20220208190806', '2022-04-28 11:31:38', 14),
('DoctrineMigrations\\Version20220211150411', '2022-04-28 11:31:38', 7),
('DoctrineMigrations\\Version20220214190141', '2022-04-28 11:31:39', 25),
('DoctrineMigrations\\Version20220427134255', '2022-04-28 11:31:39', 28),
('DoctrineMigrations\\Version20220428110410', '2022-04-28 11:31:39', 0),
('DoctrineMigrations\\Version20220428113303', '2022-04-28 13:03:02', 21),
('DoctrineMigrations\\Version20220428114024', '2022-04-28 13:03:02', 0),
('DoctrineMigrations\\Version20220428130000', '2022-04-28 13:03:02', 19),
('DoctrineMigrations\\Version20220428130522', '2022-04-28 13:05:41', 65),
('DoctrineMigrations\\Version20220428145937', '2022-04-28 14:59:52', 35),
('DoctrineMigrations\\Version20220428155841', '2022-04-28 15:58:56', 73),
('DoctrineMigrations\\Version20220429085909', '2022-04-29 08:59:26', 64),
('DoctrineMigrations\\Version20220501092029', '2022-05-01 09:20:44', 69);

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `author_id` int(11) DEFAULT NULL,
  `message` longtext COLLATE utf8_general_ci NOT NULL,
  `public` tinyint(1) NOT NULL,
  `answer` longtext COLLATE utf8_general_ci,
  PRIMARY KEY (`id`),
  KEY `IDX_B6BD307FF675F31B` (`author_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `message`
--

INSERT INTO `message` (`id`, `author_id`, `message`, `public`, `answer`) VALUES
(1, NULL, 'Bonjour,\r\nJe souhaitais savoir si le service client était réactif ?', 1, NULL),
(2, NULL, 'Bonjour, Pouvez-vous me répondre s\'il vous plait?', 0, NULL),
(3, 1, 'Bonjour, Comment puis-je accéder à mes commandes?', 0, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `order`
--

DROP TABLE IF EXISTS `order`;
CREATE TABLE IF NOT EXISTS `order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `created_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `carrier_name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `carrier_price` double NOT NULL,
  `delivery` longtext COLLATE utf8_general_ci NOT NULL,
  `is_paid` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_F5299398A76ED395` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `order`
--

INSERT INTO `order` (`id`, `user_id`, `created_at`, `carrier_name`, `carrier_price`, `delivery`, `is_paid`) VALUES
(1, 1, '2022-05-04 14:46:41', 'Coliss', 9.9, 'Mélissa Editor<br/>0636363636<br/>9 rue de l\'espérance<br/>33600 Pessac<br/>FR', 0),
(2, 1, '2022-05-05 11:52:32', 'Coliss', 9.9, 'Mélissa Editor<br/>0636363636<br/>9 rue de l\'espérance<br/>33600 Pessac<br/>FR', 0),
(3, 1, '2022-05-05 12:08:21', 'Coliss', 9.9, 'Mélissa Editor<br/>0636363636<br/>9 rue de l\'espérance<br/>33600 Pessac<br/>FR', 0),
(4, 1, '2022-05-05 12:09:49', 'Relais', 8.9, 'Mélissa Editor<br/>0636363636<br/>9 rue de l\'espérance<br/>33600 Pessac<br/>FR', 0),
(5, 1, '2022-05-05 12:12:02', 'Relais', 8.9, 'Mélissa Editor<br/>0636363636<br/>9 rue de l\'espérance<br/>33600 Pessac<br/>FR', 0),
(6, 1, '2022-05-05 12:21:16', 'Relais', 8.9, 'Mélissa Editor<br/>0636363636<br/>9 rue de l\'espérance<br/>33600 Pessac<br/>FR', 0);

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

DROP TABLE IF EXISTS `order_details`;
CREATE TABLE IF NOT EXISTS `order_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `my_order_id` int(11) NOT NULL,
  `product` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` double NOT NULL,
  `total` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_845CA2C1BFCDF877` (`my_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `order_details`
--

INSERT INTO `order_details` (`id`, `my_order_id`, `product`, `quantity`, `price`, `total`) VALUES
(1, 1, 'Mascara bio-éthique', 1, 2690, 2690),
(2, 2, 'Rouge à lèvres nude', 1, 1550, 1550),
(3, 2, 'Fards à paupière classiques', 1, 1590, 1590),
(4, 3, 'Rouge à lèvres nude', 1, 1550, 1550),
(5, 3, 'Fards à paupière classiques', 1, 1590, 1590),
(6, 4, 'Crayons Khôl naturels', 1, 2500, 2500),
(7, 5, 'Crayons Khôl naturels', 3, 2500, 7500),
(8, 6, 'Rouge à lèvres distinction', 1, 1550, 1550),
(9, 6, 'Mascara bio-éthique', 1, 2690, 2690);

-- --------------------------------------------------------

--
-- Structure de la table `product`
--

DROP TABLE IF EXISTS `product`;
CREATE TABLE IF NOT EXISTS `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `slug` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `illustration` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `subtitle` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `description` longtext COLLATE utf8_general_ci NOT NULL,
  `price` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `IDX_D34A04AD12469DE2` (`category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `product`
--

INSERT INTO `product` (`id`, `category_id`, `name`, `slug`, `illustration`, `subtitle`, `description`, `price`) VALUES
(1, 1, 'Crayons Khôl naturels', 'crayons-khol-naturels', 'e7ff020b92c54f79e8607c0d0e2faa24903b7ca9.png', 'Crayons pour les yeux différentes coloris', 'Crayon pour les yeux aux pigments naturels irisés, coloris au choix : noir, parme, jade, reine des glaces.', 2500),
(2, 1, 'Liner solide', 'liner-solide', 'fb3fd6ddc033975783972e0c70ea4c46957b4673.png', 'Liner à toutes épreuves', 'Un de nos produits icôniques, le liner, tenue longue durée.', 2990),
(3, 1, 'Mascara bio-éthique', 'mascara-bio-ethique', '286bfbde84d54441f6df247b628dbcf6badfd3b9.png', 'Le must-have de vos plus beaux moments', 'Un de nos produits icôniques, le mascara, tenue longue durée, avec son soin fortifiant pour des cils de plus en plus solides.', 2690),
(4, 1, 'Fards à paupière classiques', 'fards-a-paupiere-classiques', 'b3f8e7d399eeb38bd25c4d9bbfb1007391d2f96b.png', 'Fard à paupières du quotidien', 'Fards à paupière pour sublimer votre regard, et mettre des paillettes dans les yeux de vos collègues.', 1590),
(5, 1, 'Fards à paupière extraordinaires', 'fards-a-paupiere-extraordinaires', '7885073ca7bc09ac771fb03b143a8dd0691af4e4.png', 'Fard à paupières pour nuits endiablées', 'Fards à paupière pour sublimer votre regard, et mettre des paillettes dans les yeux de vos compagnons de dance-floor.', 1590),
(6, 1, 'Fards à paupière mystérieux', 'fards-a-paupiere-mysterieux', 'ef31d2554811edb2e770055faa830e855d256fdd.png', 'Fard à paupières des rendez-vous les plus secrets', 'Fards à paupière pour sublimer votre regard, et mettre des paillettes dans les yeux de vos dates.', 1590),
(7, 2, 'Rouge à lèvres distinction', 'rouge-a-levres-distinction', 'f37ae501d4efc44d7d5fb566875e1cb3635292ef.png', 'Rouge à lèvre sans prétention', 'Rouge à lèvres rouge: atout distinction en vue, avec son soin des lèvres intégré', 1550),
(8, 2, 'Rouge à lèvres séduction', 'rouge-a-levres-seduction', '7630261840b6496c0cd3b7c87c47098696c9376f.png', 'Rouge à lèvres effet séduction', 'Rouge à lèvres rouge: atout séduction en vue, avec son soin des lèvres repulpant intégré', 1550),
(9, 2, 'Rouge à lèvres nude', 'rouge-a-levres-nude', '290f23c9746f2f5fd47f73d47358d5a3c5a94d11.png', 'Rouge à lèvres effet nude', 'Rouge à lèvres marron: atout naturel en vue, avec son soin des lèvres intégré', 1550),
(10, 2, 'Rouge à lèvres mystère', 'rouge-a-levres-mystere', 'd9d1a4b7ea36235c64afd9514c5e04cfc5dd6dd8.png', 'Rouge à lèvres effet mystérieux', 'Rouge à lèvres rouge: atout mystère en vue, avec son soin illuminateur des lèvres intégré', 1550),
(11, 1, 'Rouge à lèvres scandale', 'rouge-a-levres-scandale', 'e16cca13e905ecc4366a80063ef87e686fc254dd.png', 'Rouge à lèvres effet podium', 'Rouge à lèvres rouge: atout scandaleux en vue, avec son soin des lèvres intégré', 1550),
(12, 2, 'Rouge à lèvres audacieux', 'rouge-a-levres-audacieux', '87f29d645d332ba0d1f3cba3fb429b003481378e.png', 'Rouge à lèvres effet inratable', 'Rouge à lèvres noir: atout audace pour ne pas passer inaperçu en vue, avec son soin revitalisant des lèvres intégré', 1550),
(13, 3, 'Correcteur de teint c1', 'correcteur-de-teint-c1', '9592cf02271d8991e21875f3813087939e8e4639.png', 'Correcteur de teint c1', 'Dans la gamme de nos 5 correcteurs de teint, pour masquer les imperfections et aider à la cicatrisation des boutons et hydrater en profondeur la peau pour les ridules. 11ml', 1990),
(14, 3, 'Correcteur de teint c2', 'correcteur-de-teint-c2', 'c04e084739251869f99f8aaecd88aee6e17ddfb7.png', 'Correcteur de teint c2', 'Dans la gamme de nos 5 correcteurs de teint, pour masquer les imperfections et aider à la cicatrisation des boutons et hydrater en profondeur la peau pour les ridules. 11ml', 1990),
(15, 3, 'Correcteur de teint c3', 'correcteur-de-teint-c3', '88f8ffa1fed15551d1b6f66d1e9140bd8844c74f.png', 'Correcteur de teint c3', 'Dans la gamme de nos 5 correcteurs de teint, pour masquer les imperfections et aider à la cicatrisation des boutons et hydrater en profondeur la peau pour les ridules. 11ml', 1990),
(16, 3, 'Correcteur de teint c4', 'correcteur-de-teint-c4', 'a5822071234382031da1e2dc1836ac7801f6debb.png', 'Correcteur de teint c4', 'Dans la gamme de nos 5 correcteurs de teint, pour masquer les imperfections et aider à la cicatrisation des boutons et hydrater en profondeur la peau pour les ridules. 11ml', 1990),
(17, 3, 'Correcteur de teint c5', 'correcteur-de-teint-c5', 'a007d46bb68f2d44ee78a7f2f2fb48821c2fb284.png', 'Correcteur de teint c5', 'Dans la gamme de nos 5 correcteurs de teint, pour masquer les imperfections et aider à la cicatrisation des boutons et hydrater en profondeur la peau pour les ridules. 11ml', 1990),
(18, 4, 'Eau Micellaire Clearea', 'eau-micellaire-clearea', '374bb88317778f4529c323bd1f911ead57d7b386.png', 'Eau micellaire pour purifier votre visage en un coup de coton', 'Nettoie intensément votre peau de la pollution reçue durant la journée et démaquille en profondeur. 20cl', 1590),
(19, 4, 'Baume à lèvres intensive nourrish', 'baume-a-levres-intensive-nourrish', '2f5ac7f0d4f408b056ea6ac80f90c8759be16e1a.png', 'Baume à lèvres effet gloss', 'Baume à lèvres à nutrition intense aux extraits de gelée royale, goût pêche. La beauté peut aussi être gourmande. 12ml', 1290),
(20, 4, 'Crême hydratante éclat naturel', 'creme-hydratante-eclat-naturel', '7e4c1dc743d7c9d042dec100c9acc5876fca9220.png', 'Crème hydratante réparatrice', 'Crème hydratante pour redonner son éclat naturel à votre peau aux extraits de rose. 15cl', 1890),
(21, 4, 'Crème exfoliante revitalisante', 'creme-exfoliante-revitalisante', 'ca40ad7f628e90d838adf8a694f14948483c6171.png', 'Crème exfoliante boom d\'hydratation', 'Prendre soin de sa peau en l\'aidant à se renouveler n\'aura jamais été aussi simple! 10cl', 1590),
(22, 4, 'Huile soin intense', 'huile-soin-intense', '4474fa022fc441c9a8d3bf838a78998b04b31aa2.png', 'Huile pour les peaux qui ont soif', 'Une fontaine de Jouvance pour votre peau fatiguée par votre quotidien. 10cl', 1790),
(23, 5, 'Vernis à ongles classic', 'vernis-a-ongles-classic', '51c1ce233f7e36565bdd7fdff4a5ec01a03aaf5c.png', 'Vernis à ongles alliés discrétion', 'Set de 5 vernis à assortir à vos humeurs et vos envies. Au choix format: grand (12ml) ou nail art(5ml).', 590),
(24, 5, 'Vernis à ongles bright', 'vernis-a-ongles-bright', '071a8fe137e4be4508c648bf70b01ffc0fcee210.png', 'Vernis à ongles alliés pep\'s', 'Set de 5 vernis à assortir à vos humeurs et vos envies. Au choix format: grand (12ml) ou nail art(5ml).', 590),
(25, 5, 'Vernis à ongles extra bright', 'vernis-a-ongles-extra-bright', '8367a120ac235e79510ade13f247d7b903913b0c.png', 'Vernis à ongles alliés bonne humeur', 'Set de 5 vernis à assortir à vos humeurs et vos envies. Au choix format: grand (12ml) ou nail art(5ml).', 590),
(26, 5, 'Vernis à ongles extra soft', 'vernis-a-ongles-extra-soft', 'a04ebe6e951f02c90d25427428848017c5ff9415.png', 'Vernis à ongles alliés zenitude', 'Set de 5 vernis à assortir à vos humeurs et vos envies. Au choix format: grand (12ml) ou nail art(5ml).', 590),
(27, 5, 'Vernis à ongles soft', 'vernis-a-ongles-soft', '7a0b57a6645e763ca4a70d781436ced8914b766a.png', 'Vernis à ongles alliés douceur', 'Set de 5 vernis à assortir à vos humeurs et vos envies. Au choix format: grand (12ml) ou nail art(5ml).', 590),
(28, 5, 'Vernis à ongles stranger nails', 'vernis-a-ongles-stranger-nails', '04f6de86eb963db40537fe4a356a0dfdcdcd68fa.png', 'Vernis à ongles alliés pour sortir du lot', 'Set de 5 vernis à assortir à vos humeurs et vos envies. Au choix format: grand (12ml) ou nail art(5ml).', 590),
(29, 6, 'Pinceau biseauté large', 'pinceau-biseaute-large', '1bce76713da3315fdf917b9200be502b56ecdf7d.png', 'Pinceau de maquillage professionnel', 'Parfait pour appliquer son fond de teint ou estomper son make-up.', 890),
(30, 6, 'Pinceau arrondi large', 'pinceau-arrondi-large', '4ab60d90fa8d438cb62c1e81fdba88584e210bc9.png', 'Pinceau de maquillage professionnel', 'Parfait pour appliquer son fond de teint ou estomper son make-up.', 790),
(31, 6, 'Set de 2 pinceaux fins', 'set-de-2-pinceaux-fins', 'ea3d69cc4e279fa2e5ba5821036a2af9cfa0b991.png', 'Pinceau de maquillage professionnel pour appliquer les fards à paupières', 'Parfait pour appliquer son make-up avec précision, le tout dans la douceur.', 990),
(32, 6, 'Set de 4 pinceaux larges', 'set-de-4-pinceaux-larges', '368c9ee1ff5517351550aa5de36eed06df04df73.png', 'Quatre pinceaux larges', 'Set complet pour le teint', 1590),
(33, 6, 'Set complet accessoires de maquillages', 'set-complet-accessoires-de-maquillages', '248e95b70b7d1cdd02f6029effe4947f1e4cff9a.png', 'Set de pinceaux de maquillage et sa trousse', 'Set parfait pour un maquillage toujours impeccable :4 pinceaux larges, 7 pinceaux fins, 1 pinceau extra fin et un outil de sculpting des sourcils.', 3090);

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `email` varchar(180) COLLATE utf8_general_ci NOT NULL,
  `roles` longtext COLLATE utf8_general_ci NOT NULL COMMENT '(DC2Type:json)',
  `password` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `firstname` varchar(255) COLLATE utf8_general_ci NOT NULL,
  `lastname` varchar(255) COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNIQ_8D93D649E7927C74` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `email`, `roles`, `password`, `firstname`, `lastname`) VALUES
(1, 'editor01mm@gmail.com', '[\"ROLE_ADMIN\"]', '$2y$13$KCuOC6PUwugMakX3wUDDxOq9y00BcrG7heLd/NT3U8ree7B4b/Fqy', 'Mélissa', 'Editor'),
(2, 'missamazonia@maimail.com', '[]', '$2y$13$F9pLtSRyuFMDA7DmaVR6OOG5yMqKesEBvUEY0jZZSUiO7gzmKmXE6', 'Mélissa', 'Missamazonia'),
(3, 'missa@mailmail.com', '[]', '$2y$13$TWboQq5uM7C/VpGgzpEltOx4JHx4cS72NupBUPFYUUCSrBdMbrlqW', 'Lola', 'Missa');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `adress`
--
ALTER TABLE `adress`
  ADD CONSTRAINT `FK_5CECC7BEA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_B6BD307FF675F31B` FOREIGN KEY (`author_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `FK_F5299398A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `FK_845CA2C1BFCDF877` FOREIGN KEY (`my_order_id`) REFERENCES `order` (`id`);

--
-- Contraintes pour la table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `FK_D34A04AD12469DE2` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
