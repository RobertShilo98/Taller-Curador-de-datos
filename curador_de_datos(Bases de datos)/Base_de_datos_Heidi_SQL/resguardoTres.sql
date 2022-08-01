/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

CREATE DATABASE IF NOT EXISTS `tienda` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `tienda`;

CREATE TABLE IF NOT EXISTS `t_cliente` (
  `ID_cliente` int(20) unsigned NOT NULL,
  `Nombre` varchar(50) DEFAULT '',
  `Apellidos` varchar(50) DEFAULT '',
  `Edad` int(3) unsigned NOT NULL,
  `Sexo` varchar(50) DEFAULT '',
  PRIMARY KEY (`ID_cliente`),
  FULLTEXT KEY `Nombre` (`Nombre`,`Apellidos`,`Sexo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `t_cliente` DISABLE KEYS */;
INSERT INTO `t_cliente` (`ID_cliente`, `Nombre`, `Apellidos`, `Edad`, `Sexo`) VALUES
	(58390, 'Octavio', 'Ruiz', 27, 'M'),
	(58391, 'Diego', 'Fernandez', 32, 'M'),
	(58392, 'Omar', 'Garcia', 24, 'M'),
	(58393, 'Maria', 'Luna', 26, 'F'),
	(58394, 'Silvia', 'Zuñiga', 35, 'F'),
	(58395, 'Pedro', 'Perez', 22, 'M'),
	(58396, 'Sonia', 'Cardona', 29, 'F'),
	(58397, 'Hugo', 'Mendez', 30, 'M'),
	(58398, 'Sofia', 'Parriego', 26, 'F'),
	(58399, 'Sandra', 'Rivas', 31, 'F');
/*!40000 ALTER TABLE `t_cliente` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `t_productos` (
  `ID_producto` int(20) unsigned NOT NULL,
  `Modelo` varchar(50) DEFAULT '',
  `Marca` varchar(50) DEFAULT '',
  `Precio` int(20) unsigned NOT NULL,
  `ID_proveedor` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_producto`),
  KEY `Productos - Proveedor` (`ID_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `t_productos` DISABLE KEYS */;
INSERT INTO `t_productos` (`ID_producto`, `Modelo`, `Marca`, `Precio`, `ID_proveedor`) VALUES
	(12340, 'Camara', 'Sani', 5350, 45638),
	(12341, 'Pantalla', 'Samsoni', 7820, 45632),
	(12342, 'Audifonos', 'Tronic', 1456, 45633),
	(12343, 'DVD', 'Yashi', 1000, 45631),
	(12344, 'Bluray', 'Moshi', 2000, 45636),
	(12345, 'Celular', 'Moma', 5670, 45639),
	(12346, 'Mouse', 'Razor', 560, 45630),
	(12347, 'Laptop', 'vopoi', 17500, 45635),
	(12348, 'Teclado', 'Razor', 1020, 45634),
	(12349, 'Videogame', 'Sanor', 4567, 45637);
/*!40000 ALTER TABLE `t_productos` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `t_proveedor` (
  `ID_proveedor` int(20) unsigned NOT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT '',
  `Dirección` varchar(50) DEFAULT '',
  PRIMARY KEY (`ID_proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `t_proveedor` DISABLE KEYS */;
INSERT INTO `t_proveedor` (`ID_proveedor`, `Nombre`, `Apellidos`, `Dirección`) VALUES
	(45630, 'Manuel', 'Hernández', 'calle coneja #432'),
	(45631, 'Jesus', 'Martinez', 'calle flores #543'),
	(45632, 'Fernanado', 'Lopez', 'calle trejo #654'),
	(45633, 'Ivan', 'Sanchez', 'calle nuvo #765'),
	(45634, 'Rosa', 'Rodriguez', 'calle trolo #876'),
	(45635, 'Merida', 'Rito', 'calle falco #987'),
	(45636, 'Leslie', 'Duran', 'calle mediterraneo #102'),
	(45637, 'Ulises', 'Mendoza', 'calle mar #234'),
	(45638, 'Andrea', 'Guzman', 'calle yate #345'),
	(45639, 'Luz', 'Velazquez', 'calle siempre viva #678');
/*!40000 ALTER TABLE `t_proveedor` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `t_sucursal` (
  `ID_sucursal` int(20) unsigned NOT NULL,
  `Nombre` varchar(50) DEFAULT '',
  `Dirección` varchar(50) DEFAULT '',
  PRIMARY KEY (`ID_sucursal`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `t_sucursal` DISABLE KEYS */;
INSERT INTO `t_sucursal` (`ID_sucursal`, `Nombre`, `Dirección`) VALUES
	(23560, 'Salmons tropia', 'calle tropia #234'),
	(23561, 'Salmons naranjo', 'calle naranjo #345'),
	(23562, 'Salmons artemisa', 'calle artemisa #456'),
	(23563, 'Salmons pichacho', 'calle picacho #567'),
	(23564, 'Salmons fisica', 'calle fisica #678');
/*!40000 ALTER TABLE `t_sucursal` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `t_vendedor` (
  `ID_vendedor` int(20) unsigned NOT NULL,
  `ID_sucursal` int(20) unsigned DEFAULT NULL,
  `Nombre` varchar(50) DEFAULT NULL,
  `Apellidos` varchar(50) DEFAULT NULL,
  `Teléfono` int(20) unsigned DEFAULT NULL,
  PRIMARY KEY (`ID_vendedor`),
  KEY `Sucursal - Vendedor` (`ID_sucursal`),
  CONSTRAINT `Sucursal - Vendedor` FOREIGN KEY (`ID_sucursal`) REFERENCES `t_sucursal` (`ID_sucursal`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `t_vendedor` DISABLE KEYS */;
INSERT INTO `t_vendedor` (`ID_vendedor`, `ID_sucursal`, `Nombre`, `Apellidos`, `Teléfono`) VALUES
	(67840, 23562, 'Alberto', 'Ascencio', 84592730),
	(67841, 23562, 'Paulina', 'Rivera', 89452356),
	(67842, 23564, 'Jose', 'Bueno', 98653265),
	(67843, 23564, 'Eduardo', 'Telones', 98342761),
	(67844, 23561, 'Martha', 'Mota', 14568723),
	(67845, 23561, 'Alonso', 'Garcia', 14789534),
	(67846, 23563, 'Diego', 'Trenes', 34679512),
	(67847, 23563, 'Monica', 'Diaz', 34785612),
	(67848, 23560, 'Maricela', 'Hernandez', 78341267),
	(67849, 23560, 'Joel', 'Rico', 78563453);
/*!40000 ALTER TABLE `t_vendedor` ENABLE KEYS */;

CREATE TABLE IF NOT EXISTS `t_ventas` (
  `ID_cliente` int(20) unsigned DEFAULT NULL,
  `ID_venta` int(20) unsigned NOT NULL,
  `ID_vendedor` int(20) unsigned DEFAULT NULL,
  `ID_producto` int(20) unsigned DEFAULT NULL,
  `Fecha` date DEFAULT NULL,
  KEY `Cliente - Ventas` (`ID_cliente`),
  KEY `Producto - Ventas` (`ID_producto`),
  KEY `Vendedor - Ventas` (`ID_vendedor`),
  CONSTRAINT `Cliente - Ventas` FOREIGN KEY (`ID_cliente`) REFERENCES `t_cliente` (`ID_cliente`),
  CONSTRAINT `Producto - Ventas` FOREIGN KEY (`ID_producto`) REFERENCES `t_productos` (`ID_producto`),
  CONSTRAINT `Vendedor - Ventas` FOREIGN KEY (`ID_vendedor`) REFERENCES `t_vendedor` (`ID_vendedor`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*!40000 ALTER TABLE `t_ventas` DISABLE KEYS */;
INSERT INTO `t_ventas` (`ID_cliente`, `ID_venta`, `ID_vendedor`, `ID_producto`, `Fecha`) VALUES
	(58391, 1, 67840, 12342, '2015-02-06'),
	(58397, 2, 67845, 12344, '2015-02-06'),
	(58393, 3, 67846, 12340, '2015-02-06'),
	(58390, 4, 67843, 12345, '2015-02-06'),
	(58392, 5, 67849, 12343, '2015-02-06'),
	(58395, 6, 67842, 12347, '2015-02-06'),
	(58399, 7, 67848, 12346, '2015-02-06'),
	(58394, 8, 67844, 12341, '2015-02-06'),
	(58398, 9, 67847, 12348, '2015-02-06'),
	(58396, 10, 67841, 12349, '2015-02-06'),
	(58391, 11, 67840, 12344, '2015-03-06'),
	(58397, 12, 67845, 12340, '2015-03-06'),
	(58393, 13, 67846, 12345, '2015-03-06'),
	(58390, 14, 67843, 12343, '2015-03-06'),
	(58392, 15, 67849, 12347, '2015-03-06'),
	(58395, 16, 67842, 12346, '2015-03-06'),
	(58399, 17, 67848, 12341, '2015-03-06'),
	(58394, 18, 67844, 12348, '2015-03-06'),
	(58398, 19, 67847, 12349, '2015-03-06'),
	(58396, 20, 67841, 12342, '2015-03-06'),
	(58391, 21, 67840, 12340, '2015-04-06'),
	(58397, 22, 67845, 12345, '2015-04-06'),
	(58393, 23, 67846, 12343, '2015-04-06'),
	(58390, 24, 67843, 12347, '2015-04-06'),
	(58392, 25, 67849, 12346, '2015-04-06'),
	(58395, 26, 67842, 12341, '2015-04-06'),
	(58399, 27, 67848, 12348, '2015-04-06'),
	(58394, 28, 67844, 12349, '2015-04-06'),
	(58398, 29, 67847, 12342, '2015-04-06'),
	(58396, 30, 67841, 12344, '2015-04-06'),
	(58391, 31, 67840, 12345, '2015-05-06'),
	(58397, 32, 67845, 12343, '2015-05-06'),
	(58393, 33, 67846, 12347, '2015-05-06'),
	(58390, 34, 67843, 12346, '2015-05-06'),
	(58392, 35, 67849, 12341, '2015-05-06'),
	(58395, 36, 67842, 12348, '2015-05-06'),
	(58399, 37, 67848, 12349, '2015-05-06'),
	(58394, 38, 67844, 12342, '2015-05-06'),
	(58398, 39, 67847, 12344, '2015-05-06'),
	(58396, 40, 67841, 12340, '2015-05-06'),
	(58391, 41, 67840, 12345, '2015-07-06'),
	(58397, 42, 67845, 12343, '2015-07-06'),
	(58393, 43, 67846, 12347, '2015-07-06'),
	(58390, 44, 67843, 12341, '2015-07-06'),
	(58392, 45, 67849, 12348, '2015-07-06'),
	(58395, 46, 67842, 12349, '2015-07-06'),
	(58399, 47, 67848, 12342, '2015-07-06'),
	(58394, 48, 67844, 12344, '2015-07-06'),
	(58398, 49, 67847, 12340, '2015-07-06'),
	(58396, 50, 67841, 12345, '2015-07-06'),
	(58391, 1, 67840, 12342, '2015-02-06'),
	(58397, 2, 67845, 12344, '2015-02-06'),
	(58393, 3, 67846, 12340, '2015-02-06'),
	(58390, 4, 67843, 12345, '2015-02-06'),
	(58392, 5, 67849, 12343, '2015-02-06'),
	(58395, 6, 67842, 12347, '2015-02-06'),
	(58399, 7, 67848, 12346, '2015-02-06'),
	(58394, 8, 67844, 12341, '2015-02-06'),
	(58398, 9, 67847, 12348, '2015-02-06'),
	(58396, 10, 67841, 12349, '2015-02-06'),
	(58391, 11, 67840, 12344, '2015-03-06'),
	(58397, 12, 67845, 12340, '2015-03-06'),
	(58393, 13, 67846, 12345, '2015-03-06'),
	(58390, 14, 67843, 12343, '2015-03-06'),
	(58392, 15, 67849, 12347, '2015-03-06'),
	(58395, 16, 67842, 12346, '2015-03-06'),
	(58399, 17, 67848, 12341, '2015-03-06'),
	(58394, 18, 67844, 12348, '2015-03-06'),
	(58398, 19, 67847, 12349, '2015-03-06'),
	(58396, 20, 67841, 12342, '2015-03-06'),
	(58391, 21, 67840, 12340, '2015-04-06'),
	(58397, 22, 67845, 12345, '2015-04-06'),
	(58393, 23, 67846, 12343, '2015-04-06'),
	(58390, 24, 67843, 12347, '2015-04-06'),
	(58392, 25, 67849, 12346, '2015-04-06'),
	(58395, 26, 67842, 12341, '2015-04-06'),
	(58399, 27, 67848, 12348, '2015-04-06'),
	(58394, 28, 67844, 12349, '2015-04-06'),
	(58398, 29, 67847, 12342, '2015-04-06'),
	(58396, 30, 67841, 12344, '2015-04-06'),
	(58391, 31, 67840, 12345, '2015-05-06'),
	(58397, 32, 67845, 12343, '2015-05-06'),
	(58393, 33, 67846, 12347, '2015-05-06'),
	(58390, 34, 67843, 12346, '2015-05-06'),
	(58392, 35, 67849, 12341, '2015-05-06'),
	(58395, 36, 67842, 12348, '2015-05-06'),
	(58399, 37, 67848, 12349, '2015-05-06'),
	(58394, 38, 67844, 12342, '2015-05-06'),
	(58398, 39, 67847, 12344, '2015-05-06'),
	(58396, 40, 67841, 12340, '2015-05-06'),
	(58391, 41, 67840, 12345, '2015-07-06'),
	(58397, 42, 67845, 12343, '2015-07-06'),
	(58393, 43, 67846, 12347, '2015-07-06'),
	(58390, 44, 67843, 12341, '2015-07-06'),
	(58392, 45, 67849, 12348, '2015-07-06'),
	(58395, 46, 67842, 12349, '2015-07-06'),
	(58399, 47, 67848, 12342, '2015-07-06'),
	(58394, 48, 67844, 12344, '2015-07-06'),
	(58398, 49, 67847, 12340, '2015-07-06'),
	(58396, 50, 67841, 12345, '2015-07-06'),
	(58391, 1, 67840, 12342, '2015-02-06'),
	(58397, 2, 67845, 12344, '2015-02-06'),
	(58393, 3, 67846, 12340, '2015-02-06'),
	(58390, 4, 67843, 12345, '2015-02-06'),
	(58392, 5, 67849, 12343, '2015-02-06'),
	(58395, 6, 67842, 12347, '2015-02-06'),
	(58399, 7, 67848, 12346, '2015-02-06'),
	(58394, 8, 67844, 12341, '2015-02-06'),
	(58398, 9, 67847, 12348, '2015-02-06'),
	(58396, 10, 67841, 12349, '2015-02-06'),
	(58391, 11, 67840, 12344, '2015-03-06'),
	(58397, 12, 67845, 12340, '2015-03-06'),
	(58393, 13, 67846, 12345, '2015-03-06'),
	(58390, 14, 67843, 12343, '2015-03-06'),
	(58392, 15, 67849, 12347, '2015-03-06'),
	(58395, 16, 67842, 12346, '2015-03-06'),
	(58399, 17, 67848, 12341, '2015-03-06'),
	(58394, 18, 67844, 12348, '2015-03-06'),
	(58398, 19, 67847, 12349, '2015-03-06'),
	(58396, 20, 67841, 12342, '2015-03-06'),
	(58391, 21, 67840, 12340, '2015-04-06'),
	(58397, 22, 67845, 12345, '2015-04-06'),
	(58393, 23, 67846, 12343, '2015-04-06'),
	(58390, 24, 67843, 12347, '2015-04-06'),
	(58392, 25, 67849, 12346, '2015-04-06'),
	(58395, 26, 67842, 12341, '2015-04-06'),
	(58399, 27, 67848, 12348, '2015-04-06'),
	(58394, 28, 67844, 12349, '2015-04-06'),
	(58398, 29, 67847, 12342, '2015-04-06'),
	(58396, 30, 67841, 12344, '2015-04-06'),
	(58391, 31, 67840, 12345, '2015-05-06'),
	(58397, 32, 67845, 12343, '2015-05-06'),
	(58393, 33, 67846, 12347, '2015-05-06'),
	(58390, 34, 67843, 12346, '2015-05-06'),
	(58392, 35, 67849, 12341, '2015-05-06'),
	(58395, 36, 67842, 12348, '2015-05-06'),
	(58399, 37, 67848, 12349, '2015-05-06'),
	(58394, 38, 67844, 12342, '2015-05-06'),
	(58398, 39, 67847, 12344, '2015-05-06'),
	(58396, 40, 67841, 12340, '2015-05-06'),
	(58391, 41, 67840, 12345, '2015-07-06'),
	(58397, 42, 67845, 12343, '2015-07-06'),
	(58393, 43, 67846, 12347, '2015-07-06'),
	(58390, 44, 67843, 12341, '2015-07-06'),
	(58392, 45, 67849, 12348, '2015-07-06'),
	(58395, 46, 67842, 12349, '2015-07-06'),
	(58399, 47, 67848, 12342, '2015-07-06'),
	(58394, 48, 67844, 12344, '2015-07-06'),
	(58398, 49, 67847, 12340, '2015-07-06'),
	(58396, 50, 67841, 12345, '2015-07-06');
/*!40000 ALTER TABLE `t_ventas` ENABLE KEYS */;

CREATE TABLE `vista_1` (
	`Nombre` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Apellidos` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Edad` INT(3) UNSIGNED NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `vista_2` (
	`Marca` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`modelo` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Precio` INT(20) UNSIGNED NOT NULL
) ENGINE=MyISAM;

CREATE TABLE `vista_3` (
	`ID_proveedor` INT(20) UNSIGNED NULL,
	`ID_producto` INT(20) UNSIGNED NOT NULL,
	`Marca` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Modelo` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci'
) ENGINE=MyISAM;

CREATE TABLE `vista_4` (
	`Nombre` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Apellidos` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`ID_producto` INT(20) UNSIGNED NOT NULL,
	`Fecha` DATE NULL
) ENGINE=MyISAM;

CREATE TABLE `vista_5` (
	`Nombre` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Apellidos` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Marca` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`Modelo` VARCHAR(50) NULL COLLATE 'latin1_swedish_ci',
	`ID_producto` INT(20) UNSIGNED NOT NULL,
	`ID_proveedor` INT(20) UNSIGNED NULL
) ENGINE=MyISAM;

DROP TABLE IF EXISTS `vista_1`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_1` AS SELECT Nombre, Apellidos, Edad FROM t_cliente ;

DROP TABLE IF EXISTS `vista_2`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_2` AS SELECT Marca, modelo, Precio FROM t_productos WHERE Precio < 10000 ;

DROP TABLE IF EXISTS `vista_3`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_3` AS SELECT ID_proveedor, ID_producto, Marca, Modelo FROM t_productos WHERE ID_proveedor = '45636' ;

DROP TABLE IF EXISTS `vista_4`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_4` AS SELECT t_cliente.Nombre, t_cliente.Apellidos, t_productos.ID_producto, t_ventas.Fecha FROM t_cliente

INNER JOIN t_productos INNER JOIN t_ventas ON t_cliente.ID_cliente = t_ventas.ID_cliente

AND t_productos.ID_producto = t_ventas.ID_producto ;

DROP TABLE IF EXISTS `vista_5`;
CREATE ALGORITHM=UNDEFINED SQL SECURITY DEFINER VIEW `vista_5` AS SELECT t_proveedor.Nombre, t_proveedor.Apellidos, t_productos.Marca, t_productos.Modelo, t_productos.ID_producto, t_productos.ID_proveedor FROM t_proveedor

INNER JOIN t_productos ON t_proveedor.ID_proveedor = t_productos.ID_proveedor ;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
