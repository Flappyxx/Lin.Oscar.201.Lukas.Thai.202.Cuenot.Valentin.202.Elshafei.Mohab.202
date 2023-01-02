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


-- Listage de la structure de la base pour siteweb
CREATE DATABASE IF NOT EXISTS `siteweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `siteweb`;

-- Listage de la structure de table siteweb. anime
CREATE TABLE IF NOT EXISTS `anime` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Titre` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  `IdStudio` int unsigned DEFAULT NULL,
  PRIMARY KEY (`Id`) USING BTREE,
  KEY `FK_anime_studio` (`IdStudio`),
  CONSTRAINT `FK_anime_studio` FOREIGN KEY (`IdStudio`) REFERENCES `studio` (`Id`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.anime : ~0 rows (environ)
INSERT INTO `anime` (`Id`, `Titre`, `IdStudio`) VALUES
	(1, 'Mon Voisin Totoro', 1);

-- Listage de la structure de table siteweb. appartenir
CREATE TABLE IF NOT EXISTS `appartenir` (
  `IdPerso` int unsigned NOT NULL,
  `IdAnime` int unsigned NOT NULL,
  PRIMARY KEY (`IdPerso`,`IdAnime`),
  KEY `FK_ANIME_PERSO` (`IdAnime`),
  KEY `FK_PERSO_ANIME` (`IdPerso`) USING BTREE,
  CONSTRAINT `FK_ANIME_PERSO` FOREIGN KEY (`IdAnime`) REFERENCES `anime` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_PERSO_ANIME` FOREIGN KEY (`IdPerso`) REFERENCES `personnage` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.appartenir : ~0 rows (environ)
INSERT INTO `appartenir` (`IdPerso`, `IdAnime`) VALUES
	(1, 1);

-- Listage de la structure de table siteweb. endroit
CREATE TABLE IF NOT EXISTS `endroit` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Latitude` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Longitude` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Description` text CHARACTER SET utf8mb4 NOT NULL,
  `Path` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.endroit : ~0 rows (environ)
INSERT INTO `endroit` (`Id`, `Nom`, `Latitude`, `Longitude`, `Description`, `Path`) VALUES
	(1, 'Camp Motsu', '35.47373341622373', '138.57340485767025', 'Dans Yuru Camp au 1er épisode de la saison 1, c\'est l\'endroit où Rin s\'est reposée. ', '../img/Motsu_Camp.jpg'),
	(2, 'La tente de Rin à Fumotoppara ', '35.39983774689711', '138.562402777369', 'Dans Yuru Camp au 2ème épisode de la saison 1, Rin pose sa tente à cet endroit pour camper.', '../img/Fumatoppara.jpg'),
	(3, 'Supermarché Zebra', '35.4330403874025', '138.44117826335372', 'Dans Yuru Camp au 3ème épisode de la saison 1, c\'est le supermarché dans lequel Aoi travaille à mi-temps. Dans la vrai-vie, ce supermarché s\'appelle Selva Minobu.', '../img/Zebra.jpg'),
	(4, 'Station Yamanashi', '35.68499187607698', '138.68285735481624', 'Dans Yuru Camp au 4ème épisode de la saison 1, Nadeshiko, Aoi et Chiaki se retrouve dans le cadre du 1er camping organisé par leur club.', '../img/Station_Yamanashi.jpg'),
	(5, 'Temple Mitsuke Tenjin', '34.72983228298222', '137.86428796441947', 'Dans Yuru Camp au 2ème épisode de la saison 2, c\'est le temple que Rin visite dans le cadre de son camping du nouvel an.', '../img/Temple_Mitsuke.jpg');
-- Listage de la structure de table siteweb. personnage
CREATE TABLE IF NOT EXISTS `personnage` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Prenom` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  `Path` varchar(100) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.personnage : ~0 rows (environ)
INSERT INTO `personnage` (`Id`, `Nom`, `Prenom`, `Path`) VALUES
	(1, NULL, 'Totoro', NULL);

-- Listage de la structure de table siteweb. studio
CREATE TABLE IF NOT EXISTS `studio` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Latitude` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Longitude` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Description` text CHARACTER SET utf8mb4 NOT NULL,
  `Path` varchar(50) CHARACTER SET utf8mb4 DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.studio : ~0 rows (environ)
INSERT INTO `studio` (`Id`, `Nom`, `Latitude`, `Longitude`, `Description`, `Path`) VALUES
	(1, 'Ghibli', '35.70320', '139.52924', 'Le studio qui a produit de nombreux film comme Mon Voisin Totoro.', '../img/ghibli.jpg'),
	(2, 'C-Station', '35.70057743499931', '139.4780446048134', 'C\'est le studio qui a produit des animes comme Yuru Camp ou Akame Ga Kill.', '../img/C-Station.jpg'),
	(3, 'Gokumi', '35.71670545531594', '139.62550699875445', 'Il a produit des animes comme Toji no Miko ou Kin-iro Mosaic.', '../img/Gokumi.jpg'),
	(4, 'Ufotable', '35.716796985115614', '139.62519613182425', 'Ce studio a produit des animes très connu comme Demon Slayer ou Fate/Zero', '../img/Ufotable.png'),
	(5, 'P.A.WORKS', '35.72277064681467', '139.4759399101618', 'Un studio qui a produit de nombreux animes comme Ya Boy Kongming! ou Shirobako.', '../img/PA-Works.jpg');

-- Listage de la structure de table siteweb. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Identifiant` varchar(50) CHARACTER SET utf8mb4 NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8mb4 NOT NULL,
  PRIMARY KEY (`Identifiant`)
) ENGINE=InnoDB DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.utilisateur : ~0 rows (environ)
INSERT INTO `utilisateur` (`Identifiant`, `Password`) VALUES
	('test', '$2y$10$Jxbsl.pYNupKOsrJ6m0NFedJi89GicSqQT2Z179ffvc6rytw8lrWW');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
