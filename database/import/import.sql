-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 10 avr. 2025 à 15:11
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gestionnaire`
--

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE `etudiant` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `idMoniteur` bigint(11) UNSIGNED DEFAULT NULL,
  `idUser` bigint(11) UNSIGNED DEFAULT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `dateNaissance` date NOT NULL,
  `lieuNaissance` varchar(100) DEFAULT NULL,
  `commune` varchar(100) DEFAULT NULL,
  `num_telephone` varchar(15) NOT NULL,
  `num_telephone_2` varchar(15) DEFAULT NULL,
  `nom_autoEc` varchar(100) NOT NULL DEFAULT 'Patrimone',
  `reduction` tinyint(1) NOT NULL DEFAULT 0,
  `type_piece` varchar(50) NOT NULL,
  `num_piece` varchar(50) NOT NULL,
  `scolarite` decimal(10,2) NOT NULL DEFAULT 0.00,
  `montant_paye` decimal(10,2) NOT NULL DEFAULT 0.00,
  `motif_inscription` enum('permis','recyclage') NOT NULL,
  `categorie` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `etudiant`
--

INSERT INTO `etudiant` (`id`, `idMoniteur`, `idUser`, `nom`, `prenom`, `dateNaissance`, `lieuNaissance`, `commune`, `num_telephone`, `num_telephone_2`, `nom_autoEc`, `reduction`, `type_piece`, `num_piece`, `scolarite`, `montant_paye`, `motif_inscription`, `categorie`, `created_at`, `updated_at`) VALUES
(14, 21, 1, 'Daho', 'Joël Emmanuel', '2003-05-11', NULL, 'Abidjan', '0759957956', NULL, 'PAT', 1, 'CNI', 'CI003002001', 20000.00, 20000.00, 'permis', 'A,B', '2025-01-19 14:45:52', '2025-03-31 22:17:06'),
(19, 21, 1, 'Traore', 'Aicha dramane', '2002-11-11', 'Abidjan', 'Abobo', '0102030201', '0707080809', 'Patrimoine', 0, 'Passeport', '101214', 100000.00, 100000.00, 'permis', 'A,B', '2025-01-21 10:52:20', '2025-03-31 22:16:25'),
(22, 25, 1, 'Ange', 'Carene', '2005-12-20', NULL, 'Tiassale', '0759414534', NULL, 'Patrimoine', 1, 'CNI', 'CI002003004', 20000.00, 20000.00, 'permis', 'B,C,D,E', '2025-03-06 22:35:21', '2025-03-31 22:17:54'),
(23, 25, 2, 'Paul', 'Mirabel', '2000-11-11', NULL, 'Plateau', '0709090900', NULL, 'Patrimoine', 0, 'CNI', 'CI999888777', 150000.00, 150000.00, 'permis', 'A,B,C,D,E', '2025-03-12 22:23:02', '2025-03-31 22:19:22'),
(24, 23, 2, 'Keden', 'Liam', '2006-02-07', NULL, 'Abobo', '0711070805', '0909090910', 'Patrimoine', 1, 'Passeport', '01010022', 20000.00, 20000.00, 'permis', 'A,B,C,D,E', '2025-03-15 14:19:39', '2025-03-31 23:14:13'),
(26, 21, 2, 'Doumbia', 'Moustapha', '2004-01-01', 'Abidjan', 'Ayamma', '0506789876', NULL, 'Patrimoine', 0, 'Carte Consulaire', '1122113242', 150000.00, 150000.00, 'permis', 'A,B,C,D,E', '2025-04-01 15:53:25', '2025-04-03 19:21:16'),
(27, NULL, 2, 'Paul', 'Kagame', '1999-06-12', 'Géniale', 'Plateau', '0759957956', NULL, 'Autre', 0, 'CNI', '01010022', 60000.00, 60000.00, 'recyclage', '', '2025-04-01 17:02:26', '2025-04-02 00:29:23');

-- --------------------------------------------------------

--
-- Structure de la table `logs`
--

CREATE TABLE `logs` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `idUser` bigint(11) UNSIGNED NOT NULL,
  `action` varchar(255) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `table_concernee` varchar(100) NOT NULL,
  `details` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `logs`
--

INSERT INTO `logs` (`id`, `idUser`, `action`, `created_at`, `table_concernee`, `details`) VALUES
(27, 2, 'update', '2025-01-14 13:36:41', 'moniteurs', 'Changements effectués ID: moni-20: specialite: \'code\' -> \'conduite\''),
(28, 2, 'add', '2025-01-14 13:37:02', 'moniteurs', 'Moniteur ajouté : Tra Lou Viviane (ID: 21)'),
(29, 2, 'delete', '2025-01-14 13:37:22', 'moniteurs', 'Moniteur supprimé : PAP Popo (ID: 19)'),
(30, 2, 'update', '2025-01-14 13:38:45', 'moniteurs', 'Changements effectués (ID: moni-20): nom: \'Oui\' -> \'Doum\''),
(31, 2, 'delete', '2025-01-14 14:02:10', 'users', 'Utilisateur supprimé : Emm  (ID: 6)'),
(32, 2, 'delete', '2025-01-14 14:02:30', 'users', 'Utilisateur supprimé : Koffi  (ID: 4)'),
(33, 2, 'delete', '2025-01-14 14:06:26', 'users', 'Utilisateur supprimé : Marie  (ID: 9)'),
(34, 2, 'delete', '2025-01-14 14:08:52', 'users', 'Utilisateur supprimé : Agnès  (ID: 5)'),
(35, 2, 'delete', '2025-01-14 14:09:16', 'users', 'Utilisateur supprimé : Poui  (ID: 8)'),
(36, 2, 'delete', '2025-01-14 14:13:45', 'users', 'Utilisateur supprimé : Doumbas  (ID: 7)'),
(37, 2, 'delete', '2025-01-14 14:42:42', 'moniteurs', 'Moniteur supprimé : Doum IOUBY8 (ID: 20)'),
(38, 2, 'delete', '2025-01-14 16:29:09', 'users', 'Utilisateur supprimé : zd  (ID: 11)'),
(39, 2, 'delete', '2025-01-14 16:29:43', 'users', 'Utilisateur supprimé : fqzgy  (ID: 12)'),
(40, 2, 'delete', '2025-01-14 16:35:31', 'users', 'Utilisateur supprimé : fzefa  (ID: 13)'),
(41, 1, 'delete', '2025-01-14 17:48:53', 'users', 'Utilisateur supprimé : uv u (ID: 14)'),
(42, 1, 'maj', '2025-01-14 17:49:39', 'users', 'Utilisateur modifié : Dupont Jean Michel (ID: 1). Modifications : {\"prenom\":\"Jean Michel\"}'),
(43, 1, 'maj', '2025-01-14 17:54:08', 'users', 'Utilisateur modifié : Dupont Jean (ID: 1). Modifications : {\"prenom\":\"Jean\"}'),
(44, 1, 'update', '2025-01-14 17:57:13', 'moniteurs', 'Changements effectués (ID: moni-21): nom: \'Tra Lou\' -> \'Tra Lou Nan\''),
(45, 1, 'create', '2025-01-14 19:23:19', 'users', 'Nouvel utilisateur ajouté : Paulo Orminga (ID: 16, )'),
(46, 1, 'add', '2025-01-14 19:31:37', 'moniteurs', 'Moniteur ajouté : Daho Delo (ID: 22)'),
(47, 1, 'create', '2025-01-14 19:32:38', 'users', 'Nouvel utilisateur ajouté : Hubert London (ID: 17, rôle : Admin)'),
(48, 1, 'create', '2025-01-14 19:33:33', 'users', 'Nouvel utilisateur ajouté : Noura Tajudine (ID: 18, Staff)'),
(49, 1, 'maj', '2025-01-14 20:13:52', 'users', 'Utilisateur modifié : Joel Daho (ID: 2). Modifications : {\"prenom\":\"Daho\"}'),
(50, 1, 'maj', '2025-01-14 20:14:43', 'users', 'Utilisateur modifié : Daho Joel (ID: 2). Modifications : {\"nom\":\"Daho\",\"prenom\":\"Joel\"}'),
(51, 2, 'update', '2025-01-16 13:55:29', 'moniteurs', 'Changements effectués (ID: moni-21): nom: \'Tra Lou Nan\' -> \'Tra\''),
(52, 2, 'maj', '2025-01-16 13:56:03', 'users', 'Changements effectués (ID: 15): pseudo: \'pa\' -> \'paAnd\''),
(53, 2, 'add', '2025-01-17 18:11:45', 'etudiants', 'Etudiant ajouté : EMMA DAHO (ID: 5)'),
(54, 2, 'add', '2025-01-18 11:33:53', 'etudiants', 'Etudiant ajouté : Samie Papa (ID: 11)'),
(55, 2, 'add', '2025-01-18 13:17:08', 'etudiants', 'Etudiant ajouté : EMMA DAHO (ID: 12)'),
(56, 1, 'delete', '2025-01-18 19:20:37', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 1)'),
(57, 1, 'delete', '2025-01-18 19:20:44', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 2)'),
(58, 1, 'delete', '2025-01-18 19:20:47', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 3)'),
(59, 1, 'delete', '2025-01-18 19:20:49', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 4)'),
(60, 1, 'delete', '2025-01-18 19:20:53', 'etudiants', 'Étudiant supprimé : EMMA DAHO (ID: 5)'),
(61, 1, 'delete', '2025-01-18 19:20:56', 'etudiants', 'Étudiant supprimé : Paula Makiato (ID: 6)'),
(62, 1, 'delete', '2025-01-18 19:21:00', 'etudiants', 'Étudiant supprimé : Samie Papa (ID: 9)'),
(63, 1, 'delete', '2025-01-18 19:21:03', 'etudiants', 'Étudiant supprimé : Prat Bill (ID: 8)'),
(64, 1, 'delete', '2025-01-18 19:21:05', 'etudiants', 'Étudiant supprimé : Prat Bill (ID: 7)'),
(65, 1, 'delete', '2025-01-18 19:21:08', 'etudiants', 'Étudiant supprimé : Doe John (ID: 10)'),
(66, 1, 'add', '2025-01-18 19:22:52', 'etudiants', 'Etudiant ajouté : Ango Paul Mirabel (ID: 13)'),
(67, 1, 'update', '2025-01-19 10:33:47', 'etudiants', 'Changements pour l\'étudiant ID 13 : {\"nom\":\"Ango Ango\",\"updated_at\":\"2025-01-19 10:33:47\"}'),
(68, 1, 'update', '2025-01-19 10:42:54', 'etudiants', 'Changements effectués (ID: etu-13): nom: \'Ango Ango\' -> \'Ango\''),
(69, 1, 'update', '2025-01-19 10:51:01', 'etudiants', 'Changements effectués (ID: etu-12): progression: \'inscription\' -> \'visite_médicale\''),
(70, 1, 'update', '2025-01-19 10:55:50', 'etudiants', 'Changements effectués (ID: etu-11): progression: \'inscription\' -> \'visite_médicale\''),
(71, 1, 'update', '2025-01-19 10:56:01', 'etudiants', 'Changements effectués (ID: etu-12): nom: \'EMMA\' -> \'EMMANUEL\''),
(72, 1, 'update', '2025-01-19 11:09:31', 'etudiants', 'Changements effectués (ID: etu-11): progression: \'visite_médicale\' -> \'examen_de_conduite\''),
(73, 1, 'delete', '2025-01-19 11:12:32', 'etudiants', 'Étudiant supprimé : Samie Papa (ID: 11)'),
(74, 1, 'add', '2025-01-19 14:45:52', 'etudiants', 'Etudiant ajouté : Daho Joël Emmanuel (ID: 14)'),
(75, 1, 'delete', '2025-01-19 14:50:36', 'etudiants', 'Étudiant supprimé : Ango Paul Mirabel (ID: 13)'),
(76, 1, 'delete', '2025-01-19 14:50:40', 'etudiants', 'Étudiant supprimé : EMMANUEL DAHO (ID: 12)'),
(77, 1, 'add', '2025-01-19 15:23:01', 'etudiants', 'Etudiant ajouté : Paul Eka (ID: 15)'),
(78, 1, 'add', '2025-01-19 15:27:24', 'etudiants', 'Etudiant ajouté : Daho Joël Emmanuel (ID: 16)'),
(79, 1, 'add', '2025-01-19 15:28:51', 'etudiants', 'Etudiant ajouté : Daho Joël Emmanuel (ID: 17)'),
(80, 1, 'delete', '2025-01-19 15:29:13', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 17)'),
(81, 1, 'delete', '2025-01-19 15:29:16', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 16)'),
(82, 1, 'delete', '2025-01-19 15:29:24', 'etudiants', 'Étudiant supprimé : Paul Eka (ID: 15)'),
(83, 1, 'add', '2025-01-19 15:38:50', 'etudiants', 'Etudiant ajouté : Daho Joël Emmanuel (ID: 18)'),
(84, 1, 'update', '2025-01-20 10:18:02', 'etudiants', 'Changements effectués (ID: etu-14): progression: \'inscription\' -> \'visite_médicale\''),
(85, 1, 'add', '2025-01-21 10:52:20', 'etudiants', 'Etudiant ajouté : Traore Aicha dramane (ID: 19)'),
(86, 1, 'update', '2025-01-21 16:03:21', 'etudiants', 'montant_paye: \'90000.00\' -> \'95000\', Montant payé: \'90000.00\' -> \'95000\''),
(87, 1, 'update', '2025-01-21 16:07:07', 'etudiants', 'montant_paye: \'95000.00\' -> \'97100\', Montant payé: \'95000.00\' -> \'97100\''),
(88, 1, 'update', '2025-01-21 16:07:41', 'etudiants', 'montant_paye: \'97100.00\' -> \'97900\''),
(89, 1, 'add', '2025-01-21 16:17:08', 'etudiants', 'Etudiant ajouté : Abigail Alimata (ID: 20)'),
(90, 1, 'add', '2025-01-23 15:03:15', 'moniteurs', 'Moniteur ajouté : Ango Pierre (ID: 23)'),
(91, 1, 'update', '2025-01-23 15:13:10', 'etudiants', 'montant_paye: \'40000.00\' -> \'40000\''),
(92, 1, 'update', '2025-01-23 15:20:59', 'etudiants', 'montant_paye: \'40000.00\' -> \'40000\''),
(93, 1, 'update', '2025-01-23 15:43:18', 'etudiants', 'montant_paye: \'20000.00\' -> \'20000\''),
(94, 1, 'update', '2025-01-23 15:47:08', 'etudiants', 'montant_paye: \'40000.00\' -> \'40000\''),
(95, 1, 'delete', '2025-01-23 15:48:21', 'etudiants', 'Étudiant supprimé : Daho Joël Emmanuel (ID: 18)'),
(96, 1, 'add', '2025-01-23 15:58:33', 'moniteurs', 'Moniteur ajouté : Traore Comparore (ID: 24)'),
(97, 1, 'add', '2025-01-23 16:11:17', 'moniteurs', 'Moniteur ajouté : Traore Alimata (ID: 25)'),
(98, 1, 'update', '2025-01-23 16:26:11', 'moniteurs', 'Changements effectués (ID: moni-21): nom: \'Tra\' -> \'Tra Lou\''),
(99, 1, 'delete', '2025-01-23 16:36:38', 'moniteurs', 'Moniteur supprimé : Daho Delo (ID: 22)'),
(100, 1, 'add', '2025-01-23 16:48:58', 'etudiants', 'Etudiant ajouté : gvuhjk bhbjkn (ID: 21)'),
(101, 1, 'delete', '2025-01-23 16:54:19', 'etudiants', 'Étudiant supprimé : gvuhjk bhbjkn (ID: 21)'),
(102, 1, 'update', '2025-01-23 16:58:40', 'etudiants', 'montant_paye: \'40000.00\' -> \'60000\''),
(103, 1, 'update', '2025-01-23 17:24:03', 'etudiants', 'montant_paye: \'97900.00\' -> \'97900\''),
(104, 1, 'update', '2025-01-23 18:09:37', 'etudiants', 'Moniteur modifié !'),
(105, 1, 'update', '2025-01-23 18:16:18', 'etudiants', 'Moniteur modifié !'),
(106, 1, 'update', '2025-01-23 18:17:17', 'etudiants', 'Montant payé : \'97900\' -> \'100000\''),
(107, 1, 'add', '2025-01-30 17:51:28', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 19, type: conduite.'),
(108, 1, 'add', '2025-01-30 18:33:48', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: code.'),
(109, 1, 'update', '2025-02-06 15:22:23', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 19.'),
(110, 1, 'update', '2025-02-06 15:33:52', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 14.'),
(111, 1, 'add', '2025-02-06 15:34:32', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: code.'),
(112, 1, 'update', '2025-02-06 15:42:26', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 14.'),
(113, 1, 'add', '2025-02-06 16:00:11', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 19, type: code.'),
(114, 1, 'update', '2025-02-06 16:00:34', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 19.'),
(115, 1, 'add', '2025-02-06 16:24:50', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 20, type: code.'),
(116, 1, 'delete', '2025-02-07 19:46:12', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 14.'),
(117, 1, 'delete', '2025-02-07 19:47:13', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 14.'),
(118, 1, 'add', '2025-02-07 20:09:17', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: conduite.'),
(119, 1, 'update', '2025-02-07 20:09:32', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 20.'),
(120, 1, 'delete', '2025-02-07 20:12:17', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 20.'),
(121, 1, 'delete', '2025-02-07 20:12:25', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 14.'),
(122, 1, 'add', '2025-02-07 20:13:03', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: code.'),
(123, 1, 'update', '2025-02-07 20:13:16', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 14.'),
(124, 1, 'delete', '2025-02-07 20:15:47', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 14.'),
(125, 1, 'add', '2025-02-07 20:15:59', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: code.'),
(126, 1, 'update', '2025-02-07 20:17:09', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 14.'),
(127, 1, 'add', '2025-02-07 20:19:51', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: conduite.'),
(128, 1, 'update', '2025-02-07 20:20:08', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 14.'),
(129, 1, 'delete', '2025-02-07 20:20:18', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 14.'),
(130, 1, 'add', '2025-02-08 10:39:27', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 14, type: conduite.'),
(131, 1, 'update', '2025-02-08 10:40:58', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 14.'),
(132, 1, 'add', '2025-03-06 14:04:47', 'programmations', 'Nouvelle programmation ajoutée : 2025-03-08 (code).'),
(133, 1, 'add', '2025-03-06 14:24:28', 'programmations', 'Nouvelle programmation ajoutée : 2025-03-10 (conduite).'),
(134, 1, 'delete', '2025-03-06 14:42:45', 'users', 'Utilisateur supprimé : Hubert London (ID: 17)'),
(135, 1, 'delete', '2025-03-06 15:56:41', 'users', 'Utilisateur supprimé : Noura Tajudine (ID: 18)'),
(136, 1, 'add', '2025-03-06 22:35:21', 'etudiants', 'Etudiant ajouté : Ange Carene (ID: 22)'),
(137, 1, 'maj', '2025-03-09 23:51:07', 'users', 'Changements effectués (ID: 15): '),
(138, 2, 'delete', '2025-03-11 13:57:59', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 14.'),
(139, 2, 'delete', '2025-03-11 13:58:19', 'users', 'Utilisateur supprimé : Paulo Orminga (ID: 16)'),
(140, 2, 'delete', '2025-03-11 13:58:40', 'moniteurs', 'Moniteur supprimé : Traore Comparore (ID: 24)'),
(141, 2, 'delete', '2025-03-11 14:04:46', 'users', 'Utilisateur supprimé : Paula Andersen (ID: 15)'),
(142, 2, 'create', '2025-03-11 14:05:18', 'users', 'Nouvel utilisateur ajouté : aaa aaa (ID: 19, Staff)'),
(143, 2, 'delete', '2025-03-11 14:05:21', 'users', 'Utilisateur supprimé : aaa aaa (ID: 19)'),
(144, 2, 'create', '2025-03-11 14:15:56', 'users', 'Nouvel utilisateur ajouté : aaa aaa (ID: 20, Staff)'),
(145, 2, 'add', '2025-03-12 22:23:03', 'etudiants', 'Etudiant ajouté : Paul Mirabel (ID: 23)'),
(146, 2, 'add', '2025-03-15 14:19:39', 'etudiants', 'Etudiant ajouté : Keden Liam (ID: 24)'),
(147, 2, 'add', '2025-03-17 23:14:05', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 24, type: code.'),
(148, 2, 'delete', '2025-03-17 23:16:35', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 19.'),
(149, 2, 'add', '2025-03-18 14:45:49', 'etudiants', 'Etudiant ajouté : test test (ID: 25)'),
(150, 2, 'delete', '2025-03-18 14:45:56', 'etudiants', 'Étudiant supprimé : test test (ID: 25)'),
(151, 2, 'add', '2025-03-18 18:13:51', 'rappels', 'Rappel créé : Carnet (ID: 1)'),
(152, 2, 'add', '2025-03-18 18:27:30', 'rappels', 'Rappel créé : Entretien du véhicule (ID: 2)'),
(153, 2, 'add', '2025-03-18 18:28:45', 'rappels', 'Rappel créé : Loyer (ID: 3)'),
(154, 2, 'add', '2025-03-20 14:36:06', 'rappels', 'Rappel créé : Rappel Sono (ID: 4)'),
(155, 2, 'add', '2025-03-20 14:50:02', 'rappels', 'Rappel créé : atfuzy (ID: 5)'),
(156, 2, 'add', '2025-03-20 14:52:22', 'rappels', 'Rappel créé : Carnet (ID: 6)'),
(157, 2, 'delete', '2025-03-20 15:42:58', 'rappels', 'Rappel supprimé : Entretien du véhicule (ID: 2)'),
(158, 2, 'add', '2025-03-20 15:44:55', 'rappels', 'Rappel créé : Entretien du véhicule (ID: 7)'),
(159, 2, 'update', '2025-03-20 19:41:20', 'rappels', 'Rappel modifié (ID: 6): titre: \'Carnet\' -> \'Carnet 2\''),
(160, 2, 'update', '2025-03-20 19:41:35', 'rappels', 'Rappel modifié (ID: 6): titre: \'Carnet 2\' -> \'Carnet 223\''),
(161, 2, 'update', '2025-03-20 19:46:40', 'rappels', 'Rappel modifié (ID: 6): priorite: \'basse\' -> \'moyenne\''),
(162, 2, 'update', '2025-03-20 19:46:41', 'rappels', 'Rappel modifié (ID: 6): priorite: \'moyenne\' -> \'élevée\''),
(163, 2, 'update', '2025-03-20 19:52:07', 'rappels', 'Rappel modifié (ID: 7): priorite: \'basse\' -> \'moyenne\''),
(164, 2, 'delete', '2025-03-20 21:39:44', 'rappels', 'Rappel supprimé : atfuzy (ID: 5) Statut: 1'),
(165, 2, 'delete', '2025-03-20 21:42:32', 'rappels', 'Rappel supprimé : Rappel Sono (ID: 4) Statut: Terminé'),
(166, 2, 'delete', '2025-03-20 21:42:53', 'rappels', 'Rappel supprimé : Loyer (ID: 3) Statut: En cours'),
(167, 2, 'update', '2025-03-20 21:44:12', 'rappels', 'Rappel modifié (ID: 6): statut: \'0\' -> \'1\''),
(168, 2, 'update', '2025-03-20 21:46:42', 'rappels', 'Rappel modifié (ID: 7): statut: \'0\' -> \'1\''),
(169, 2, 'add', '2025-03-20 22:23:19', 'programmations', 'Programmation ajoutée : 2025-03-30 (code).'),
(170, 2, 'delete', '2025-03-26 22:14:35', 'rappels', 'Rappel supprimé : Inactivité détectée pour Traore Aicha dramane (ID: 19) (ID: 8) Statut: En cours'),
(171, 2, 'delete', '2025-03-26 22:14:41', 'rappels', 'Rappel supprimé : Inactivité détectée pour Traore Aicha dramane (ID: 19) (ID: 10) Statut: En cours'),
(172, 2, 'delete', '2025-03-26 22:14:46', 'rappels', 'Rappel supprimé : Examen prévu le 2025-03-30 (ID: 9) Statut: En cours'),
(173, 2, 'update', '2025-03-26 23:21:59', 'resultats', 'Résultat mis à jour pour l\'étudiant ID: 24.'),
(174, 2, 'update', '2025-03-28 22:52:49', 'etudiants', 'Keden Liam (ID: 24)Montant payé complété : \'19400\' -> \'19600\''),
(175, 2, 'update', '2025-03-28 23:00:08', 'etudiants', 'Keden Liam (ID: 24) Prénom(s) modifié : \'Liam Paul\' -> \'Liam\''),
(176, 2, 'update', '2025-03-28 23:01:15', 'etudiants', 'Traore Aicha dramane (ID: 19) Numéro de téléphone sécondaire modifié : \'\' -> \'0707080809\''),
(177, 2, 'maj', '2025-03-28 23:32:26', 'users', 'Changements effectués (ID: 1): '),
(178, 2, 'update', '2025-03-29 01:20:34', 'rappels', 'Rappel modifié (ID: 1): statut: \'0\' -> \'1\''),
(179, 2, 'update', '2025-03-29 01:20:34', 'rappels', 'Rappel modifié (ID: 1): statut: \'1\' -> \'1\''),
(180, 1, 'delete', '2025-03-29 02:11:16', 'etudiants', 'Étudiant supprimé : Abigail Alimata(ID: 20)'),
(181, 2, 'update', '2025-03-31 22:16:44', 'etudiants', 'Keden Liam (ID: 24) Moniteur modifié !, Moniteur modifié : \'25\' -> \'23\''),
(182, 2, 'update', '2025-03-31 22:19:22', 'etudiants', 'Paul Mirabel (ID: 23) Moniteur modifié !, Moniteur modifié : \'\' -> \'25\''),
(183, 2, 'update', '2025-03-31 23:14:13', 'etudiants', 'Keden Liam (ID: 24) Montant payé complété : \'19600\' -> \'20000\''),
(184, 2, 'add', '2025-04-01 15:53:25', 'etudiants', 'Etudiant ajouté : Doumbia Moustapha (ID: 26)'),
(185, 2, 'add', '2025-04-01 17:02:26', 'etudiants', 'Etudiant ajouté : Paul Kagame (ID: 27)'),
(186, 2, 'add', '2025-04-01 22:50:13', 'rappels', 'Rappel créé : Achat de chaise (ID: 11)'),
(187, 2, 'update', '2025-04-02 23:22:02', 'etudiants', 'Modification pour Doumbia Moustapha (ID: 26) Montant payé complété : \'140000.00\' -> \'142000\''),
(188, 2, 'update', '2025-04-03 19:21:16', 'etudiants', 'Modification pour Doumbia Moustapha (ID: 26) Moniteur modifié, Montant payé complété : \'142000.00\' -> \'150000\', Moniteur modifié : \'\' -> \'21\''),
(189, 2, 'add', '2025-04-03 22:15:33', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 24, type: conduite.'),
(190, 2, 'add', '2025-04-03 22:33:04', 'programmations', 'Programmation ajoutée : 2025-04-13 (conduite).'),
(191, 2, 'add', '2025-04-03 22:44:34', 'programmations', 'Programmation ajoutée : 2025-04-06 (conduite).'),
(192, 2, 'delete', '2025-04-07 00:01:48', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 24.'),
(193, 2, 'add', '2025-04-07 00:06:14', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 24, type: conduite.'),
(194, 2, 'delete', '2025-04-07 00:19:24', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 24.'),
(195, 2, 'add', '2025-04-07 00:26:27', 'resultats', 'Résultat ajouté pour l\'étudiant ID: 24, type: conduite.'),
(196, 2, 'delete', '2025-04-07 00:36:00', 'resultats', 'Résultat supprimé pour l\'étudiant ID: 24.');

-- --------------------------------------------------------

--
-- Structure de la table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `moniteurs`
--

CREATE TABLE `moniteurs` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `specialite` enum('code','conduite') NOT NULL,
  `created_at` timestamp NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `moniteurs`
--

INSERT INTO `moniteurs` (`id`, `nom`, `prenom`, `specialite`, `created_at`, `updated_at`) VALUES
(21, 'Tra Lou', 'Viviane', 'code', '2025-01-14 13:37:02', '2025-01-23 16:26:11'),
(23, 'Ango', 'Pierre', 'conduite', '2025-01-23 15:03:15', '2025-01-23 15:03:15'),
(25, 'Traore', 'Alimata', 'code', '2025-01-23 16:11:17', '2025-01-23 16:11:17');

-- --------------------------------------------------------

--
-- Structure de la table `programmations`
--

CREATE TABLE `programmations` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `idUser` bigint(11) UNSIGNED NOT NULL,
  `type` enum('code','conduite') NOT NULL,
  `fichier_pdf` varchar(255) NOT NULL,
  `date_prog` date DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `programmations`
--

INSERT INTO `programmations` (`id`, `idUser`, `type`, `fichier_pdf`, `date_prog`, `created_at`, `updated_at`) VALUES
(1, 1, 'code', 'programmations/Prog-code-2025-03-08.pdf', '2025-03-08', '2025-03-06 14:04:46', '2025-03-06 14:04:46'),
(2, 1, 'conduite', 'programmations/Prog-conduite-2025-03-10.pdf', '2025-03-10', '2025-03-06 14:24:28', '2025-03-06 14:24:28'),
(3, 2, 'code', 'programmations/Prog-code-2025-03-30.pdf', '2025-03-30', '2025-03-20 22:23:19', '2025-03-20 22:23:19'),
(4, 2, 'conduite', 'programmations/Prog-conduite-2025-04-13.pdf', '2025-04-13', '2025-04-03 22:33:04', '2025-04-03 22:33:04'),
(5, 2, 'conduite', 'programmations/Prog-conduite-2025-04-06.pdf', '2025-04-06', '2025-04-03 22:44:34', '2025-04-03 22:44:34');

-- --------------------------------------------------------

--
-- Structure de la table `progression`
--

CREATE TABLE `progression` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `idEtudiant` bigint(11) UNSIGNED NOT NULL,
  `etape` enum('inscription','visite_médicale','cours_de_code','examen_de_code','cours_de_conduite','examen_de_conduite') NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `progression`
--

INSERT INTO `progression` (`id`, `idEtudiant`, `etape`, `created_at`, `updated_at`) VALUES
(4, 14, 'examen_de_conduite', '2025-01-19 14:45:52', '2025-03-31 22:17:06'),
(9, 19, 'examen_de_code', '2025-01-21 10:52:20', '2025-03-31 22:16:25'),
(12, 22, 'examen_de_conduite', '2025-03-06 22:35:21', '2025-03-31 22:17:54'),
(13, 23, 'cours_de_code', '2025-03-12 22:23:03', '2025-03-31 22:19:22'),
(14, 24, 'cours_de_conduite', '2025-03-15 14:19:39', '2025-03-31 22:16:43'),
(16, 26, 'cours_de_code', '2025-04-01 15:53:25', '2025-04-03 19:21:16'),
(17, 27, 'inscription', '2025-04-01 17:02:26', '2025-04-01 17:02:26');

-- --------------------------------------------------------

--
-- Structure de la table `rappels`
--

CREATE TABLE `rappels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUser` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date_rappel` date NOT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priorite` enum('basse','moyenne','élevée') DEFAULT 'basse',
  `statut` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rappels`
