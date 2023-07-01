CREATE DATABASE  IF NOT EXISTS `lab8` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `lab8`;
-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: lab8
-- ------------------------------------------------------
-- Server version	8.0.28

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `estudiante`
--

DROP TABLE IF EXISTS `estudiante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estudiante` (
  `codigoPUCP` varchar(8) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `edad` int NOT NULL,
  `especialidad` varchar(100) NOT NULL,
  `contrasena` varchar(200) NOT NULL,
  `confirmacionContra` varchar(200) NOT NULL,
  `Status_idStatus` int DEFAULT NULL,
  `correoPUCP` varchar(100) NOT NULL,
  PRIMARY KEY (`codigoPUCP`),
  KEY `fk_Estudiante_Status1_idx` (`Status_idStatus`),
  CONSTRAINT `fk_Estudiante_Status1` FOREIGN KEY (`Status_idStatus`) REFERENCES `status` (`idStatus`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiante`
--

LOCK TABLES `estudiante` WRITE;
/*!40000 ALTER TABLE `estudiante` DISABLE KEYS */;
INSERT INTO `estudiante` VALUES ('20200800','Maricielo','Romo',20,'Ingeniería de las Telecomunicaciones','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',1,'a20200800@pucp.edu.pe'),('20200823','Olivia','Rodrigo',20,'Ingeniería de las Telecomunicaciones','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,'a20200823@pucp.edu.pe'),('20200826','Olivia','Pope',24,'Ingeniería de las Telecomunicaciones','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92','8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92',1,'a20200826@pucp.edu.pe'),('20201213','PRUEBAA','PREUBAA22',20,'Ingeniería de las Telecomunicaciones','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',1,'a20203739@pucp.edu.pe'),('20201234','Abel','Carranza',21,'Ingeniería de las Telecomunicaciones','f6f2ea8f45d8a057c9566a33f99474da2e5c6a6604d736121650e2730c6fb0a3','f6f2ea8f45d8a057c9566a33f99474da2e5c6a6604d736121650e2730c6fb0a3',1,'a20201234@pucp.edu.pe'),('20202020','Juan','Perez',20,'Ingeniería de las Telecomunicaciones','ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad','ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad',1,'a20202020@pucp.edu.pe'),('20203739','Diego','Corcuera',20,'Ingeniería de las Telecomunicaciones','2d6ccd34ad7af363159ed4bbe18c0e43c681f606877d9ffc96b62200720d7291','2d6ccd34ad7af363159ed4bbe18c0e43c681f606877d9ffc96b62200720d7291',1,'a20203739@pucp.edu.pe'),('2020824','Jose','Ramos',18,'Ingeniería de las Telecomunicaciones','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5','5994471abb01112afcc18159f6cc74b4f511b99806da59b3caf5a9c173cacfc5',1,'a20200824@pucp.edu.pe');
/*!40000 ALTER TABLE `estudiante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status`
--

DROP TABLE IF EXISTS `status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status` (
  `idStatus` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`idStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status`
--

LOCK TABLES `status` WRITE;
/*!40000 ALTER TABLE `status` DISABLE KEYS */;
INSERT INTO `status` VALUES (1,'Normal'),(2,'Silver'),(3,'Gold'),(4,'Platinum');
/*!40000 ALTER TABLE `status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `viajes`
--

DROP TABLE IF EXISTS `viajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `viajes` (
  `idViaje` int NOT NULL,
  `fechaReserva` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `fechaViaje` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `origenCiudad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `destinoCiudad` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `empresaSeguro` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  `numeroBoletos` int NOT NULL,
  `costoTotal` float NOT NULL,
  `codigoEstudiante` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`idViaje`),
  KEY `fk_Viajes_Estudiante1_idx` (`codigoEstudiante`),
  CONSTRAINT `fk_Viajes_Estudiante1` FOREIGN KEY (`codigoEstudiante`) REFERENCES `estudiante` (`codigoPUCP`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `viajes`
--

LOCK TABLES `viajes` WRITE;
/*!40000 ALTER TABLE `viajes` DISABLE KEYS */;
INSERT INTO `viajes` VALUES (30408234,'12/12/2022','12/12/2023','Lima','Cusco','empresaSeguro',14,700,'20202020'),(83257999,'12/12/2024','12/12/2023','Lima','PRUEBA1','empresaSeguro',3,150,'20203739'),(89012345,'2023-06-23','2023-06-27','Lima','Trujillo','Seguro XYZ',3,250.75,'20203739');
/*!40000 ALTER TABLE `viajes` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-07-01  9:56:53
