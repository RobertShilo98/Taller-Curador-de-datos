/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `empresa` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `empresa`;

CREATE TABLE IF NOT EXISTS `equipos` (
  `ID_equipos` int(20) unsigned NOT NULL,
  `Modelo` varchar(50) DEFAULT NULL,
  `Marca` varchar(50) DEFAULT NULL,
  `Descripción` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID_equipos`),
  FULLTEXT KEY `Modelo` (`Modelo`,`Marca`,`Descripción`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `equipos` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `problemas` (
  `ID_problema` int(20) unsigned DEFAULT NULL,
  `ID_equipos` int(20) unsigned DEFAULT NULL,
  `ID_usuario` int(20) unsigned DEFAULT NULL,
  `Técnico` varchar(50) DEFAULT NULL,
  `Descripción` varchar(50) DEFAULT NULL,
  KEY `Equipo - Problema` (`ID_equipos`),
  KEY `Usuario - Problema` (`ID_usuario`),
  CONSTRAINT `Equipo - Problema` FOREIGN KEY (`ID_equipos`) REFERENCES `equipos` (`ID_equipos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Usuario - Problema` FOREIGN KEY (`ID_usuario`) REFERENCES `usuarios` (`ID_usuarios`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `problemas` DISABLE KEYS */;
/*!40000 ALTER TABLE `problemas` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `usuarios` (
  `ID_usuarios` int(20) unsigned NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Teléfono` int(15) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_usuarios`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