--

INSERT INTO `rappels` (`id`, `idUser`, `titre`, `description`, `date_rappel`, `type`, `priorite`, `statut`, `created_at`, `updated_at`) VALUES
(1, 2, 'Carnet', NULL, '2025-03-20', 'Achat', 'basse', 1, '2025-03-18 18:13:51', '2025-03-29 01:20:34'),
(6, 2, 'Carnet 223', 'eadsq', '2025-03-30', 'Entretien', 'élevée', 1, '2025-03-20 14:52:22', '2025-03-20 21:44:12'),
(7, 2, 'Entretien du véhicule', 'zvdyasu', '2025-04-05', 'Entretien', 'moyenne', 1, '2025-03-20 15:44:55', '2025-03-20 21:46:42'),
(11, 2, 'Achat de chaise', '20 chaises pour salle de code', '2025-04-06', 'Achat', 'moyenne', 1, '2025-04-01 22:50:13', '2025-04-06 21:23:14');

-- --------------------------------------------------------

--
-- Structure de la table `rappels_imp`
--

CREATE TABLE `rappels_imp` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `idUser` bigint(20) UNSIGNED NOT NULL,
  `titre` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `date_rappel` date DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `priorite` enum('basse','moyenne','élevée') DEFAULT 'basse',
  `statut` tinyint(1) DEFAULT 0,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Déchargement des données de la table `rappels_imp`
