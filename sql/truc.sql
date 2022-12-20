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
CREATE DATABASE IF NOT EXISTS `siteweb` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `siteweb`;

-- Listage de la structure de table siteweb. anime
CREATE TABLE IF NOT EXISTS `anime` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Titre` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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

-- Listage de la structure de table siteweb. personnage
CREATE TABLE IF NOT EXISTS `personnage` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Prenom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `Path` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.personnage : ~0 rows (environ)
INSERT INTO `personnage` (`Id`, `Nom`, `Prenom`, `Path`) VALUES
	(1, NULL, 'Totoro', NULL);

-- Listage de la structure de table siteweb. studio
CREATE TABLE IF NOT EXISTS `studio` (
  `Id` int unsigned NOT NULL AUTO_INCREMENT,
  `Nom` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Latitude` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Longitude` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`Id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=armscii8 ;

-- Listage des données de la table siteweb.studio : ~0 rows (environ)
INSERT INTO `studio` (`Id`, `Nom`, `Latitude`, `Longitude`) VALUES
	(1, 'Ghibli', '35.701913859', '139.524147903');

-- Listage de la structure de table siteweb. utilisateur
CREATE TABLE IF NOT EXISTS `utilisateur` (
  `Identifiant` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `Password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
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
