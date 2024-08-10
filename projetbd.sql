-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : lun. 20 mai 2024 à 17:49
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `projetbd`
--

-- --------------------------------------------------------

--
-- Structure de la table `assistant`
--

CREATE TABLE `assistant` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `assistant`
--

INSERT INTO `assistant` (`ID`) VALUES
(2),
(9);

-- --------------------------------------------------------

--
-- Structure de la table `candidate`
--

CREATE TABLE `candidate` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `candidate`
--

INSERT INTO `candidate` (`ID`) VALUES
(0),
(3),
(4),
(5),
(6),
(7),
(10),
(11),
(12),
(13),
(14),
(15),
(16),
(17),
(18),
(19);

-- --------------------------------------------------------

--
-- Structure de la table `episode`
--

CREATE TABLE `episode` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TITLE` varchar(27) NOT NULL,
  `AIRDATE` date NOT NULL,
  `WINNER_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `episode`
--

INSERT INTO `episode` (`SERIES_NAME`, `EPISODE_NUMBER`, `TITLE`, `AIRDATE`, `WINNER_ID`) VALUES
('Series 1 (NZ)', 1, 'Gluten Free', '2020-10-21', 11),
('Series 1 (NZ)', 2, 'A Political Hotcake', '2020-10-28', 14),
('Series 1 (NZ)', 3, 'D.A.P.', '2020-11-04', 11),
('Series 1 (NZ)', 4, 'I\'m Queer, I\'m Here', '2020-11-11', 12),
('Series 1 (NZ)', 5, 'Unhealth must be dead', '2020-11-18', 11),
('Series 1 (NZ)', 6, 'The problem is me', '2020-11-25', 10),
('Series 1 (NZ)', 7, 'An Intervention', '2020-12-02', 13),
('Series 1 (NZ)', 8, 'Sweaty socks and depression', '2020-12-09', 10),
('Series 1 (NZ)', 9, 'Astro blasters', '2020-12-16', 13),
('Series 1 (NZ)', 10, 'My Uncle John', '2020-12-23', 14),
('Series 1 (UK)', 1, 'Melon buffet', '2015-07-28', 3),
('Series 1 (UK)', 2, 'The pie whisperer', '2015-08-04', 5),
('Series 1 (UK)', 3, 'The poet and the egg', '2015-08-11', 4),
('Series 1 (UK)', 4, 'Down an octave', '2015-08-18', 4),
('Series 1 (UK)', 5, 'Little denim shorts', '2015-08-25', 3),
('Series 1 (UK)', 6, 'The last supper', '2015-09-01', 7),
('Series 3 (UK)', 1, 'A pea in a haystrack', '2016-10-04', 15),
('Series 3 (UK)', 2, 'The dong and the gong', '2016-10-11', 18),
('Series 3 (UK)', 3, 'Little polythene grief cave', '2016-10-18', 17),
('Series 3 (UK)', 4, 'A very nuanced character', '2016-10-25', 16),
('Series 3 (UK)', 5, 'The F.I.P.', '2016-11-01', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `feature`
--

CREATE TABLE `feature` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `CANDIDATE_ID` int(11) NOT NULL,
  `CHAIR` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `feature`
--

INSERT INTO `feature` (`SERIES_NAME`, `CANDIDATE_ID`, `CHAIR`) VALUES
('Series 1 (NZ)', 10, 1),
('Series 1 (NZ)', 11, 2),
('Series 1 (NZ)', 12, 3),
('Series 1 (NZ)', 13, 4),
('Series 1 (NZ)', 14, 5),
('Series 1 (UK)', 3, 1),
('Series 1 (UK)', 4, 2),
('Series 1 (UK)', 5, 3),
('Series 1 (UK)', 6, 4),
('Series 1 (UK)', 7, 5),
('Series 3 (UK)', 15, 1),
('Series 3 (UK)', 16, 2),
('Series 3 (UK)', 17, 3),
('Series 3 (UK)', 18, 4),
('Series 3 (UK)', 19, 5);

-- --------------------------------------------------------

--
-- Structure de la table `individualtask`
--

CREATE TABLE `individualtask` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TASK_NUMBER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `individualtask`
--

INSERT INTO `individualtask` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`) VALUES
('Series 1 (NZ)', 1, 1),
('Series 1 (NZ)', 1, 2),
('Series 1 (NZ)', 1, 3),
('Series 1 (NZ)', 1, 4),
('Series 1 (NZ)', 1, 5),
('Series 1 (NZ)', 2, 1),
('Series 1 (NZ)', 2, 2),
('Series 1 (NZ)', 2, 3),
('Series 1 (NZ)', 2, 4),
('Series 1 (NZ)', 2, 5),
('Series 1 (NZ)', 3, 1),
('Series 1 (NZ)', 3, 2),
('Series 1 (NZ)', 3, 4),
('Series 1 (NZ)', 3, 5),
('Series 1 (NZ)', 4, 1),
('Series 1 (NZ)', 4, 2),
('Series 1 (NZ)', 4, 4),
('Series 1 (NZ)', 4, 5),
('Series 1 (NZ)', 5, 1),
('Series 1 (NZ)', 5, 2),
('Series 1 (NZ)', 5, 3),
('Series 1 (NZ)', 5, 4),
('Series 1 (NZ)', 5, 5),
('Series 1 (NZ)', 6, 1),
('Series 1 (NZ)', 6, 2),
('Series 1 (NZ)', 6, 4),
('Series 1 (NZ)', 6, 5),
('Series 1 (NZ)', 7, 1),
('Series 1 (NZ)', 7, 2),
('Series 1 (NZ)', 7, 3),
('Series 1 (NZ)', 7, 4),
('Series 1 (NZ)', 7, 5),
('Series 1 (NZ)', 8, 1),
('Series 1 (NZ)', 8, 2),
('Series 1 (NZ)', 8, 3),
('Series 1 (NZ)', 8, 4),
('Series 1 (NZ)', 8, 5),
('Series 1 (NZ)', 8, 6),
('Series 1 (NZ)', 9, 1),
('Series 1 (NZ)', 9, 2),
('Series 1 (NZ)', 9, 4),
('Series 1 (NZ)', 9, 5),
('Series 1 (NZ)', 10, 1),
('Series 1 (NZ)', 10, 2),
('Series 1 (NZ)', 10, 4),
('Series 1 (NZ)', 10, 5),
('Series 1 (UK)', 1, 1),
('Series 1 (UK)', 1, 2),
('Series 1 (UK)', 1, 3),
('Series 1 (UK)', 1, 4),
('Series 1 (UK)', 1, 5),
('Series 1 (UK)', 2, 1),
('Series 1 (UK)', 2, 2),
('Series 1 (UK)', 2, 3),
('Series 1 (UK)', 2, 4),
('Series 1 (UK)', 2, 5),
('Series 1 (UK)', 3, 1),
('Series 1 (UK)', 3, 2),
('Series 1 (UK)', 3, 3),
('Series 1 (UK)', 3, 4),
('Series 1 (UK)', 3, 5),
('Series 1 (UK)', 3, 6),
('Series 1 (UK)', 4, 1),
('Series 1 (UK)', 4, 2),
('Series 1 (UK)', 4, 4),
('Series 1 (UK)', 4, 5),
('Series 1 (UK)', 5, 1),
('Series 1 (UK)', 5, 2),
('Series 1 (UK)', 5, 3),
('Series 1 (UK)', 5, 5),
('Series 1 (UK)', 5, 6),
('Series 1 (UK)', 6, 1),
('Series 1 (UK)', 6, 2),
('Series 1 (UK)', 6, 4),
('Series 1 (UK)', 6, 5),
('Series 3 (UK)', 1, 1),
('Series 3 (UK)', 1, 2),
('Series 3 (UK)', 1, 3),
('Series 3 (UK)', 1, 4),
('Series 3 (UK)', 1, 5),
('Series 3 (UK)', 2, 1),
('Series 3 (UK)', 2, 2),
('Series 3 (UK)', 2, 4),
('Series 3 (UK)', 2, 5),
('Series 3 (UK)', 2, 6),
('Series 3 (UK)', 3, 1),
('Series 3 (UK)', 3, 2),
('Series 3 (UK)', 3, 3),
('Series 3 (UK)', 3, 4),
('Series 3 (UK)', 3, 5),
('Series 3 (UK)', 3, 6);

-- --------------------------------------------------------

--
-- Structure de la table `job`
--

CREATE TABLE `job` (
  `CANDIDATE_ID` int(11) NOT NULL,
  `JOB` varchar(22) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `job`
--

INSERT INTO `job` (`CANDIDATE_ID`, `JOB`) VALUES
(0, ''),
(0, 'Beau gosse de la stree'),
(3, 'Comedian'),
(3, 'Television presenter'),
(3, 'Writer'),
(4, 'Actor'),
(4, 'Comedian'),
(4, 'Presenter'),
(5, 'Actor'),
(5, 'Comedian'),
(5, 'Writer'),
(6, 'Actor'),
(6, 'Comedian'),
(7, 'Actor'),
(7, 'Performance poet'),
(7, 'Writer'),
(10, 'Actor'),
(10, 'Comedian'),
(10, 'Writer'),
(11, 'Actor'),
(11, 'Comedian'),
(11, 'Writer'),
(12, 'Comedian'),
(12, 'Telivision personality'),
(13, 'Comedian'),
(13, 'Performance artist'),
(13, 'Radio presenter'),
(14, 'Actor'),
(14, 'Comedian'),
(14, 'Director'),
(14, 'Musician'),
(15, 'Comedian'),
(16, 'Author'),
(16, 'Comedian'),
(16, 'Television presenter'),
(17, 'Actor'),
(17, 'Comedian'),
(18, 'Comedian'),
(18, 'Presenter'),
(19, 'Actor'),
(19, 'Comedian');

-- --------------------------------------------------------

--
-- Structure de la table `membership`
--

CREATE TABLE `membership` (
  `TEAM_ID` int(11) NOT NULL,
  `CANDIDATE_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `membership`
--

INSERT INTO `membership` (`TEAM_ID`, `CANDIDATE_ID`) VALUES
(1, 3),
(1, 7),
(2, 4),
(2, 5),
(2, 6),
(3, 10),
(3, 13),
(4, 11),
(4, 12),
(4, 14),
(5, 15),
(5, 16),
(5, 17),
(6, 18),
(6, 19);

-- --------------------------------------------------------

--
-- Structure de la table `person`
--

CREATE TABLE `person` (
  `ID` int(11) NOT NULL,
  `FIRSTNAME` varchar(9) NOT NULL,
  `LASTNAME` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `person`
--

INSERT INTO `person` (`ID`, `FIRSTNAME`, `LASTNAME`) VALUES
(1, 'Greg', 'Davies'),
(2, 'Alex', 'Horne'),
(3, 'Frank', 'Skinner'),
(4, 'Josh', 'Widdicombe'),
(5, 'Roisin', 'Conaty'),
(6, 'Romesh', 'Ranganathan'),
(7, 'Tim', 'Key'),
(8, 'Jeremy', 'Wells'),
(9, 'Paul', 'Williams'),
(10, 'Angella', 'Dravid'),
(11, 'Brynley', 'Stent'),
(12, 'Guy', 'Williams'),
(13, 'Leigh', 'Hart'),
(14, 'Madeleine', 'Sami'),
(15, 'Al', 'Murray'),
(16, 'Dave', 'Gorman'),
(17, 'Paul', 'Chowdhry'),
(18, 'Rob', 'Beckett'),
(19, 'Sara', 'Pascoe');

-- --------------------------------------------------------

--
-- Structure de la table `points`
--

CREATE TABLE `points` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TASK_NUMBER` int(11) NOT NULL,
  `CANDIDATE_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL,
  `WASDISQUALIFIED` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `points`
--

INSERT INTO `points` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `CANDIDATE_ID`, `POINTS`, `WASDISQUALIFIED`) VALUES
('Series 1 (NZ)', 1, 1, 10, 1, b'0'),
('Series 1 (NZ)', 1, 1, 11, 5, b'0'),
('Series 1 (NZ)', 1, 1, 12, 3, b'0'),
('Series 1 (NZ)', 1, 1, 13, 2, b'0'),
('Series 1 (NZ)', 1, 1, 14, 4, b'0'),
('Series 1 (NZ)', 1, 2, 10, 2, b'0'),
('Series 1 (NZ)', 1, 2, 11, 5, b'0'),
('Series 1 (NZ)', 1, 2, 12, 4, b'0'),
('Series 1 (NZ)', 1, 2, 13, 1, b'0'),
('Series 1 (NZ)', 1, 2, 14, 3, b'0'),
('Series 1 (NZ)', 1, 3, 10, 1, b'0'),
('Series 1 (NZ)', 1, 3, 11, 2, b'0'),
('Series 1 (NZ)', 1, 3, 12, 3, b'0'),
('Series 1 (NZ)', 1, 3, 13, 5, b'0'),
('Series 1 (NZ)', 1, 3, 14, 5, b'0'),
('Series 1 (NZ)', 1, 4, 10, 2, b'0'),
('Series 1 (NZ)', 1, 4, 11, 1, b'0'),
('Series 1 (NZ)', 1, 4, 12, 4, b'0'),
('Series 1 (NZ)', 1, 4, 13, 5, b'0'),
('Series 1 (NZ)', 1, 4, 14, 3, b'0'),
('Series 1 (NZ)', 1, 5, 10, 5, b'0'),
('Series 1 (NZ)', 1, 5, 11, 4, b'0'),
('Series 1 (NZ)', 1, 5, 12, 0, b'1'),
('Series 1 (NZ)', 1, 5, 13, 3, b'0'),
('Series 1 (NZ)', 1, 5, 14, 0, b'1'),
('Series 1 (NZ)', 2, 1, 10, 5, b'0'),
('Series 1 (NZ)', 2, 1, 11, 5, b'0'),
('Series 1 (NZ)', 2, 1, 12, 1, b'0'),
('Series 1 (NZ)', 2, 1, 13, 2, b'0'),
('Series 1 (NZ)', 2, 1, 14, 2, b'0'),
('Series 1 (NZ)', 2, 2, 10, 1, b'0'),
('Series 1 (NZ)', 2, 2, 11, 2, b'0'),
('Series 1 (NZ)', 2, 2, 12, 3, b'0'),
('Series 1 (NZ)', 2, 2, 13, 4, b'0'),
('Series 1 (NZ)', 2, 2, 14, 5, b'0'),
('Series 1 (NZ)', 2, 3, 10, 4, b'0'),
('Series 1 (NZ)', 2, 3, 11, 0, b'1'),
('Series 1 (NZ)', 2, 3, 12, 0, b'1'),
('Series 1 (NZ)', 2, 3, 13, 0, b'1'),
('Series 1 (NZ)', 2, 3, 14, 5, b'0'),
('Series 1 (NZ)', 2, 4, 10, 3, b'0'),
('Series 1 (NZ)', 2, 4, 11, 2, b'0'),
('Series 1 (NZ)', 2, 4, 12, 1, b'0'),
('Series 1 (NZ)', 2, 4, 13, 4, b'0'),
('Series 1 (NZ)', 2, 4, 14, 5, b'0'),
('Series 1 (NZ)', 2, 5, 10, 4, b'0'),
('Series 1 (NZ)', 2, 5, 11, 3, b'0'),
('Series 1 (NZ)', 2, 5, 12, 1, b'0'),
('Series 1 (NZ)', 2, 5, 13, 5, b'0'),
('Series 1 (NZ)', 2, 5, 14, 2, b'0'),
('Series 1 (NZ)', 3, 1, 10, 3, b'0'),
('Series 1 (NZ)', 3, 1, 11, 3, b'0'),
('Series 1 (NZ)', 3, 1, 12, 3, b'0'),
('Series 1 (NZ)', 3, 1, 13, 3, b'0'),
('Series 1 (NZ)', 3, 1, 14, 1, b'0'),
('Series 1 (NZ)', 3, 2, 10, 1, b'0'),
('Series 1 (NZ)', 3, 2, 11, 5, b'0'),
('Series 1 (NZ)', 3, 2, 12, 3, b'0'),
('Series 1 (NZ)', 3, 2, 13, 2, b'0'),
('Series 1 (NZ)', 3, 2, 14, 4, b'0'),
('Series 1 (NZ)', 3, 4, 10, 5, b'0'),
('Series 1 (NZ)', 3, 4, 11, 2, b'0'),
('Series 1 (NZ)', 3, 4, 12, 0, b'0'),
('Series 1 (NZ)', 3, 4, 13, 2, b'0'),
('Series 1 (NZ)', 3, 4, 14, 3, b'0'),
('Series 1 (NZ)', 3, 5, 10, 0, b'0'),
('Series 1 (NZ)', 3, 5, 11, 5, b'0'),
('Series 1 (NZ)', 3, 5, 12, 3, b'0'),
('Series 1 (NZ)', 3, 5, 13, 1, b'0'),
('Series 1 (NZ)', 3, 5, 14, 5, b'0'),
('Series 1 (NZ)', 4, 1, 10, 2, b'0'),
('Series 1 (NZ)', 4, 1, 11, 3, b'0'),
('Series 1 (NZ)', 4, 1, 12, 5, b'0'),
('Series 1 (NZ)', 4, 1, 13, 1, b'0'),
('Series 1 (NZ)', 4, 1, 14, 4, b'0'),
('Series 1 (NZ)', 4, 2, 10, 2, b'0'),
('Series 1 (NZ)', 4, 2, 11, 4, b'0'),
('Series 1 (NZ)', 4, 2, 12, 5, b'0'),
('Series 1 (NZ)', 4, 2, 13, 1, b'0'),
('Series 1 (NZ)', 4, 2, 14, 3, b'0'),
('Series 1 (NZ)', 4, 4, 10, 5, b'0'),
('Series 1 (NZ)', 4, 4, 11, 1, b'0'),
('Series 1 (NZ)', 4, 4, 12, 3, b'0'),
('Series 1 (NZ)', 4, 4, 13, 2, b'0'),
('Series 1 (NZ)', 4, 4, 14, 4, b'0'),
('Series 1 (NZ)', 4, 5, 10, 5, b'0'),
('Series 1 (NZ)', 4, 5, 11, 0, b'0'),
('Series 1 (NZ)', 4, 5, 12, 3, b'0'),
('Series 1 (NZ)', 4, 5, 13, 0, b'0'),
('Series 1 (NZ)', 4, 5, 14, 2, b'0'),
('Series 1 (NZ)', 5, 1, 10, 5, b'0'),
('Series 1 (NZ)', 5, 1, 11, 3, b'0'),
('Series 1 (NZ)', 5, 1, 12, 1, b'0'),
('Series 1 (NZ)', 5, 1, 13, 2, b'0'),
('Series 1 (NZ)', 5, 1, 14, 4, b'0'),
('Series 1 (NZ)', 5, 2, 10, 4, b'0'),
('Series 1 (NZ)', 5, 2, 11, 5, b'0'),
('Series 1 (NZ)', 5, 2, 12, 2, b'0'),
('Series 1 (NZ)', 5, 2, 13, 1, b'0'),
('Series 1 (NZ)', 5, 2, 14, 3, b'0'),
('Series 1 (NZ)', 5, 3, 10, 4, b'0'),
('Series 1 (NZ)', 5, 3, 11, 2, b'0'),
('Series 1 (NZ)', 5, 3, 12, 1, b'0'),
('Series 1 (NZ)', 5, 3, 13, 3, b'0'),
('Series 1 (NZ)', 5, 3, 14, 5, b'0'),
('Series 1 (NZ)', 5, 4, 10, 5, b'0'),
('Series 1 (NZ)', 5, 4, 11, 4, b'0'),
('Series 1 (NZ)', 5, 4, 12, 3, b'0'),
('Series 1 (NZ)', 5, 4, 13, 2, b'0'),
('Series 1 (NZ)', 5, 4, 14, 1, b'0'),
('Series 1 (NZ)', 5, 5, 10, 0, b'1'),
('Series 1 (NZ)', 5, 5, 11, 5, b'0'),
('Series 1 (NZ)', 5, 5, 12, 4, b'0'),
('Series 1 (NZ)', 5, 5, 13, 3, b'0'),
('Series 1 (NZ)', 5, 5, 14, 2, b'0'),
('Series 1 (NZ)', 6, 1, 10, 4, b'0'),
('Series 1 (NZ)', 6, 1, 11, 1, b'0'),
('Series 1 (NZ)', 6, 1, 12, 5, b'0'),
('Series 1 (NZ)', 6, 1, 13, 3, b'0'),
('Series 1 (NZ)', 6, 1, 14, 2, b'0'),
('Series 1 (NZ)', 6, 2, 10, 5, b'0'),
('Series 1 (NZ)', 6, 2, 11, 2, b'0'),
('Series 1 (NZ)', 6, 2, 12, 1, b'0'),
('Series 1 (NZ)', 6, 2, 13, 3, b'0'),
('Series 1 (NZ)', 6, 2, 14, 4, b'0'),
('Series 1 (NZ)', 6, 4, 10, 5, b'0'),
('Series 1 (NZ)', 6, 4, 11, 1, b'0'),
('Series 1 (NZ)', 6, 4, 12, 3, b'0'),
('Series 1 (NZ)', 6, 4, 13, 4, b'0'),
('Series 1 (NZ)', 6, 4, 14, 2, b'0'),
('Series 1 (NZ)', 6, 5, 10, 5, b'0'),
('Series 1 (NZ)', 6, 5, 11, 1, b'0'),
('Series 1 (NZ)', 6, 5, 12, 3, b'0'),
('Series 1 (NZ)', 6, 5, 13, 2, b'0'),
('Series 1 (NZ)', 6, 5, 14, 4, b'0'),
('Series 1 (NZ)', 7, 1, 10, 5, b'0'),
('Series 1 (NZ)', 7, 1, 11, 1, b'0'),
('Series 1 (NZ)', 7, 1, 12, 3, b'0'),
('Series 1 (NZ)', 7, 1, 13, 4, b'0'),
('Series 1 (NZ)', 7, 1, 14, 2, b'0'),
('Series 1 (NZ)', 7, 2, 10, 0, b'1'),
('Series 1 (NZ)', 7, 2, 11, 4, b'0'),
('Series 1 (NZ)', 7, 2, 12, 1, b'0'),
('Series 1 (NZ)', 7, 2, 13, 3, b'0'),
('Series 1 (NZ)', 7, 2, 14, 5, b'0'),
('Series 1 (NZ)', 7, 3, 10, 5, b'0'),
('Series 1 (NZ)', 7, 3, 11, 3, b'0'),
('Series 1 (NZ)', 7, 3, 12, 1, b'0'),
('Series 1 (NZ)', 7, 3, 13, 3, b'0'),
('Series 1 (NZ)', 7, 3, 14, 1, b'0'),
('Series 1 (NZ)', 7, 4, 10, 5, b'0'),
('Series 1 (NZ)', 7, 4, 11, 2, b'0'),
('Series 1 (NZ)', 7, 4, 12, 3, b'0'),
('Series 1 (NZ)', 7, 4, 13, 1, b'0'),
('Series 1 (NZ)', 7, 4, 14, 4, b'0'),
('Series 1 (NZ)', 7, 5, 10, 0, b'0'),
('Series 1 (NZ)', 7, 5, 11, 0, b'0'),
('Series 1 (NZ)', 7, 5, 12, 0, b'0'),
('Series 1 (NZ)', 7, 5, 13, 5, b'0'),
('Series 1 (NZ)', 7, 5, 14, 0, b'0'),
('Series 1 (NZ)', 8, 1, 10, 4, b'0'),
('Series 1 (NZ)', 8, 1, 11, 3, b'0'),
('Series 1 (NZ)', 8, 1, 12, 2, b'0'),
('Series 1 (NZ)', 8, 1, 13, 1, b'0'),
('Series 1 (NZ)', 8, 1, 14, 5, b'0'),
('Series 1 (NZ)', 8, 2, 10, 3, b'0'),
('Series 1 (NZ)', 8, 2, 11, 2, b'0'),
('Series 1 (NZ)', 8, 2, 12, 4, b'0'),
('Series 1 (NZ)', 8, 2, 13, 2, b'0'),
('Series 1 (NZ)', 8, 2, 14, 5, b'0'),
('Series 1 (NZ)', 8, 3, 10, 4, b'0'),
('Series 1 (NZ)', 8, 3, 11, 4, b'0'),
('Series 1 (NZ)', 8, 3, 12, 1, b'0'),
('Series 1 (NZ)', 8, 3, 13, 3, b'0'),
('Series 1 (NZ)', 8, 3, 14, 3, b'0'),
('Series 1 (NZ)', 8, 4, 10, 5, b'0'),
('Series 1 (NZ)', 8, 4, 11, 5, b'0'),
('Series 1 (NZ)', 8, 4, 12, 5, b'0'),
('Series 1 (NZ)', 8, 4, 13, 1, b'0'),
('Series 1 (NZ)', 8, 4, 14, 2, b'0'),
('Series 1 (NZ)', 8, 5, 10, 5, b'0'),
('Series 1 (NZ)', 8, 5, 11, 1, b'0'),
('Series 1 (NZ)', 8, 5, 12, 1, b'0'),
('Series 1 (NZ)', 8, 5, 13, 1, b'0'),
('Series 1 (NZ)', 8, 5, 14, 2, b'0'),
('Series 1 (NZ)', 8, 6, 10, 0, b'1'),
('Series 1 (NZ)', 8, 6, 11, 0, b'0'),
('Series 1 (NZ)', 8, 6, 12, 5, b'0'),
('Series 1 (NZ)', 8, 6, 13, 0, b'1'),
('Series 1 (NZ)', 8, 6, 14, 0, b'1'),
('Series 1 (NZ)', 9, 1, 10, 2, b'0'),
('Series 1 (NZ)', 9, 1, 11, 4, b'0'),
('Series 1 (NZ)', 9, 1, 12, 3, b'0'),
('Series 1 (NZ)', 9, 1, 13, 5, b'0'),
('Series 1 (NZ)', 9, 1, 14, 1, b'0'),
('Series 1 (NZ)', 9, 2, 10, 5, b'0'),
('Series 1 (NZ)', 9, 2, 11, 4, b'0'),
('Series 1 (NZ)', 9, 2, 12, 0, b'1'),
('Series 1 (NZ)', 9, 2, 13, 3, b'0'),
('Series 1 (NZ)', 9, 2, 14, 2, b'0'),
('Series 1 (NZ)', 9, 4, 10, 3, b'0'),
('Series 1 (NZ)', 9, 4, 11, 1, b'0'),
('Series 1 (NZ)', 9, 4, 12, 3, b'0'),
('Series 1 (NZ)', 9, 4, 13, 3, b'0'),
('Series 1 (NZ)', 9, 4, 14, 5, b'0'),
('Series 1 (NZ)', 9, 5, 10, 1, b'0'),
('Series 1 (NZ)', 9, 5, 11, 4, b'0'),
('Series 1 (NZ)', 9, 5, 12, 3, b'0'),
('Series 1 (NZ)', 9, 5, 13, 5, b'0'),
('Series 1 (NZ)', 9, 5, 14, 2, b'0'),
('Series 1 (NZ)', 10, 1, 10, 3, b'0'),
('Series 1 (NZ)', 10, 1, 11, 2, b'0'),
('Series 1 (NZ)', 10, 1, 12, 4, b'0'),
('Series 1 (NZ)', 10, 1, 13, 1, b'0'),
('Series 1 (NZ)', 10, 1, 14, 5, b'0'),
('Series 1 (NZ)', 10, 2, 10, 2, b'0'),
('Series 1 (NZ)', 10, 2, 11, 1, b'0'),
('Series 1 (NZ)', 10, 2, 12, 4, b'0'),
('Series 1 (NZ)', 10, 2, 13, 5, b'0'),
('Series 1 (NZ)', 10, 2, 14, 3, b'0'),
('Series 1 (NZ)', 10, 4, 10, 0, b'1'),
('Series 1 (NZ)', 10, 4, 11, 5, b'0'),
('Series 1 (NZ)', 10, 4, 12, 0, b'1'),
('Series 1 (NZ)', 10, 4, 13, 0, b'1'),
('Series 1 (NZ)', 10, 4, 14, 0, b'1'),
('Series 1 (NZ)', 10, 5, 10, 2, b'0'),
('Series 1 (NZ)', 10, 5, 11, 1, b'0'),
('Series 1 (NZ)', 10, 5, 12, 3, b'0'),
('Series 1 (NZ)', 10, 5, 13, 5, b'0'),
('Series 1 (NZ)', 10, 5, 14, 4, b'0'),
('Series 1 (UK)', 1, 1, 3, 4, b'0'),
('Series 1 (UK)', 1, 1, 4, 1, b'0'),
('Series 1 (UK)', 1, 1, 5, 2, b'0'),
('Series 1 (UK)', 1, 1, 6, 3, b'0'),
('Series 1 (UK)', 1, 1, 7, 5, b'0'),
('Series 1 (UK)', 1, 2, 3, 2, b'0'),
('Series 1 (UK)', 1, 2, 4, 3, b'0'),
('Series 1 (UK)', 1, 2, 5, 1, b'0'),
('Series 1 (UK)', 1, 2, 6, 5, b'0'),
('Series 1 (UK)', 1, 2, 7, 4, b'0'),
('Series 1 (UK)', 1, 3, 3, 5, b'0'),
('Series 1 (UK)', 1, 3, 4, 3, b'0'),
('Series 1 (UK)', 1, 3, 5, 1, b'0'),
('Series 1 (UK)', 1, 3, 6, 4, b'0'),
('Series 1 (UK)', 1, 3, 7, 2, b'0'),
('Series 1 (UK)', 1, 4, 3, 4, b'0'),
('Series 1 (UK)', 1, 4, 4, 3, b'0'),
('Series 1 (UK)', 1, 4, 5, 2, b'0'),
('Series 1 (UK)', 1, 4, 6, 5, b'0'),
('Series 1 (UK)', 1, 4, 7, 1, b'0'),
('Series 1 (UK)', 1, 5, 3, 4, b'0'),
('Series 1 (UK)', 1, 5, 4, 3, b'0'),
('Series 1 (UK)', 1, 5, 5, 1, b'0'),
('Series 1 (UK)', 1, 5, 6, 2, b'0'),
('Series 1 (UK)', 1, 5, 7, 5, b'0'),
('Series 1 (UK)', 2, 1, 3, 4, b'0'),
('Series 1 (UK)', 2, 1, 4, 2, b'0'),
('Series 1 (UK)', 2, 1, 5, 3, b'0'),
('Series 1 (UK)', 2, 1, 6, 1, b'0'),
('Series 1 (UK)', 2, 1, 7, 5, b'0'),
('Series 1 (UK)', 2, 2, 3, 2, b'0'),
('Series 1 (UK)', 2, 2, 4, 5, b'0'),
('Series 1 (UK)', 2, 2, 5, 4, b'0'),
('Series 1 (UK)', 2, 2, 6, 1, b'0'),
('Series 1 (UK)', 2, 2, 7, 3, b'0'),
('Series 1 (UK)', 2, 3, 3, 1, b'0'),
('Series 1 (UK)', 2, 3, 4, 3, b'0'),
('Series 1 (UK)', 2, 3, 5, 4, b'0'),
('Series 1 (UK)', 2, 3, 6, 3, b'0'),
('Series 1 (UK)', 2, 3, 7, 5, b'0'),
('Series 1 (UK)', 2, 4, 3, 1, b'0'),
('Series 1 (UK)', 2, 4, 4, 4, b'0'),
('Series 1 (UK)', 2, 4, 5, 5, b'0'),
('Series 1 (UK)', 2, 4, 6, 5, b'0'),
('Series 1 (UK)', 2, 4, 7, 3, b'0'),
('Series 1 (UK)', 2, 5, 3, 1, b'0'),
('Series 1 (UK)', 2, 5, 4, 3, b'0'),
('Series 1 (UK)', 2, 5, 5, 5, b'0'),
('Series 1 (UK)', 2, 5, 6, 4, b'0'),
('Series 1 (UK)', 2, 5, 7, 2, b'0'),
('Series 1 (UK)', 3, 1, 3, 4, b'0'),
('Series 1 (UK)', 3, 1, 4, 2, b'0'),
('Series 1 (UK)', 3, 1, 5, 1, b'0'),
('Series 1 (UK)', 3, 1, 6, 5, b'0'),
('Series 1 (UK)', 3, 1, 7, 3, b'0'),
('Series 1 (UK)', 3, 2, 3, 4, b'0'),
('Series 1 (UK)', 3, 2, 4, 0, b'1'),
('Series 1 (UK)', 3, 2, 5, 2, b'0'),
('Series 1 (UK)', 3, 2, 6, 3, b'0'),
('Series 1 (UK)', 3, 2, 7, 5, b'0'),
('Series 1 (UK)', 3, 3, 3, 2, b'0'),
('Series 1 (UK)', 3, 3, 4, 5, b'0'),
('Series 1 (UK)', 3, 3, 5, 1, b'0'),
('Series 1 (UK)', 3, 3, 6, 4, b'0'),
('Series 1 (UK)', 3, 3, 7, 3, b'0'),
('Series 1 (UK)', 3, 4, 3, 3, b'0'),
('Series 1 (UK)', 3, 4, 4, 5, b'0'),
('Series 1 (UK)', 3, 4, 5, 4, b'0'),
('Series 1 (UK)', 3, 4, 6, 2, b'0'),
('Series 1 (UK)', 3, 4, 7, 1, b'0'),
('Series 1 (UK)', 3, 5, 3, 0, b'0'),
('Series 1 (UK)', 3, 5, 4, 5, b'0'),
('Series 1 (UK)', 3, 5, 5, 0, b'0'),
('Series 1 (UK)', 3, 5, 6, 4, b'0'),
('Series 1 (UK)', 3, 5, 7, 0, b'0'),
('Series 1 (UK)', 3, 6, 3, 2, b'0'),
('Series 1 (UK)', 3, 6, 4, 5, b'0'),
('Series 1 (UK)', 3, 6, 5, 1, b'0'),
('Series 1 (UK)', 3, 6, 6, 4, b'0'),
('Series 1 (UK)', 3, 6, 7, 4, b'0'),
('Series 1 (UK)', 4, 1, 3, 3, b'0'),
('Series 1 (UK)', 4, 1, 4, 4, b'0'),
('Series 1 (UK)', 4, 1, 5, 2, b'0'),
('Series 1 (UK)', 4, 1, 6, 1, b'0'),
('Series 1 (UK)', 4, 1, 7, 5, b'0'),
('Series 1 (UK)', 4, 2, 3, 4, b'0'),
('Series 1 (UK)', 4, 2, 4, 5, b'0'),
('Series 1 (UK)', 4, 2, 5, 3, b'0'),
('Series 1 (UK)', 4, 2, 6, 2, b'0'),
('Series 1 (UK)', 4, 2, 7, 1, b'0'),
('Series 1 (UK)', 4, 4, 3, 5, b'0'),
('Series 1 (UK)', 4, 4, 4, 3, b'0'),
('Series 1 (UK)', 4, 4, 5, 1, b'0'),
('Series 1 (UK)', 4, 4, 6, 4, b'0'),
('Series 1 (UK)', 4, 4, 7, 1, b'0'),
('Series 1 (UK)', 4, 5, 3, 1, b'0'),
('Series 1 (UK)', 4, 5, 4, 1, b'0'),
('Series 1 (UK)', 4, 5, 5, 1, b'0'),
('Series 1 (UK)', 4, 5, 6, 1, b'0'),
('Series 1 (UK)', 4, 5, 7, 1, b'0'),
('Series 1 (UK)', 5, 1, 3, 4, b'0'),
('Series 1 (UK)', 5, 1, 4, 5, b'0'),
('Series 1 (UK)', 5, 1, 5, 1, b'0'),
('Series 1 (UK)', 5, 1, 6, 3, b'0'),
('Series 1 (UK)', 5, 1, 7, 2, b'0'),
('Series 1 (UK)', 5, 2, 3, 4, b'0'),
('Series 1 (UK)', 5, 2, 4, 5, b'0'),
('Series 1 (UK)', 5, 2, 5, 1, b'0'),
('Series 1 (UK)', 5, 2, 6, 2, b'0'),
('Series 1 (UK)', 5, 2, 7, 3, b'0'),
('Series 1 (UK)', 5, 3, 3, 3, b'0'),
('Series 1 (UK)', 5, 3, 4, 5, b'0'),
('Series 1 (UK)', 5, 3, 5, 2, b'0'),
('Series 1 (UK)', 5, 3, 6, 4, b'0'),
('Series 1 (UK)', 5, 3, 7, 1, b'0'),
('Series 1 (UK)', 5, 5, 3, 3, b'0'),
('Series 1 (UK)', 5, 5, 4, 1, b'0'),
('Series 1 (UK)', 5, 5, 5, 5, b'0'),
('Series 1 (UK)', 5, 5, 6, 4, b'0'),
('Series 1 (UK)', 5, 5, 7, 2, b'0'),
('Series 1 (UK)', 5, 6, 3, 4, b'0'),
('Series 1 (UK)', 5, 6, 4, 2, b'0'),
('Series 1 (UK)', 5, 6, 5, 5, b'0'),
('Series 1 (UK)', 5, 6, 6, 3, b'0'),
('Series 1 (UK)', 5, 6, 7, 0, b'1'),
('Series 1 (UK)', 6, 1, 3, 2, b'0'),
('Series 1 (UK)', 6, 1, 4, 4, b'0'),
('Series 1 (UK)', 6, 1, 5, 1, b'0'),
('Series 1 (UK)', 6, 1, 6, 3, b'0'),
('Series 1 (UK)', 6, 1, 7, 5, b'0'),
('Series 1 (UK)', 6, 2, 3, 4, b'0'),
('Series 1 (UK)', 6, 2, 4, 2, b'0'),
('Series 1 (UK)', 6, 2, 5, 5, b'0'),
('Series 1 (UK)', 6, 2, 6, 1, b'0'),
('Series 1 (UK)', 6, 2, 7, 3, b'0'),
('Series 1 (UK)', 6, 4, 3, 5, b'0'),
('Series 1 (UK)', 6, 4, 4, 1, b'0'),
('Series 1 (UK)', 6, 4, 5, 1, b'0'),
('Series 1 (UK)', 6, 4, 6, 4, b'0'),
('Series 1 (UK)', 6, 4, 7, 3, b'0'),
('Series 1 (UK)', 6, 5, 3, 3, b'0'),
('Series 1 (UK)', 6, 5, 4, 2, b'0'),
('Series 1 (UK)', 6, 5, 5, 1, b'0'),
('Series 1 (UK)', 6, 5, 6, 4, b'0'),
('Series 1 (UK)', 6, 5, 7, 5, b'0'),
('Series 3 (UK)', 1, 1, 15, 4, b'0'),
('Series 3 (UK)', 1, 1, 16, 3, b'0'),
('Series 3 (UK)', 1, 1, 17, 1, b'0'),
('Series 3 (UK)', 1, 1, 18, 2, b'0'),
('Series 3 (UK)', 1, 1, 19, 5, b'0'),
('Series 3 (UK)', 1, 2, 15, 4, b'0'),
('Series 3 (UK)', 1, 2, 16, 2, b'0'),
('Series 3 (UK)', 1, 2, 17, 0, b'0'),
('Series 3 (UK)', 1, 2, 18, 5, b'0'),
('Series 3 (UK)', 1, 2, 19, 3, b'0'),
('Series 3 (UK)', 1, 3, 15, 5, b'0'),
('Series 3 (UK)', 1, 3, 16, 0, b'1'),
('Series 3 (UK)', 1, 3, 17, 2, b'0'),
('Series 3 (UK)', 1, 3, 18, 4, b'0'),
('Series 3 (UK)', 1, 3, 19, 3, b'0'),
('Series 3 (UK)', 1, 4, 15, 3, b'0'),
('Series 3 (UK)', 1, 4, 16, 5, b'0'),
('Series 3 (UK)', 1, 4, 17, 1, b'0'),
('Series 3 (UK)', 1, 4, 18, 2, b'0'),
('Series 3 (UK)', 1, 4, 19, 4, b'0'),
('Series 3 (UK)', 1, 5, 15, 5, b'0'),
('Series 3 (UK)', 1, 5, 16, 3, b'0'),
('Series 3 (UK)', 1, 5, 17, 4, b'0'),
('Series 3 (UK)', 1, 5, 18, 2, b'0'),
('Series 3 (UK)', 1, 5, 19, 1, b'0'),
('Series 3 (UK)', 2, 1, 15, 3, b'0'),
('Series 3 (UK)', 2, 1, 16, 5, b'0'),
('Series 3 (UK)', 2, 1, 17, 2, b'0'),
('Series 3 (UK)', 2, 1, 18, 4, b'0'),
('Series 3 (UK)', 2, 1, 19, 1, b'0'),
('Series 3 (UK)', 2, 2, 15, 4, b'0'),
('Series 3 (UK)', 2, 2, 16, 3, b'0'),
('Series 3 (UK)', 2, 2, 17, 1, b'0'),
('Series 3 (UK)', 2, 2, 18, 5, b'0'),
('Series 3 (UK)', 2, 2, 19, 2, b'0'),
('Series 3 (UK)', 2, 4, 15, 5, b'0'),
('Series 3 (UK)', 2, 4, 16, 3, b'0'),
('Series 3 (UK)', 2, 4, 17, 2, b'0'),
('Series 3 (UK)', 2, 4, 18, 2, b'0'),
('Series 3 (UK)', 2, 4, 19, 4, b'0'),
('Series 3 (UK)', 2, 5, 15, 1, b'0'),
('Series 3 (UK)', 2, 5, 16, 3, b'0'),
('Series 3 (UK)', 2, 5, 17, 4, b'0'),
('Series 3 (UK)', 2, 5, 18, 5, b'0'),
('Series 3 (UK)', 2, 5, 19, 2, b'0'),
('Series 3 (UK)', 2, 6, 15, 5, b'0'),
('Series 3 (UK)', 2, 6, 16, 3, b'0'),
('Series 3 (UK)', 2, 6, 17, 4, b'0'),
('Series 3 (UK)', 2, 6, 18, 0, b'0'),
('Series 3 (UK)', 2, 6, 19, 2, b'0'),
('Series 3 (UK)', 3, 1, 15, 2, b'0'),
('Series 3 (UK)', 3, 1, 16, 1, b'0'),
('Series 3 (UK)', 3, 1, 17, 4, b'0'),
('Series 3 (UK)', 3, 1, 18, 5, b'0'),
('Series 3 (UK)', 3, 1, 19, 3, b'0'),
('Series 3 (UK)', 3, 2, 15, 0, b'1'),
('Series 3 (UK)', 3, 2, 16, 3, b'0'),
('Series 3 (UK)', 3, 2, 17, 5, b'0'),
('Series 3 (UK)', 3, 2, 18, 2, b'0'),
('Series 3 (UK)', 3, 2, 19, 4, b'0'),
('Series 3 (UK)', 3, 3, 15, 1, b'0'),
('Series 3 (UK)', 3, 3, 16, 4, b'0'),
('Series 3 (UK)', 3, 3, 17, 5, b'0'),
('Series 3 (UK)', 3, 3, 18, 3, b'0'),
('Series 3 (UK)', 3, 3, 19, 1, b'0'),
('Series 3 (UK)', 3, 4, 15, 3, b'0'),
('Series 3 (UK)', 3, 4, 16, 5, b'0'),
('Series 3 (UK)', 3, 4, 17, 2, b'0'),
('Series 3 (UK)', 3, 4, 18, 4, b'0'),
('Series 3 (UK)', 3, 4, 19, 1, b'0'),
('Series 3 (UK)', 3, 5, 15, 2, b'0'),
('Series 3 (UK)', 3, 5, 16, 5, b'0'),
('Series 3 (UK)', 3, 5, 17, 4, b'0'),
('Series 3 (UK)', 3, 5, 18, 1, b'0'),
('Series 3 (UK)', 3, 5, 19, 3, b'0'),
('Series 3 (UK)', 3, 6, 15, 1, b'0'),
('Series 3 (UK)', 3, 6, 16, 3, b'0'),
('Series 3 (UK)', 3, 6, 17, 2, b'0'),
('Series 3 (UK)', 3, 6, 18, 4, b'0'),
('Series 3 (UK)', 3, 6, 19, 5, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `series`
--

CREATE TABLE `series` (
  `NAME` varchar(13) NOT NULL,
  `NETWORK` varchar(6) NOT NULL,
  `STARTDATE` date NOT NULL,
  `ENDDATE` date NOT NULL,
  `TASKMASTER_ID` int(11) NOT NULL,
  `ASSISTANT_ID` int(11) NOT NULL,
  `CHAMPION_ID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `series`
--

INSERT INTO `series` (`NAME`, `NETWORK`, `STARTDATE`, `ENDDATE`, `TASKMASTER_ID`, `ASSISTANT_ID`, `CHAMPION_ID`) VALUES
('Series 1 (NZ)', 'TVNZ 2', '2020-10-21', '2020-12-23', 8, 9, 10),
('Series 1 (UK)', 'Dave', '2015-07-15', '2015-09-01', 1, 2, 4),
('Series 3 (UK)', 'Dave', '2016-10-04', '2016-11-01', 1, 2, NULL);

-- --------------------------------------------------------

--
-- Structure de la table `task`
--

CREATE TABLE `task` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TASK_NUMBER` int(11) NOT NULL,
  `DESCRIPTION` varchar(224) NOT NULL,
  `ISLIVETASK` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `task`
--

INSERT INTO `task` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `DESCRIPTION`, `ISLIVETASK`) VALUES
('Series 1 (NZ)', 1, 1, 'Best thing you can\'t live without.', b'1'),
('Series 1 (NZ)', 1, 2, 'Make a sculpture of something starting with your letter, only using items starting with your letter.', b'0'),
('Series 1 (NZ)', 1, 3, 'Create the fanciest cocktail using ingredients that rhyme with each other.', b'0'),
('Series 1 (NZ)', 1, 4, 'Choose a piece of fruit and hit it as far as possible with your choice of bread. You must use the first bread and first fruit you touch.', b'0'),
('Series 1 (NZ)', 1, 5, 'Pack a suitcase as closely to 23kg as possible. If you go over 23kg you will be disqualified.', b'1'),
('Series 1 (NZ)', 2, 1, 'Best thing within a thing.', b'1'),
('Series 1 (NZ)', 2, 2, 'Keep the balloon in the air the longest. You may strike the balloon but you may not hold it. Every strike must be with a unique object.', b'0'),
('Series 1 (NZ)', 2, 3, 'Reassemble the vase to its original condition', b'0'),
('Series 1 (NZ)', 2, 4, 'Throw a dart at the map and hit a country. Write and perform a new national anthem for your country.', b'0'),
('Series 1 (NZ)', 2, 5, 'Draw a map of New Zealand using yeast spread.', b'1'),
('Series 1 (NZ)', 3, 1, 'Least useful item.', b'1'),
('Series 1 (NZ)', 3, 2, 'Make this tree sexy.', b'0'),
('Series 1 (NZ)', 3, 3, 'Catch a grape with a tuba. You may not throw the grape.', b'0'),
('Series 1 (NZ)', 3, 4, 'Pack this piñata with the most surprising filling.', b'0'),
('Series 1 (NZ)', 3, 5, 'Write down a sport, an animal and a colour. Pack a suitcase as closely to 23kg as possible. If you go over 23kg you will be disqualified.', b'1'),
('Series 1 (NZ)', 4, 1, 'Best gift for an enemy.', b'1'),
('Series 1 (NZ)', 4, 2, 'Hide one of these vegetables completely inside another. If you use the same vegetable combination as someone else, you will both be disqualified.', b'0'),
('Series 1 (NZ)', 4, 3, 'Create a 90 second one-shot film. You must all appear in the film. One of you must hold the camera at all times. Your film must include three speaking characters, an impressive stunt and credits. You have one take.', b'0'),
('Series 1 (NZ)', 4, 4, 'Make this Mum proud.', b'0'),
('Series 1 (NZ)', 4, 5, 'Write the Taskmaster an anonymous poem. If the Taskmaster correctly guesses who wrote your poem, you lose your points.', b'1'),
('Series 1 (NZ)', 5, 1, 'Most beloved family heirloom.', b'1'),
('Series 1 (NZ)', 5, 2, 'Blow this egg the furthest from the table. If the egg breaks, your attempt will end.', b'0'),
('Series 1 (NZ)', 5, 3, 'Be as unhealthy as possible. You have 10 seconds from when you shout \"Let\'s get this party started!\".', b'0'),
('Series 1 (NZ)', 5, 4, 'Do the most impressive thing hands-free.', b'0'),
('Series 1 (NZ)', 5, 5, 'Spell the longest word using alphabet soup.', b'1'),
('Series 1 (NZ)', 6, 1, 'Thing that scares you the most.', b'1'),
('Series 1 (NZ)', 6, 2, 'Make the biggest thing disappear.', b'0'),
('Series 1 (NZ)', 6, 3, 'Gather your tools and bring them to your area. Transfer as much soup as possible from the blue vat to the yellow vat using only your own tools. You may not leave your area or move the vats.', b'0'),
('Series 1 (NZ)', 6, 4, 'Leave the room. Your time started when Paul left the room.', b'0'),
('Series 1 (NZ)', 6, 5, 'Wearing your blindfold, pop up before the toast. You may only pop up once. If you pop up after the toast, you will be disqualified.', b'1'),
('Series 1 (NZ)', 7, 1, 'Worst thing to show the Taskmaster.', b'1'),
('Series 1 (NZ)', 7, 2, 'Find Paul and hit him with this frisbee. You may not walk or run while holding the frisbee. Every time you throw the frisbee, you must put on an additional item of clothing.', b'0'),
('Series 1 (NZ)', 7, 3, 'Go on the most convincing fake holiday.', b'0'),
('Series 1 (NZ)', 7, 4, 'Convincingly paint the Taskmaster like a 5-year-old.', b'0'),
('Series 1 (NZ)', 7, 5, 'Sculpt the third most impressive dog using this clay.', b'1'),
('Series 1 (NZ)', 8, 1, 'Most amazing-sounding thing, until you see it.', b'1'),
('Series 1 (NZ)', 8, 2, 'Get someone you went to primary school with on the phone.', b'0'),
('Series 1 (NZ)', 8, 3, 'Deduce the flavours of these dips.', b'0'),
('Series 1 (NZ)', 8, 4, 'Wear the most outlandish costume under your outfit during the studio show for episode 8. Your costume must be completely concealed under your outfit.', b'0'),
('Series 1 (NZ)', 8, 5, 'Correctly place the keys back on this keyboard as accurately as possible. You may not leave the room.', b'0'),
('Series 1 (NZ)', 8, 6, 'Text a compliment to one of your fellow contestants. You may not text yourself. Everyone who doesn\'t receive a text is eliminated. Text the Taskmaster. Fastest wins.', b'1'),
('Series 1 (NZ)', 9, 1, 'Most poorly-aged thing.', b'1'),
('Series 1 (NZ)', 9, 2, 'Completely colour this whiteboard.', b'0'),
('Series 1 (NZ)', 9, 3, 'Create the most amusing amusement park ride. Paul must be able to ride the ride.', b'0'),
('Series 1 (NZ)', 9, 4, 'Make the most surprisingly pleasant sausage using seven ingredients, one beginning with each letter of the word \"sausage\".', b'0'),
('Series 1 (NZ)', 9, 5, 'Do the most press-ups and/or find the most words in this word search. Each found word is equivalent to two press-ups.', b'1'),
('Series 1 (NZ)', 10, 1, 'Best DIY.', b'1'),
('Series 1 (NZ)', 10, 2, 'Commit a crime. You may not break the law.', b'0'),
('Series 1 (NZ)', 10, 3, 'Handcuff yourselves together at the wrist, then score 10 \"points\".', b'0'),
('Series 1 (NZ)', 10, 4, 'Make the best desert.', b'0'),
('Series 1 (NZ)', 10, 5, 'Karate chop the thickest spaghetti log. You have one attempt to cleanly chop your entire log.', b'1'),
('Series 1 (UK)', 1, 1, 'Most unusual item.', b'1'),
('Series 1 (UK)', 1, 2, 'In the lab, there is a watermelon. Eat as much watermelon as possible.', b'0'),
('Series 1 (UK)', 1, 3, 'Paint the best picture of a horse whilst riding a horse.', b'0'),
('Series 1 (UK)', 1, 4, 'Completely empty this bathtub. You must not remove the plug, tip or damage the bath.', b'0'),
('Series 1 (UK)', 1, 5, 'Pop up a tent. Get in the tent. Zip up the tent. Pop on a onesie in the tent. And emerge from the tent wearing the onesie.', b'1'),
('Series 1 (UK)', 1, 6, 'Find Alex.', b'0'),
('Series 1 (UK)', 2, 1, 'Most impressive item.', b'1'),
('Series 1 (UK)', 2, 2, 'High-five a 55-year-old.', b'0'),
('Series 1 (UK)', 2, 3, 'Identify the contents of these pies. You may touch the pies, but may not breach their pastry.', b'0'),
('Series 1 (UK)', 2, 4, 'Do something that will look impressive in reverse. The Taskmaster will see whatever act you perform played backwards. You must therefore do something backwards that will look impressive when the footage is played in reverse.', b'0'),
('Series 1 (UK)', 2, 5, 'Crack the code, unshackle yourself and sprint 1 metre.', b'1'),
('Series 1 (UK)', 3, 1, 'Most meaningful item.', b'1'),
('Series 1 (UK)', 3, 2, 'Throw a teabag into a mug from the farthest distance.', b'0'),
('Series 1 (UK)', 3, 3, 'Using this device to track your route, create the best image for the Taskmaster. Pop a balloon to signal you have finished your image.', b'0'),
('Series 1 (UK)', 3, 4, 'Buy the best present for the Taskmaster. Here is £20.', b'0'),
('Series 1 (UK)', 3, 5, 'Using only the items currently on this table, get this egg as high as possible. The egg must not break.', b'0'),
('Series 1 (UK)', 3, 6, 'Stand up after 100 seconds.', b'1'),
('Series 1 (UK)', 3, 7, 'What is Frank Skinner\'s age in minutes?', b'0'),
('Series 1 (UK)', 4, 1, 'Most beautiful item.', b'1'),
('Series 1 (UK)', 4, 2, 'Make this ice block disappear as fast as possible.', b'0'),
('Series 1 (UK)', 4, 3, 'Get to 11 points as fast as possible.', b'0'),
('Series 1 (UK)', 4, 4, 'Fill an egg cup with as many tears as possible.', b'0'),
('Series 1 (UK)', 4, 5, 'Memorise the names of an Australian rules football team.', b'1'),
('Series 1 (UK)', 5, 1, 'Most valuable item.', b'1'),
('Series 1 (UK)', 5, 2, 'Get this boulder as far from this place as possible.', b'0'),
('Series 1 (UK)', 5, 3, 'Grow the longest nail.', b'0'),
('Series 1 (UK)', 5, 4, 'Make this bed to a hotel standard whilst holding hands. Your time ends when you get in the bed. Hold hands now.', b'0'),
('Series 1 (UK)', 5, 5, 'Make this Swedish person blush as deeply as possible.', b'0'),
('Series 1 (UK)', 5, 6, 'Blow up the biggest balloon whilst blindfolded.', b'1'),
('Series 1 (UK)', 6, 1, 'Most satisfying item.', b'1'),
('Series 1 (UK)', 6, 2, 'Get the lowest golf score using eggs. You must complete the 5 holes using chicken eggs. You score will be calculated as follows: Shots x eggs x minutes.', b'0'),
('Series 1 (UK)', 6, 3, 'Stage a realistic blooper from a home movie.', b'0'),
('Series 1 (UK)', 6, 4, 'Make the best meal for the Taskmaster using ingredients beginning with every letter of the alphabet.', b'0'),
('Series 1 (UK)', 6, 5, 'Wearing boxing gloves, put the blue sweets in the empty bowl. Non-blue sweets will be subtracted from your total.', b'1'),
('Series 3 (UK)', 1, 1, 'Most flamboyant clock.', b'1'),
('Series 3 (UK)', 1, 2, 'Get to the microwave in as few steps as possible and open the door before the microwave dings.', b'0'),
('Series 3 (UK)', 1, 3, 'Propel this pea the furthest distance. Your pea must land and remain on the red carpet.', b'0'),
('Series 3 (UK)', 1, 4, 'Make the best snowman.', b'0'),
('Series 3 (UK)', 1, 5, 'Balance your swedes on your Swede. Your Swede must remain standing at all times. Your swedes may only balance on the exterior of your Swede.', b'1'),
('Series 3 (UK)', 2, 1, 'Heaviest item that can fit in a shoebox.', b'1'),
('Series 3 (UK)', 2, 2, 'Surprise Alex when he emerges from the shed in one hour.', b'0'),
('Series 3 (UK)', 2, 3, 'Team Puzzle: Release Alex.', b'0'),
('Series 3 (UK)', 2, 4, 'Create the best upside-down self portrait using only the materials supplied. The Taskmaster will judge the picture when it has been rotated 180 degrees.', b'0'),
('Series 3 (UK)', 2, 5, 'Pop the balloons.', b'0'),
('Series 3 (UK)', 2, 6, 'Unravel a whole roll of sticky tape. Put the unraveled sticky tape in your lunchbox. Close your lunchbox.', b'1'),
('Series 3 (UK)', 3, 1, 'Best battery-operated item.', b'1'),
('Series 3 (UK)', 3, 2, 'Fill this egg cup with your own sweat.', b'0'),
('Series 3 (UK)', 3, 3, 'Make the best domino rally.', b'0'),
('Series 3 (UK)', 3, 4, 'Buy a gift for the Taskmaster.', b'0'),
('Series 3 (UK)', 3, 5, 'Create the best flag meal.', b'0'),
('Series 3 (UK)', 3, 6, 'Anchor these balloons using only bread.', b'1');

-- --------------------------------------------------------

--
-- Structure de la table `taskmaster`
--

CREATE TABLE `taskmaster` (
  `ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `taskmaster`
--

INSERT INTO `taskmaster` (`ID`) VALUES
(1),
(8);

-- --------------------------------------------------------

--
-- Structure de la table `team`
--

CREATE TABLE `team` (
  `ID` int(11) NOT NULL,
  `SERIES_NAME` varchar(13) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `team`
--

INSERT INTO `team` (`ID`, `SERIES_NAME`) VALUES
(1, 'Series 1 (UK)'),
(2, 'Series 1 (UK)'),
(3, 'Series 1 (NZ)'),
(4, 'Series 1 (NZ)'),
(5, 'Series 3 (UK)'),
(6, 'Series 3 (UK)');

-- --------------------------------------------------------

--
-- Structure de la table `teampoints`
--

CREATE TABLE `teampoints` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TASK_NUMBER` int(11) NOT NULL,
  `TEAM_ID` int(11) NOT NULL,
  `POINTS` int(11) NOT NULL,
  `WASDISQUALIFIED` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teampoints`
--

INSERT INTO `teampoints` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `TEAM_ID`, `POINTS`, `WASDISQUALIFIED`) VALUES
('Series 1 (NZ)', 3, 3, 3, 3, b'0'),
('Series 1 (NZ)', 3, 3, 4, 5, b'0'),
('Series 1 (NZ)', 4, 3, 3, 3, b'0'),
('Series 1 (NZ)', 4, 3, 4, 3, b'0'),
('Series 1 (NZ)', 6, 3, 3, 4, b'0'),
('Series 1 (NZ)', 6, 3, 4, 2, b'0'),
('Series 1 (NZ)', 9, 3, 3, 5, b'0'),
('Series 1 (NZ)', 9, 3, 4, 3, b'0'),
('Series 1 (NZ)', 10, 3, 3, 1, b'0'),
('Series 1 (NZ)', 10, 3, 4, 4, b'0'),
('Series 1 (UK)', 4, 3, 1, 1, b'0'),
('Series 1 (UK)', 4, 3, 2, 2, b'0'),
('Series 1 (UK)', 5, 4, 1, 2, b'0'),
('Series 1 (UK)', 5, 4, 2, 0, b'0'),
('Series 1 (UK)', 6, 3, 1, 2, b'0'),
('Series 1 (UK)', 6, 3, 2, 0, b'0'),
('Series 3 (UK)', 2, 3, 5, 0, b'0'),
('Series 3 (UK)', 2, 3, 6, 5, b'0');

-- --------------------------------------------------------

--
-- Structure de la table `teamtask`
--

CREATE TABLE `teamtask` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TASK_NUMBER` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `teamtask`
--

INSERT INTO `teamtask` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`) VALUES
('Series 1 (NZ)', 3, 3),
('Series 1 (NZ)', 4, 3),
('Series 1 (NZ)', 6, 3),
('Series 1 (NZ)', 9, 3),
('Series 1 (NZ)', 10, 3),
('Series 1 (UK)', 4, 3),
('Series 1 (UK)', 5, 4),
('Series 1 (UK)', 6, 3),
('Series 3 (UK)', 2, 3);

-- --------------------------------------------------------

--
-- Structure de la table `tiebreaker`
--

CREATE TABLE `tiebreaker` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` varchar(2) NOT NULL,
  `TASK_NUMBER` varchar(2) NOT NULL,
  `WINNER_ID` varchar(1) NOT NULL,
  `LOSER_ID` varchar(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tiebreaker`
--

INSERT INTO `tiebreaker` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `WINNER_ID`, `LOSER_ID`) VALUES
('Series 1 (UK)', '1', '6', '3', '6'),
('Series 1 (UK)', '3', '7', '4', '6');

-- --------------------------------------------------------

--
-- Structure de la table `tiebreakerresult`
--

CREATE TABLE `tiebreakerresult` (
  `SERIES_NAME` varchar(13) NOT NULL,
  `EPISODE_NUMBER` int(11) NOT NULL,
  `TASK_NUMBER` int(11) NOT NULL,
  `CANDIDATE_ID` int(11) NOT NULL,
  `WON` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `tiebreakerresult`
--

INSERT INTO `tiebreakerresult` (`SERIES_NAME`, `EPISODE_NUMBER`, `TASK_NUMBER`, `CANDIDATE_ID`, `WON`) VALUES
('Series 1 (UK)', 1, 6, 3, b'1'),
('Series 1 (UK)', 1, 6, 6, b'0'),
('Series 1 (UK)', 3, 7, 4, b'1'),
('Series 1 (UK)', 3, 7, 6, b'0');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `assistant`
--
ALTER TABLE `assistant`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `candidate`
--
ALTER TABLE `candidate`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `episode`
--
ALTER TABLE `episode`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`);

--
-- Index pour la table `feature`
--
ALTER TABLE `feature`
  ADD PRIMARY KEY (`SERIES_NAME`,`CANDIDATE_ID`);

--
-- Index pour la table `individualtask`
--
ALTER TABLE `individualtask`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`);

--
-- Index pour la table `job`
--
ALTER TABLE `job`
  ADD PRIMARY KEY (`CANDIDATE_ID`,`JOB`);

--
-- Index pour la table `membership`
--
ALTER TABLE `membership`
  ADD PRIMARY KEY (`TEAM_ID`,`CANDIDATE_ID`);

--
-- Index pour la table `person`
--
ALTER TABLE `person`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `points`
--
ALTER TABLE `points`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`,`CANDIDATE_ID`);

--
-- Index pour la table `series`
--
ALTER TABLE `series`
  ADD PRIMARY KEY (`NAME`);

--
-- Index pour la table `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`);

--
-- Index pour la table `taskmaster`
--
ALTER TABLE `taskmaster`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`ID`);

--
-- Index pour la table `teampoints`
--
ALTER TABLE `teampoints`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`,`TEAM_ID`);

--
-- Index pour la table `teamtask`
--
ALTER TABLE `teamtask`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`);

--
-- Index pour la table `tiebreaker`
--
ALTER TABLE `tiebreaker`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`);

--
-- Index pour la table `tiebreakerresult`
--
ALTER TABLE `tiebreakerresult`
  ADD PRIMARY KEY (`SERIES_NAME`,`EPISODE_NUMBER`,`TASK_NUMBER`,`CANDIDATE_ID`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `person`
--
ALTER TABLE `person`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
