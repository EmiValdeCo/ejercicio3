-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_universidad_edumangase
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_alumnos`
--

DROP TABLE IF EXISTS `tb_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alumnos` (
  `id_alumno` varchar(36) NOT NULL DEFAULT uuid(),
  `carnet_alumno` varchar(10) DEFAULT NULL,
  `nombre_alumno` varchar(50) NOT NULL,
  `apellido_alumno` varchar(50) NOT NULL,
  `edad_alumno` int(11) NOT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `carnet_alumno` (`carnet_alumno`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alumnos`
--

LOCK TABLES `tb_alumnos` WRITE;
/*!40000 ALTER TABLE `tb_alumnos` DISABLE KEYS */;
INSERT INTO `tb_alumnos` VALUES ('4b7c4cdb-d65d-11ee-8a56-14d424856382','GM15','Monica','Alas',24),('4cf7908e-d65d-11ee-8a56-14d424856382','GM14','Carmen','Torres',24),('4e7e7ccd-d65d-11ee-8a56-14d424856382','GM13','Javier','Ruiz',23),('500eafcc-d65d-11ee-8a56-14d424856382','GM12','Marta','Álvarez',22),('518bc54e-d65d-11ee-8a56-14d424856382','GM11','Luis','Muñoz',21),('52fe8939-d65d-11ee-8a56-14d424856382','GM10','Elena','Díaz',20),('546c8c9e-d65d-11ee-8a56-14d424856382','GM9','Carlos','Romero',19),('55b7c228-d65d-11ee-8a56-14d424856382','GM8','Sofía','Sánchez',18),('574e359c-d65d-11ee-8a56-14d424856382','GM7','Diego','Pérez',17),('58adc33d-d65d-11ee-8a56-14d424856382','GM6','Laura','García',16),('59f86fa7-d65d-11ee-8a56-14d424856382','GM5','Pedro','López',15),('5b3e84be-d65d-11ee-8a56-14d424856382','GM4','Ana','Hernández',14),('5ce74696-d65d-11ee-8a56-14d424856382','GM3','José','Martínez',13),('5e275df9-d65d-11ee-8a56-14d424856382','GM2','María','Rodríguez',12),('f9405f4e-d65c-11ee-8a56-14d424856382','GM1','Emiliano','Jacobo',11);
/*!40000 ALTER TABLE `tb_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_calificaciones`
--

DROP TABLE IF EXISTS `tb_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_calificaciones` (
  `id_calificacion` varchar(36) NOT NULL DEFAULT uuid(),
  `id_inscripcion` varchar(36) NOT NULL,
  `calificacion_final` decimal(5,2) NOT NULL CHECK (`calificacion_final` >= 0 and `calificacion_final` <= 10),
  `fecha_calificacion` date NOT NULL,
  PRIMARY KEY (`id_calificacion`),
  KEY `id_inscripcion` (`id_inscripcion`),
  CONSTRAINT `tb_calificaciones_ibfk_1` FOREIGN KEY (`id_inscripcion`) REFERENCES `tb_inscripciones` (`id_inscripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_calificaciones`
--

LOCK TABLES `tb_calificaciones` WRITE;
/*!40000 ALTER TABLE `tb_calificaciones` DISABLE KEYS */;
INSERT INTO `tb_calificaciones` VALUES ('06a63627-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',8.20,'2024-02-20'),('0b45f469-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',9.50,'2024-03-10'),('1d2fe988-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',6.00,'2024-04-05'),('1efc2007-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',8.00,'2024-05-12'),('21a17785-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',7.50,'2024-06-25'),('234f3ee5-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',8.70,'2024-07-08'),('24cf7b25-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',7.20,'2024-08-18'),('26c65027-d6a5-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',7.80,'2024-10-03'),('28c64283-d6a5-11ee-8a56-14d424856382','1ce51ca5-d6a2-11ee-8a56-14d424856382',7.50,'2024-12-20'),('2adf024a-d6a5-11ee-8a56-14d424856382','a529e782-d663-11ee-8a56-14d424856382',9.70,'2025-01-05'),('2c7a80e3-d6a5-11ee-8a56-14d424856382','a53512a4-d663-11ee-8a56-14d424856382',6.00,'2025-02-08'),('2e28d21d-d6a5-11ee-8a56-14d424856382','a537be42-d663-11ee-8a56-14d424856382',8.50,'2025-03-17'),('f2ffb7b3-d6a4-11ee-8a56-14d424856382','04460800-d663-11ee-8a56-14d424856382',5.50,'2024-01-15');
/*!40000 ALTER TABLE `tb_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inscripciones`
--

DROP TABLE IF EXISTS `tb_inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inscripciones` (
  `id_inscripcion` varchar(36) NOT NULL DEFAULT uuid(),
  `id_alumno` varchar(36) NOT NULL,
  `id_materia` varchar(36) NOT NULL,
  `fecha_inscripcion` date NOT NULL,
  `estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `id_alumno` (`id_alumno`),
  KEY `id_materia` (`id_materia`),
  CONSTRAINT `tb_inscripciones_ibfk_1` FOREIGN KEY (`id_alumno`) REFERENCES `tb_alumnos` (`id_alumno`),
  CONSTRAINT `tb_inscripciones_ibfk_2` FOREIGN KEY (`id_materia`) REFERENCES `tb_materias` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inscripciones`
--

LOCK TABLES `tb_inscripciones` WRITE;
/*!40000 ALTER TABLE `tb_inscripciones` DISABLE KEYS */;
INSERT INTO `tb_inscripciones` VALUES ('04460800-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('1ce51ca5-d6a2-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a529e782-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a53512a4-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a537be42-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a53a1dba-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a53c5e8d-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a53ef565-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a54163d7-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a543f880-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a546916e-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a548f0f7-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a54b8891-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a54e22c7-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a550a92d-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo'),('a553462c-d663-11ee-8a56-14d424856382','4b7c4cdb-d65d-11ee-8a56-14d424856382','2dd3ac15-d661-11ee-8a56-14d424856382','2024-02-28','Activo');
/*!40000 ALTER TABLE `tb_inscripciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizacion_cupos 
AFTER INSERT ON tb_inscripciones
FOR EACH ROW
BEGIN
	UPDATE tb_materias
	SET cupos = cupos - 1
	WHERE id_materia = NEW.id_materia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_materias`
--

DROP TABLE IF EXISTS `tb_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_materias` (
  `id_materia` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre_materia` varchar(100) NOT NULL,
  `grupo_materia` int(11) NOT NULL,
  `id_profesor` varchar(36) NOT NULL,
  `cupos` int(11) NOT NULL CHECK (`cupos` >= 0),
  PRIMARY KEY (`id_materia`),
  KEY `id_profesor` (`id_profesor`),
  CONSTRAINT `tb_materias_ibfk_1` FOREIGN KEY (`id_profesor`) REFERENCES `tb_profesores` (`id_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_materias`
--

LOCK TABLES `tb_materias` WRITE;
/*!40000 ALTER TABLE `tb_materias` DISABLE KEYS */;
INSERT INTO `tb_materias` VALUES ('2dd3ac15-d661-11ee-8a56-14d424856382','Matemáticas',1,'8e26d761-d65b-11ee-8a56-14d424856382',14),('2fb6a3b6-d661-11ee-8a56-14d424856382','Lenguaje',1,'9c6e8a2a-d65b-11ee-8a56-14d424856382',30),('31d00d31-d662-11ee-8a56-14d424856382','Filosofía',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('31ee5e14-d661-11ee-8a56-14d424856382','Historia',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('33651a6a-d661-11ee-8a56-14d424856382','Ciencias Naturales',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('355feb30-d661-11ee-8a56-14d424856382','Educación Física',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('49326eaf-d661-11ee-8a56-14d424856382','Inglés',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('4ab31d8f-d661-11ee-8a56-14d424856382','Geografía',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('4c7900f8-d661-11ee-8a56-14d424856382','Artes',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('4e15d29e-d661-11ee-8a56-14d424856382','Biología',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('4f77c653-d661-11ee-8a56-14d424856382','Física',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('5104956a-d661-11ee-8a56-14d424856382','Química',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('5251be43-d661-11ee-8a56-14d424856382','Literatura',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('5430c053-d661-11ee-8a56-14d424856382','Economía',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('7d0007dc-d661-11ee-8a56-14d424856382','Filosofía',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30),('f46d9647-d662-11ee-8a56-14d424856382','Filosofía',1,'9d8b6eb4-d65b-11ee-8a56-14d424856382',30);
/*!40000 ALTER TABLE `tb_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profesores`
--

DROP TABLE IF EXISTS `tb_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_profesores` (
  `id_profesor` varchar(36) NOT NULL DEFAULT uuid(),
  `nombre` varchar(100) NOT NULL,
  `apellido` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profesores`
--

LOCK TABLES `tb_profesores` WRITE;
/*!40000 ALTER TABLE `tb_profesores` DISABLE KEYS */;
INSERT INTO `tb_profesores` VALUES ('8e26d761-d65b-11ee-8a56-14d424856382','Juan','González','juan.gonzalez@example.com'),('9c6e8a2a-d65b-11ee-8a56-14d424856382','María','Rodríguez','maria.rodriguez@example.com'),('9d8b6eb4-d65b-11ee-8a56-14d424856382','José','Martínez','jose.martinez@example.com'),('9eaf28a2-d65b-11ee-8a56-14d424856382','Ana','Hernández','ana.hernandez@example.com'),('a0df6585-d65b-11ee-8a56-14d424856382','Pedro','López','pedro.lopez@example.com'),('a61bd2d3-d65b-11ee-8a56-14d424856382','Laura','García','laura.garcia@example.com'),('a793f442-d65b-11ee-8a56-14d424856382','Diego','Pérez','diego.perez@example.com'),('a8fbed15-d65b-11ee-8a56-14d424856382','Sofía','Sánchez','sofia.sanchez@example.com'),('aa56b51b-d65b-11ee-8a56-14d424856382','Carlos','Romero','carlos.romero@example.com'),('abbb868e-d65b-11ee-8a56-14d424856382','Elena','Díaz','elena.diaz@example.com'),('ad973047-d65b-11ee-8a56-14d424856382','Luis','Muñoz','luis.munoz@example.com'),('aed113e0-d65b-11ee-8a56-14d424856382','Marta','Álvarez','marta.alvarez@example.com'),('b0616509-d65b-11ee-8a56-14d424856382','Javier','Ruiz','javier.ruiz@example.com'),('b1d8c3a5-d65b-11ee-8a56-14d424856382','Carmen','Torres','carmen.torres@example.com'),('c22c22f0-d65a-11ee-8a56-14d424856382','Emiliano','Jacobo','Emiliano@gmail.com');
/*!40000 ALTER TABLE `tb_profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 19:59:11