--

INSERT INTO `rappels_imp` (`id`, `idUser`, `titre`, `description`, `date_rappel`, `type`, `priorite`, `statut`, `created_at`, `updated_at`) VALUES
(9, 2, 'Paiement en attente pour Keden Liam (ID: 24)', 'L\'étudiant(e) n\'a pas encore soldé.', '2025-03-27', 'paiement', 'élevée', 1, '2025-03-26 22:38:42', '2025-04-02 00:29:23'),
(13, 2, 'Paiement en attente pour Keden Liam (ID: 24)', 'L\'étudiant(e) n\'a pas encore soldé.', NULL, 'paiement', 'élevée', 1, '2025-03-26 22:45:35', '2025-04-02 00:29:23'),
(17, 2, 'Paiement en attente pour Keden Liam (ID: 24)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 5000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-03-26 23:16:00', '2025-04-02 00:29:23'),
(19, 2, 'Paiement en attente pour Keden Liam (ID: 24)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 400 FCFA', NULL, 'paiement', 'élevée', 1, '2025-03-29 01:15:52', '2025-04-02 00:29:23'),
(20, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 50000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-01 16:04:01', '2025-04-02 00:29:23'),
(21, 2, 'Paiement en attente pour Paul Kagame (ID: 27)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 20000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-01 17:03:01', '2025-04-02 00:29:23'),
(22, 2, 'Paiement en attente pour Paul Kagame (ID: 27)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 1 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 00:18:01', '2025-04-02 00:29:23'),
(23, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 50000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 00:30:01', '2025-04-03 19:21:16'),
(24, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 40000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 22:50:01', '2025-04-03 19:21:16'),
(25, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 140000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 23:04:01', '2025-04-03 19:21:16'),
(26, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 30000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 23:13:02', '2025-04-03 19:21:16'),
(27, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 20000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 23:14:01', '2025-04-03 19:21:16'),
(28, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 10000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 23:15:01', '2025-04-03 19:21:16'),
(29, 2, 'Paiement en attente pour Doumbia Moustapha (ID: 26)', 'L\'étudiant(e) n\'a pas encore soldé. Reste à payer: 8000 FCFA', NULL, 'paiement', 'élevée', 1, '2025-04-02 23:23:01', '2025-04-03 19:21:16'),
(32, 2, 'Examen prévu le 2025-04-06', 'Un examen est programmé à cette date. Type: conduite', '2025-04-06', 'examen', 'moyenne', 1, '2025-04-03 22:45:01', '2025-04-06 23:39:47'),
(47, 2, 'Examen prévu le 2025-04-13', 'Un examen est programmé à cette date. Type: conduite', '2025-04-13', 'examen', 'moyenne', 0, '2025-04-07 00:12:01', '2025-04-07 00:12:01'),
(48, 2, 'Résultat non retiré pour Keden Liam', 'L\'étudiant(e) doit récupérer son résultat.', NULL, 'résultat', 'moyenne', 1, '2025-04-07 00:12:01', '2025-04-07 00:36:00');

-- --------------------------------------------------------

--
-- Structure de la table `resultats`
--

CREATE TABLE `resultats` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `idEtudiant` bigint(11) UNSIGNED NOT NULL,
  `idUser` bigint(11) UNSIGNED NOT NULL,
  `libelle` varchar(100) NOT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `resultats`
--

INSERT INTO `resultats` (`id`, `idEtudiant`, `idUser`, `libelle`, `statut`, `created_at`, `updated_at`) VALUES
(1, 19, 1, 'conduite', 1, '2025-01-30 17:51:28', '2025-02-06 15:22:23'),
(10, 14, 1, 'conduite', 1, '2025-02-08 10:39:27', '2025-02-08 10:40:58'),
(11, 24, 2, 'code', 1, '2025-03-17 23:14:05', '2025-03-26 23:21:59');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

CREATE TABLE `users` (
  `id` bigint(11) UNSIGNED NOT NULL,
  `nom` varchar(100) NOT NULL,
  `prenom` varchar(100) NOT NULL,
  `pseudo` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `pseudo`, `password`, `role`) VALUES
(1, 'Dupont', 'Jean', 'jdupont', '$2y$10$m5WwATjCL5yCVG2J4T0f5eX.tXumjI.JPJljjhBLBggLtR5gZrYG.', 1),
(2, 'Daho', 'Joel', 'jjoel', '$2y$10$tXTluaF6ezWRxg/UQ9FUt.tO0lnqLE/Yist.sNb6H2zld8tvYZTXG', 1),
(20, 'aaa', 'aaa', 'aaa', '$2y$10$Or5biw9BtOmBVNIdyLSKwuo8VdemkCP8CfrxS12f2MCDijYZ8CLou', 0);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idMoniteur` (`idMoniteur`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `moniteurs`
--
ALTER TABLE `moniteurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `programmations`
--
ALTER TABLE `programmations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_programmations_user` (`idUser`);

--
-- Index pour la table `progression`
--
ALTER TABLE `progression`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEtudiant` (`idEtudiant`);

--
-- Index pour la table `rappels`
--
ALTER TABLE `rappels`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `rappels_imp`
--
ALTER TABLE `rappels_imp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `resultats`
--
ALTER TABLE `resultats`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idEtudiant` (`idEtudiant`),
  ADD KEY `idUser` (`idUser`);

--
-- Index pour la table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `etudiant`
--
ALTER TABLE `etudiant`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT pour la table `logs`
--
ALTER TABLE `logs`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT pour la table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `moniteurs`
--
ALTER TABLE `moniteurs`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT pour la table `programmations`
--
ALTER TABLE `programmations`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `progression`
--
ALTER TABLE `progression`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT pour la table `rappels`
--
ALTER TABLE `rappels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT pour la table `rappels_imp`
--
ALTER TABLE `rappels_imp`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT pour la table `resultats`
--
ALTER TABLE `resultats`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT pour la table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`idMoniteur`) REFERENCES `moniteurs` (`id`) ON DELETE SET NULL,
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE SET NULL;

--
-- Contraintes pour la table `logs`
--
ALTER TABLE `logs`
  ADD CONSTRAINT `logs_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `programmations`
--
ALTER TABLE `programmations`
  ADD CONSTRAINT `fk_programmations_user` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `progression`
--
ALTER TABLE `progression`
  ADD CONSTRAINT `progression_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rappels`
--
ALTER TABLE `rappels`
  ADD CONSTRAINT `rappels_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `rappels_imp`
--
ALTER TABLE `rappels_imp`
  ADD CONSTRAINT `rappels_imp_ibfk_1` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Contraintes pour la table `resultats`
--
ALTER TABLE `resultats`
  ADD CONSTRAINT `resultats_ibfk_1` FOREIGN KEY (`idEtudiant`) REFERENCES `etudiant` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `resultats_ibfk_2` FOREIGN KEY (`idUser`) REFERENCES `users` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
