/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `empresados` /*!40100 DEFAULT CHARACTER SET latin1 COLLATE latin1_general_ci */;
USE `empresados`;

CREATE TABLE IF NOT EXISTS `equipo` (
  `ID_equipo` int(20) unsigned NOT NULL,
  `Tipo_de_equipo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Marca` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Modelo` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Descripción` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `Otro` varchar(100) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_equipo`),
  FULLTEXT KEY `Tipo_de_equipo` (`Tipo_de_equipo`,`Marca`,`Modelo`,`Descripción`,`Otro`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `estado` (
  `ID_estado` int(20) unsigned NOT NULL,
  `Descripción_estado` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_estado`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `estado` DISABLE KEYS */;
/*!40000 ALTER TABLE `estado` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `histórico_problema` (
  `ID_histórico_problema` int(20) unsigned NOT NULL,
  `ID_nivel_prioridad` int(20) unsigned NOT NULL,
  `ID_técnico_asignado` int(20) unsigned NOT NULL,
  `ID_problema` int(20) unsigned NOT NULL,
  `ID_estado` int(20) unsigned NOT NULL,
  `Fecha_de_solución` date DEFAULT NULL,
  PRIMARY KEY (`ID_histórico_problema`),
  KEY `técnico - ID_técnico_asignado` (`ID_técnico_asignado`),
  KEY `nivel_de_prioridad - Histórico_problema` (`ID_nivel_prioridad`),
  KEY `Estado - Histórico_problema` (`ID_estado`),
  KEY `Problema - Histórico_problema` (`ID_problema`),
  CONSTRAINT `Estado - Histórico_problema` FOREIGN KEY (`ID_estado`) REFERENCES `estado` (`ID_estado`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Problema - Histórico_problema` FOREIGN KEY (`ID_problema`) REFERENCES `problema` (`ID_problema`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `nivel_de_prioridad - Histórico_problema` FOREIGN KEY (`ID_nivel_prioridad`) REFERENCES `nivel_de_prioridad` (`ID_nivel_de_prioridad`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `técnico - ID_técnico_asignado` FOREIGN KEY (`ID_técnico_asignado`) REFERENCES `técnico` (`ID_técnico`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `histórico_problema` DISABLE KEYS */;
/*!40000 ALTER TABLE `histórico_problema` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `nivel_de_prioridad` (
  `ID_nivel_de_prioridad` int(20) unsigned NOT NULL,
  `Descripción_del_nivel_prioridad` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_nivel_de_prioridad`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `nivel_de_prioridad` DISABLE KEYS */;
/*!40000 ALTER TABLE `nivel_de_prioridad` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `problema` (
  `ID_problema` int(20) unsigned NOT NULL,
  `ID_equipo` int(20) unsigned NOT NULL,
  `ID_usuario` int(20) unsigned NOT NULL,
  `Descripción_problema` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  `Fecha_de_reporte_del_problema` date DEFAULT NULL,
  PRIMARY KEY (`ID_problema`),
  KEY `Usuario - Problema` (`ID_usuario`),
  KEY `Equipo - Problema` (`ID_equipo`),
  CONSTRAINT `Equipo - Problema` FOREIGN KEY (`ID_equipo`) REFERENCES `equipo` (`ID_equipo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Usuario - Problema` FOREIGN KEY (`ID_usuario`) REFERENCES `usuario` (`ID_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `problema` DISABLE KEYS */;
/*!40000 ALTER TABLE `problema` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `solución` (
  `ID_solución` int(20) unsigned DEFAULT NULL,
  `ID_histórico_problema` int(20) unsigned NOT NULL,
  `Descripción_solución` varchar(250) COLLATE latin1_general_ci DEFAULT NULL,
  KEY `solución - ID_histórico_problema` (`ID_histórico_problema`),
  CONSTRAINT `solución - ID_histórico_problema` FOREIGN KEY (`ID_histórico_problema`) REFERENCES `histórico_problema` (`ID_histórico_problema`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `solución` DISABLE KEYS */;
/*!40000 ALTER TABLE `solución` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `técnico` (
  `ID_técnico` int(20) unsigned NOT NULL,
  `Nombre_técnico` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Apellidos_técnico` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Fecha_ingreso` date DEFAULT NULL,
  `Fecha_retiro` date DEFAULT NULL,
  `Teléfono_técnico` int(15) unsigned DEFAULT NULL,
  `Otros_detalles` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID_técnico`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `técnico` DISABLE KEYS */;
/*!40000 ALTER TABLE `técnico` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `usuario` (
  `ID_usuario` int(20) unsigned NOT NULL,
  `Nombre_usuario` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Apellidos_usuario` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Dirección_usuario` varchar(150) COLLATE latin1_general_ci DEFAULT NULL,
  `Correo_usuario` varchar(50) COLLATE latin1_general_ci DEFAULT NULL,
  `Teléfono_usuario` int(15) unsigned DEFAULT NULL,
  `Otros_datos` int(100) DEFAULT NULL,
  PRIMARY KEY (`ID_usuario`),
  FULLTEXT KEY `Nombre_usuario` (`Nombre_usuario`,`Apellidos_usuario`,`Dirección_usuario`,`Correo_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_general_ci;

/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
