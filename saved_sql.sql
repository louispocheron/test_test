-- phpMyAdmin SQL Dump
-- version 4.9.5deb2
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 21 fév. 2022 à 17:32
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
  `ville_depart` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `ville_arrive` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `km` int NOT NULL,
  `raisons` varchar(5000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `heure_depart` datetime DEFAULT NULL,
  `heure_arrivee` datetime DEFAULT NULL,
  `date` date NOT NULL,
  `user_id` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `action`
--

INSERT INTO `action` (`id`, `ville_depart`, `ville_arrive`, `km`, `raisons`, `heure_depart`, `heure_arrivee`, `date`, `user_id`) VALUES
(1, 'Dijon', 'Strasbourg', 300, 'personelles', '1970-01-01 03:00:00', '1970-01-01 08:00:00', '2017-03-01', 4),
(2, 'bourg en bresse', 'arbois', 150, 'test test test tes', '1970-01-01 03:00:00', '1970-01-01 04:05:00', '2019-03-03', 5),
(3, 'une autre ville', 'moncku', 540, 'idk', '1970-01-01 05:00:00', '1970-01-01 05:00:00', '2023-07-04', 5);

-- --------------------------------------------------------

--
-- Structure de la table `associations`
--

CREATE TABLE `associations` (
  `id` int NOT NULL,
  `name` varchar(1000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `logo` varchar(3000) COLLATE utf8mb4_unicode_ci NOT NULL,
  `description` varchar(5000) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `associations`
--

INSERT INTO `associations` (`id`, `name`, `logo`, `description`, `password`) VALUES
(1, 'test', '/tmp/phpJUl5zT', 'lsdkflmsd', 'galardo39'),
(2, 'qsdqsd', '/tmp/phpEi6CAW', 'qsdqsd', 'qsdqsdqs'),
(3, 'test', '/tmp/php2Tg1jU', 'louis', '123456'),
(4, 'fdp', '/tmp/php1uECcW', 'salut', '123456'),
(5, '123456', '/tmp/phpBGzy1W', '123456', 'qsdqsdqsqsdqs');

-- --------------------------------------------------------

--
-- Structure de la table `doctrine_migration_versions`
--

CREATE TABLE `doctrine_migration_versions` (
  `version` varchar(191) COLLATE utf8_unicode_ci NOT NULL,
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
('DoctrineMigrations\\Version20220221134323', '2022-02-21 14:43:27', 86);

-- --------------------------------------------------------

--
-- Structure de la table `messenger_messages`
--

CREATE TABLE `messenger_messages` (
  `id` bigint NOT NULL,
  `body` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `headers` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `available_at` datetime NOT NULL,
  `delivered_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int NOT NULL,
  `username` varchar(180) COLLATE utf8mb4_unicode_ci NOT NULL,
  `roles` json NOT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `username`, `roles`, `password`, `email`) VALUES
(1, 'sdqdqsdqs', '[]', '$2y$13$t0O2GbF.D7/9JbeBYXzIhu7A8fFD/hgWRnY1X9kecx2oV8WZY2XNa', NULL),
(2, 'louistest', '[]', '$2y$13$ClU/kCDDLlN1ONyPosP1pe7106rtxNX0jScwWpoOclzv8gKC1eDwq', 'pocheron.louis@gmail.com'),
(3, 'qsdqsdqsdqdq', '[]', '$2y$13$UDNS2LEhpahye4/X2h4Ukup0N5GO5mqNUqAO5WLoIUzTPZg4E.Wf2', 'qsddqsdqs'),
(4, 'louistest1', '[]', '$2y$13$kk.A2MieB0Q.eT3IdmdN0u.EzUhJ6vZ9kJMINBZNJRSlnqusQsxXK', 'pocheron.louis@gmail.com'),
(5, 'louisrecap', '[]', '$2y$13$15Qzc0VxX//hfhjsQbQ5heAnViAlOoqr5XvhDcuf7iLhHpYx/MOGm', 'test@gmail.com');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `action`
--
ALTER TABLE `action`
  ADD PRIMARY KEY (`id`),
  ADD KEY `IDX_47CC8C92A76ED395` (`user_id`);

--
-- Index pour la table `associations`
--
ALTER TABLE `associations`
  ADD PRIMARY KEY (`id`);

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
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UNIQ_8D93D649F85E0677` (`username`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `action`
--
ALTER TABLE `action`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT pour la table `associations`
--
ALTER TABLE `associations`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `messenger_messages`
--
ALTER TABLE `messenger_messages`
  MODIFY `id` bigint NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `action`
--
ALTER TABLE `action`
  ADD CONSTRAINT `FK_47CC8C92A76ED395` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
