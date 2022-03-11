-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : ven. 11 mars 2022 à 07:18
-- Version du serveur :  8.0.28-0ubuntu0.20.04.3
-- Version de PHP : 7.4.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `Saved`
--

-- --------------------------------------------------------

--
-- Structure de la table `action`
--

CREATE TABLE `action` (
  `id` int NOT NULL,
  `ville_depart` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville_arrive` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `km` int NOT NULL,
  `raisons` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_depart` time DEFAULT NULL,
  `heure_arrivee` time DEFAULT NULL,
  `date` date NOT NULL,
  `user_id` int NOT NULL,
  `association_id` int DEFAULT NULL,
  `duree` time DEFAULT NULL,
  `frais` int DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `frais_kilometrique` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id`, `ville_depart`, `ville_arrive`, `km`, `raisons`, `heure_depart`, `heure_arrivee`, `date`, `user_id`, `association_id`, `duree`, `frais`, `created_at`, `frais_kilometrique`) VALUES
(1, 'Dijon', 'Strasbourg', 300, 'personelles', '03:00:00', '08:00:00', '2017-03-01', 4, NULL, NULL, NULL, NULL, NULL),
(2, 'bourg en bresse', 'arbois', 150, 'test test test tes', '03:00:00', '04:05:00', '2019-03-03', 5, NULL, NULL, NULL, NULL, NULL),
(3, 'une autre ville', 'moncku', 540, 'idk', '05:00:00', '05:00:00', '2023-07-04', 5, NULL, NULL, NULL, NULL, NULL),
(4, 'dijon', 'arbois', 70, 'association sporgt handball', '03:00:00', '04:00:00', '2017-01-01', 4, NULL, NULL, NULL, NULL, NULL),
(5, 'test lol', 'dsqjkdfsjfdskl', 50, 'ntm', '06:00:00', '11:00:00', '2027-01-01', 10, 8, NULL, NULL, NULL, NULL),
(6, 'louistestaction', 'qsdqsdqsdsq', 500, 'hihihi', '04:00:00', '04:00:00', '2025-06-04', 4, 8, '00:00:40', 100, NULL, NULL),
(7, 'testadmin', 'testadmin1', 100, 'admin test', '05:00:00', '03:00:00', '2011-03-10', 4, 17, '00:00:50', 150, NULL, NULL),
(8, 'test 12234559578975', 'sdfdss', 50, 'dsfdsf', '02:00:00', '04:00:00', '2010-03-05', 4, 17, '00:00:50', 50, NULL, NULL),
(9, 'une eniemeine saisie', 'qsddqsdqsdqs', 10000000, 'salut salut', '04:00:00', '02:00:00', '2022-03-31', 22, 17, '00:00:20', 10, NULL, NULL),
(12, 'ayayaya', 'auauaua', 132, 'dsqzdqsd', '01:00:00', '01:00:00', '2022-03-01', 4, 8, '00:00:12', 12, NULL, NULL),
(13, 'plswork', 'dsqdsqdqs', 21, 'qsdqsd', '03:00:00', '02:00:00', '2022-03-01', 4, 8, '00:01:32', 1122, '2022-03-07 10:36:42', NULL),
(14, 'latest ?', 'dsqdqsd', 12, 'dqsdqs', '02:00:00', '02:00:00', '2022-03-08', 23, NULL, '00:00:12', 12, '2022-03-07 10:43:44', NULL),
(15, 'latest saisie', 'dsqsdqs', 12, '123', '01:00:00', '02:00:00', '2022-03-01', 4, 9, '00:00:12', 12, '2022-03-07 10:49:44', NULL),
(16, 'test1adminlololol', 'qsdqsdqs', 123, 'sqdsqdsq', '02:00:00', '03:00:00', '2022-03-01', 24, 17, '00:00:54', 12, '2022-03-08 11:38:36', NULL),
(17, 'fdptest', 'dqsdqsdqs', 12, 'test test', '02:00:00', '03:00:00', '2028-03-03', 24, 17, '00:00:12', 12, '2022-03-08 11:46:19', NULL),
(18, 'fraiskm', 'qsdqsdqs', 23, 'qsdqsdqs', '04:05:00', '04:05:00', '2022-03-24', 24, 17, '00:00:12', 50, '2022-03-09 15:35:39', 34),
(19, 'fraiskmsqdq', 'qsdqsdqsd', 4, 'qsdqsdqsd', '03:00:00', '02:00:00', '2012-03-16', 24, 16, '00:00:12', 23, '2022-03-09 15:43:02', NULL),
(20, 'dqsd', 'qsdqsd', 23, 'test2', '01:00:00', '02:00:00', '2022-03-09', 4, 10, '00:01:22', 12, '2022-03-10 10:14:15', NULL),
(21, 'hellllooobg', 'qsdqsdqs', 44, 'dsfdsfs', '02:00:00', '04:00:00', '2022-03-01', 4, 10, '00:00:12', 44, '2022-03-10 10:15:33', NULL),
(22, '10value', 'qsdqs', 99, 'qsdqsdqs', '04:00:00', '04:00:00', '2022-03-09', 4, 9, '00:00:12', 10, '2022-03-10 10:38:11', NULL),
(23, 'testSomeValue', 'ahahahah', 33, 'aeazezaeaea', '02:00:00', '02:00:00', '2022-03-16', 4, 9, '00:00:33', 33, '2022-03-10 10:47:39', NULL),
(24, 'qsdqsdqs', 'qsdqsdqs', 323, 'dqsdqs', '05:06:00', '06:06:00', '2022-03-14', 4, 8, NULL, 323, '2022-03-10 15:57:13', 423423),
(25, 'qsdqsd', 'qsdqd', 23, 'sqdqdq', '00:00:00', '00:00:00', '2022-03-08', 4, 8, NULL, 23, '2022-03-10 16:18:45', 32);

-- --------------------------------------------------------

--
-- Structure de la table `associations`
--

CREATE TABLE `associations` (
  `id` int NOT NULL,
  `name` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(5000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `user_id` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `associations`
--

INSERT INTO `associations` (`id`, `name`, `logo`, `description`, `user_id`) VALUES
(4, 'rugby Arbois', 'ccfc95e05d44a2f446fdcae757a715e5.png', 'une petite description de l\'association ehehe', NULL),
(5, 'rugby Dijon', '633550bca9534817e84ae383fd444d77.png', 'club de rugby de dijon', NULL),
(7, 'rugby all blacks', '29bd588b51a0c9818b7ce3daefef3a32.png', 'dsfkjds  dsfkljsdkflds dskfldsjfkdlsfj sdklfjsdkflmdsf sdlkfjdskfldjs sdklfjdsklfjds lskdfj dklsfjds sdlfjksdklf lmksdjf lsdf', NULL),
(8, 'handball besancon', 'f6531770110e43a0fbd21d719aaaf2fb.jpg', 'dkljqskldqskldmq', NULL),
(9, 'test', '722098a4736d6889b622aaef2bda71a9.jpg', 'ddm;qsdùmqs', NULL),
(10, 'testlouis', '8e92f619a173aa652863e49ca14dc7fd.jpg', 'ddm;qsdùmqs', NULL),
(11, 'rugby club arbois', '24b9bc4ebb8c093c633361a5cf8c209e.jpg', 'ddm;qsdùmqs', NULL),
(12, 'une assoc', '541719e06c8f0f4ff496b913d39e8c70.png', 'qsdqsdqsdqs', 9),
(14, 'une autre assoc dans le dd', 'a93bee28c423df8190044f11b5c8a782.jpg', 'ljhkjkhjk', 10),
(15, 'une assoc dans le dd', '6c03a64a4e3b7b21b185ee3166dc45b7.jpg', 'salut ca va ?', 10),
(16, 'une assoc dans le dd', '32294eeee986568719eae71d4efe74af.jpg', 'qsdqsdqs', 10),
(17, 'deuxieme assoc', 'd692b9736f445a175f48864a4b0bf2db.jpg', 'dsqdqsdqs', 4),
(18, 'issou', '83da4c876074b6d3945fc2d85b7d6293.png', 'dqsdqsdqs', 12);

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `executed_at` datetime DEFAULT NULL,
  `execution_time` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8_unicode_ci;

--
-- Déchargement des données de la table `doctrine_migration_versions`
--

INSERT INTO `doctrine_migration_versions` (`version`, `executed_at`, `execution_time`) VALUES
('DoctrineMigrations\\Version20220221091101', '2022-02-21 10:11:14', 101),
('DoctrineMigrations\\Version20220221092548', '2022-02-21 10:25:54', 91),
('DoctrineMigrations\\Version20220221093757', '2022-02-21 10:38:12', 105),
('DoctrineMigrations\\Version20220221100939', '2022-02-21 11:09:57', 91),
('DoctrineMigrations\\Version20220221111405', '2022-02-21 12:14:17', 198),
('DoctrineMigrations\\Version20220221111734', '2022-02-21 12:17:41', 244),
('DoctrineMigrations\\Version20220221111914', '2022-02-21 12:19:20', 188),
('DoctrineMigrations\\Version20220221134145', '2022-02-21 14:41:55', 158),
('DoctrineMigrations\\Version20220221134323', '2022-02-21 14:43:27', 86),
('DoctrineMigrations\\Version20220223090718', '2022-02-23 10:07:29', 199),
('DoctrineMigrations\\Version20220223091006', '2022-02-23 10:10:11', 101),
('DoctrineMigrations\\Version20220223091301', '2022-02-23 10:13:08', 115),
('DoctrineMigrations\\Version20220223091507', '2022-02-23 10:15:14', 112),
('DoctrineMigrations\\Version20220223141555', '2022-02-23 15:16:05', 144),
('DoctrineMigrations\\Version20220301093700', '2022-03-01 10:37:24', 101),
('DoctrineMigrations\\Version20220302123621', '2022-03-02 13:36:32', 194),
('DoctrineMigrations\\Version20220303094940', '2022-03-03 10:49:55', 73),
('DoctrineMigrations\\Version20220303100400', '2022-03-03 11:04:06', 49),
('DoctrineMigrations\\Version20220307090138', '2022-03-09 15:21:18', 29),
('DoctrineMigrations\\Version20220309141952', '2022-03-09 15:21:18', 31);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `messenger_messages`
--

INSERT INTO `messenger_messages` (`id`, `body`, `headers`, `queue_name`, `created_at`, `available_at`, `delivered_at`) VALUES
(1, 'O:36:\\\"Symfony\\\\Component\\\\Messenger\\\\Envelope\\\":2:{s:44:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0stamps\\\";a:1:{s:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\";a:1:{i:0;O:46:\\\"Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\\":1:{s:55:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Stamp\\\\BusNameStamp\\0busName\\\";s:21:\\\"messenger.bus.default\\\";}}}s:45:\\\"\\0Symfony\\\\Component\\\\Messenger\\\\Envelope\\0message\\\";O:51:\\\"Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\\":2:{s:60:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0message\\\";O:39:\\\"Symfony\\\\Bridge\\\\Twig\\\\Mime\\\\TemplatedEmail\\\":4:{i:0;s:30:\\\"reset_password/email.html.twig\\\";i:1;N;i:2;a:1:{s:10:\\\"resetToken\\\";O:58:\\\"SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\\":4:{s:65:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0token\\\";s:40:\\\"ErTKJyXdMgWgkyoPRbhKIRpGoINNar1Cblou48xY\\\";s:69:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0expiresAt\\\";O:17:\\\"DateTimeImmutable\\\":3:{s:4:\\\"date\\\";s:26:\\\"2022-03-02 14:37:02.897455\\\";s:13:\\\"timezone_type\\\";i:3;s:8:\\\"timezone\\\";s:13:\\\"Europe/Berlin\\\";}s:71:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0generatedAt\\\";i:1646224622;s:73:\\\"\\0SymfonyCasts\\\\Bundle\\\\ResetPassword\\\\Model\\\\ResetPasswordToken\\0transInterval\\\";i:1;}}i:3;a:6:{i:0;N;i:1;N;i:2;N;i:3;N;i:4;a:0:{}i:5;a:2:{i:0;O:37:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\\":2:{s:46:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0headers\\\";a:3:{s:4:\\\"from\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:4:\\\"From\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:27:\\\"testResetPassword@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:15:\\\"passwordReseter\\\";}}}}s:2:\\\"to\\\";a:1:{i:0;O:47:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:2:\\\"To\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:58:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\MailboxListHeader\\0addresses\\\";a:1:{i:0;O:30:\\\"Symfony\\\\Component\\\\Mime\\\\Address\\\":2:{s:39:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0address\\\";s:24:\\\"pocheron.louis@gmail.com\\\";s:36:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Address\\0name\\\";s:0:\\\"\\\";}}}}s:7:\\\"subject\\\";a:1:{i:0;O:48:\\\"Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\\":5:{s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0name\\\";s:7:\\\"Subject\\\";s:56:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lineLength\\\";i:76;s:50:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0lang\\\";N;s:53:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\AbstractHeader\\0charset\\\";s:5:\\\"utf-8\\\";s:55:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\UnstructuredHeader\\0value\\\";s:27:\\\"Your password reset request\\\";}}}s:49:\\\"\\0Symfony\\\\Component\\\\Mime\\\\Header\\\\Headers\\0lineLength\\\";i:76;}i:1;N;}}}s:61:\\\"\\0Symfony\\\\Component\\\\Mailer\\\\Messenger\\\\SendEmailMessage\\0envelope\\\";N;}}', '[]', 'default', '2022-03-02 13:37:02', '2022-03-02 13:37:02', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `reset_password_request`
--

CREATE TABLE `reset_password_request` (
  `id` int NOT NULL,
  `user_id` int NOT NULL,
  `selector` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hashed_token` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `requested_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)',
  `expires_at` datetime NOT NULL COMMENT '(DC2Type:datetime_immutable)'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `reset_password_request`
--

INSERT INTO `reset_password_request` (`id`, `user_id`, `selector`, `hashed_token`, `requested_at`, `expires_at`) VALUES
(1, 4, 'ErTKJyXdMgWgkyoPRbhK', 'UsmGn3kwlzKcGm1Kddw1NQXZGjnAWhr17RoVemiqZd8=', '2022-03-02 13:37:02', '2022-03-02 14:37:02');

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(180) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `profil_picture` varchar(1500) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `email`, `profil_picture`) VALUES
(1, 'lololol', '[]', '$2y$13$t0O2GbF.D7/9JbeBYXzIhu7A8fFD/hgWRnY1X9kecx2oV8WZY2XNa', NULL, NULL),
(3, 'qsdqsdqsdqdq', '[]', '$2y$13$UDNS2LEhpahye4/X2h4Ukup0N5GO5mqNUqAO5WLoIUzTPZg4E.Wf2', 'qsddqsdqs', NULL),
(4, 'louistest1', '[\"ROLE_ADMIN\"]', '$2y$13$kk.A2MieB0Q.eT3IdmdN0u.EzUhJ6vZ9kJMINBZNJRSlnqusQsxXK', 'pocheron.louis@gmail.com', NULL),
(5, 'louisrecap', '[]', '$2y$13$15Qzc0VxX//hfhjsQbQ5heAnViAlOoqr5XvhDcuf7iLhHpYx/MOGm', 'test@gmail.com', NULL),
(8, 'qsdqsdqs', '[]', '$2y$13$LqQqCipsRhLu0sj9NJi5B.cV2tA0UWBGyb/AZBbrjeY8WYlHad41S', 'dsqqsdqs', NULL),
(9, 'louis test authentificated fullu', '[\"ROLE_ADMIN_UNE ASSOC\"]', '$2y$13$bkfLZvwJG6lOKro.WrONfei6guiEQJ1l1RNz3asCVCLsl.8P.Ntfa', 'louistestabc@gmail.com', NULL),
(10, 'ahahahah', '[\"ROLE_ADMIN_UNE ASSOC DANS LE DD\"]', '$2y$13$qRbLFDIBErbWswbQZsBWkuTbKoWG5aIC.BEyqJkA4B0kCKS56x2AC', 'unemail@gmail.com', NULL),
(12, 'image', '[\"ROLE_ADMIN_ISSOU\"]', '$2y$13$ysCbqeT.YZwrKfO6m2mta.g/XVD8CsDZU9UdhYovK.BtqRr1NyVbi', 'image@gmail.com', 'c3272966d61231cdcd531386da28e3c9.jpg'),
(13, 'test test', '[]', '$2y$13$zLRcuKkjvBkk.fmSFIXYeeA4RnT1eMigpaHVhrmBYptdfLYWn4d1O', 'testpath@gmail.com', 'fbeb2c7ca905aba428f89ea79cdc1b45.png'),
(14, 'test testclouis', '[]', '$2y$13$Fx/rqFT5RbD5UewR/oVTQeG48Y2t7YS7q4qBDk4mOfqCU/g.8Q9Wq', 'testlogin@gmail.com', '2dfdf386f31f286edb315b9261d2719a.jpg'),
(15, 'test testsclouis', '[]', '$2y$13$vB5D7CJA1M3nzJHLpfnvO.1BFHVL3teMW9PBNlT9XGhQQBJa0Euxy', 'testlogins@gmail.com', '6a1e1e2e2cc21857bcfd39e777f4890b.jpg'),
(16, 'test testssssclouis', '[]', '$2y$13$2HDy6qJnWvjIZE8mODNyHuurK0ojpNQGcxp/GX3ckVVzouFtB3dvy', 'testloginssss@gmail.com', '632a170fba9f6dd4c500111ecc4e1e39.jpg'),
(17, 'test tesstssssclouis', '[]', '$2y$13$u4Q/O1SBJrHwWvOFDSh2beN9i1yT.mBBUHCN4D0D2ewF756djshG2', 'testlogsinssss@gmail.com', '1072fa6372913a634fd7864d471b3a37.jpg'),
(18, 'test tesstsssssclouis', '[]', '$2y$13$6vkwHoFGoT2fBq1kuRjcUunP8U0jfejbschADlBy4gPfsgUCSkeau', 'testlogsinsssss@gmail.com', '6190be021f045d1a56f7a99a48357290.png'),
(19, 'qsdqsdwxcxwcxw', '[]', '$2y$13$Kebs8dk/5drkRZimiJKZJO7sesdsZsjCXugmmAPPcT21PQRWkGqN6', 'louistest1555@gmail.com', 'dff0985ba5a8f6dda424dbaa73fcd9ab.png'),
(20, 'louistest', '[]', '$2y$13$oUZxxtj0i1iEkDVsUM5fAuSDi4.ncpcL3JaFo12fxmF2pwrjjhaem', 'pocheron.louisabcdef@gmail.com', '1e81025166b2c16e0083605b27ef045f.jpg'),
(21, 'louistestsq', '[]', '$2y$13$CKkM5NuRwmrnQZp81nXXQesd.tVlI.r.XKmOmUaOSSYgunaQayPUW', 'pocheron.louisassbcdef@gmail.com', '2e6aee771867e786303996c15bd88e4b.png'),
(22, 'testadminahaha', '[]', '$2y$13$XYkt0K9Zc5jCyBd8nzm0gem84huVMH44CcmCjio769fzxgjP4cwuO', 'testadmin@gmail.com', '557fdf2c0f5e5cc04328ce48a08e7463.png'),
(23, 'testASC', '[]', '$2y$13$O3gZvtNUS7pONQc9Jxx5teSON5WqnXT9bDm0qoQMYyY2tWm.nMy2u', 'testASC@gmail.com', 'a80ee1811bc2e542b59ef7a11c4fdba6.jpg'),
(24, 'ayayaya', '[]', '$2y$13$AvzIbfpZTCmYyQg.vU.wE.tSKzzqkpPBgr2G1i2B8z1Aj58LGqhHi', 'yayayay@gmail.com', '3fc0bc6a0aa1af7bcd099c1fa733eba6.png'),
(25, 'pasadmindutout', '[]', '$2y$13$XImRCj44j5Y0aIyySQyoEuMhQJ0T0kf0HXC4LGwp126JfaAX3CaLm', 'jsuispasadmin@gmail.com', '2edbffb57d1843b727458d8a5b3b5ad1.jpg');

-- --------------------------------------------------------

--
-- Structure de la table `user_associations`
--

CREATE TABLE `user_associations` (
  `user_id` int NOT NULL,
  `associations_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user_associations`
--

INSERT INTO `user_associations` (`user_id`, `associations_id`) VALUES
(4, 8),
(4, 9),
(4, 10),
(4, 12),
(4, 17),
(10, 4),
(10, 7),
(10, 8),
(10, 16),
(22, 17),
(24, 4),
(24, 5),
(24, 7),
(24, 8),
(24, 9),
(24, 10),
(24, 11),
(24, 12),
(24, 14),
(24, 15),
(24, 16),
(24, 17),
(25, 17);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_47CC8C92A76ED395` (`user_id`),
  ADD KEY `IDX_47CC8C92EFB9C8A5` (`association_id`);

--
-- Index pour la table `associations`
--
ALTER TABLE `associations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_8921C4B1A76ED395` (`user_id`);

--
-- Index pour la table `doctrine_migration_versions`
--
ALTER TABLE `doctrine_migration_versions`
  ADD PRIMARY KEY (`version`);

--
-- Index pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_75EA56E016BA31DB` (`delivered_at`);

--
-- Index pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_7CE748AA76ED395` (`user_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- Index pour la table `user_associations`
--
ALTER TABLE `user_associations`
  ADD PRIMARY KEY (`user_id`,`associations_id`),
  ADD KEY `IDX_9EDB8B3A76ED395` (`user_id`),
  ADD KEY `IDX_9EDB8B34122538A` (`associations_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `associations`
--
ALTER TABLE `associations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `FK_47CC8C92A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FK_47CC8C92EFB9C8A5` FOREIGN KEY (`association_id`) REFERENCES `associations` (`id`);

--
-- Contraintes pour la table `associations`
--
ALTER TABLE `associations`
  ADD CONSTRAINT `FK_8921C4B1A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `reset_password_request`
--
ALTER TABLE `reset_password_request`
  ADD CONSTRAINT `FK_7CE748AA76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Contraintes pour la table `user_associations`
--
ALTER TABLE `user_associations`
  ADD CONSTRAINT `FK_9EDB8B34122538A` FOREIGN KEY (`associations_id`) REFERENCES `associations` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `FK_9EDB8B3A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
