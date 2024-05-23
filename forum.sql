-- --------------------------------------------------------
-- Hôte:                         127.0.0.1
-- Version du serveur:           8.0.30 - MySQL Community Server - GPL
-- SE du serveur:                Win64
-- HeidiSQL Version:             12.1.0.6537
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Listage de la structure de la base pour forum_hafida
CREATE DATABASE IF NOT EXISTS `forum_hafida` /*!40100 DEFAULT CHARACTER SET latin1 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `forum_hafida`;

-- Listage de la structure de table forum_hafida. categorie
CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int NOT NULL AUTO_INCREMENT,
  `categorie` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

-- Listage des données de la table forum_hafida.categorie : ~4 rows (environ)
INSERT INTO `categorie` (`id_categorie`, `categorie`) VALUES
	(1, 'développement personnel'),
	(2, 'relations familiales'),
	(3, 'troubles'),
	(4, 'violences physiques/psychologiques');

-- Listage de la structure de table forum_hafida. message
CREATE TABLE IF NOT EXISTS `message` (
  `id_message` int NOT NULL AUTO_INCREMENT,
  `texte` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dateCreationMessage` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `utilisateur_id` int NOT NULL,
  `sujet_id` int NOT NULL,
  PRIMARY KEY (`id_message`),
  KEY `utilisateur_id` (`utilisateur_id`),
  KEY `sujet_id` (`sujet_id`),
  CONSTRAINT `FK_message_sujet2` FOREIGN KEY (`sujet_id`) REFERENCES `sujet` (`id_sujet`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_message_utilisateur2` FOREIGN KEY (`utilisateur_id`) REFERENCES `utilisateur` (`id_utilisateur`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table forum_hafida.message : ~5 rows (environ)
INSERT INTO `message` (`id_message`, `texte`, `dateCreationMessage`, `utilisateur_id`, `sujet_id`) VALUES
	(1, 'surtout sans prises de tête et dans le respect de chaque un\r\n\r\nje passe te souhaitée une bonne soirée\r\nque vas tu regarder ce soir a la télé\r\nhier a tu regarder le film sur la 6 la faute\r\n\r\nici on a eu de la pluie toute la journée un vrais déluge\r\ndonc j e suis resté dedans\r\ndemain seras un autre jour', '2024-05-23 11:15:24', 1, 1),
	(2, 'Bonjour,\r\n\r\nNous vous proposons un service accessible, afin de faciliter la transmission des informations personnelles, choisies en amont, et ainsi faciliter l\'ensemble de ces démarches.\r\n\r\nNous sommes également à votre service pour toutes les démarches administratives suite au décès :\r\n\r\n- résiliation de contrats et abonnements\r\n- pension de reversion\r\n- recherche de capitaux (très souvent oublié)\r\n- changement de carte grise\r\nCe sont des tâches lourdes et pénibles. Nous sommes présents pour vous épauler dans cette longue mission.', '2024-05-23 11:16:42', 3, 4),
	(3, 'J\'ai la quarantaine et une suspicion d\'un mélange d\'asperger et de TDAH.\r\n\r\n\r\nJ\'ai vécu jusque là plus ou moins dans le déni et l\'ignorance, du fait que mon entourage a toujours été complètement dépassé par mes problèmes, ce qui m\'a forcé à faire énormément d\'effort pour masquer les choses, et ensuite m\'éloigner d\'eux quand ça n\'était plus gérable psychologiquement.\r\n', '2024-05-23 11:18:47', 4, 5),
	(4, 'J’ai une amie qui ce sens harceler elle n’a pas la conscience tranquille elle est toujours tendu comment arranger sa????', '2024-05-23 11:20:45', 5, 6),
	(5, 'Bonjour\r\nJe voudrais savoir si des gens qui sont dans le même cas que moi sans aucune vie sociale ni jamais etai en couple arive à avancer et à s\'en sortir comment s\'occuper tout les jours et être motivé tout en étant seul et personne avec qui se confier et echanger avoir de la complicité car personnellement je n\'arrive plus à suporter cette vie c\'est comme ça pour moi depuis mes 17 ans et j\'ai 25 et un vrai mal etre de ne jamais etre sortir\r\n', '2024-05-23 11:23:20', 2, 2);

-- Listage de la structure de table forum_hafida. sujet
CREATE TABLE IF NOT EXISTS `sujet` (
  `id_sujet` int NOT NULL AUTO_INCREMENT,
  `titre` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `dateCreationSujet` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `verrouillage` tinyint NOT NULL DEFAULT '0',
  `categorie_id` int NOT NULL,
  `utilisateur_id` int NOT NULL,
  PRIMARY KEY (`id_sujet`),
  KEY `categorie_id` (`categorie_id`),
  KEY `utilisateur_id` (`utilisateur_id`),
  CONSTRAINT `FK_sujet_categorie` FOREIGN KEY (`categorie_id`) REFERENCES `categorie` (`id_categorie`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

-- Listage des données de la table forum_hafida.sujet : ~7 rows (environ)
INSERT INTO `sujet` (`id_sujet`, `titre`, `dateCreationSujet`, `verrouillage`, `categorie_id`, `utilisateur_id`) VALUES
	(1, 'Bonheur et joie de vivre', '2024-05-23 11:03:29', 0, 1, 1),
	(2, 'Solitude', '2024-05-23 11:04:17', 0, 1, 2),
	(3, 'Etre parents', '2024-05-23 11:04:58', 0, 2, 3),
	(4, 'Deuil', '2024-05-23 11:05:28', 0, 2, 3),
	(5, 'Autisme', '2024-05-23 11:06:19', 0, 3, 4),
	(6, 'Harcèlement moral', '2024-05-23 11:06:56', 0, 4, 2),
	(7, 'Violences conjugales', '2024-05-23 11:13:37', 0, 4, 5);

-- Listage de la structure de table forum_hafida. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `id_utilisateur` int NOT NULL AUTO_INCREMENT,
  `pseudo` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `email` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `password` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT '0',
  `dateInscription` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `role` varchar(255) CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL DEFAULT 'user',
  PRIMARY KEY (`id_utilisateur`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- Listage des données de la table forum_hafida.utilisateur : ~5 rows (environ)
INSERT INTO `utilisateur` (`id_utilisateur`, `pseudo`, `email`, `password`, `dateInscription`, `role`) VALUES
	(1, 'Glen', 'glen67@gmail.com', 'strasbourg12345/', '2024-05-23 10:54:55', 'user'),
	(2, 'Shyne', 'shyne67@gmail.com', 'strasbourg6789/', '2024-05-23 10:55:31', 'user'),
	(3, 'Zack', 'zack67@gmail.com', 'vesoul12345/', '2024-05-23 10:56:23', 'user'),
	(4, 'Momo', 'momo67@gmail.com', 'vesoul6789/', '2024-05-23 10:57:25', 'user'),
	(5, 'Caro', 'caro67@gmail.com', 'besac56789/', '2024-05-23 10:58:45', 'user');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
