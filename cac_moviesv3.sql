CREATE DATABASE  IF NOT EXISTS `cac-movies3` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `cac-movies3`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: cac-movies3
-- ------------------------------------------------------
-- Server version	8.0.37

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
-- Table structure for table `actors`
--

DROP TABLE IF EXISTS `actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actors` (
  `id_actors` int NOT NULL AUTO_INCREMENT,
  `name_actors` varchar(100) NOT NULL,
  PRIMARY KEY (`id_actors`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actors`
--

LOCK TABLES `actors` WRITE;
/*!40000 ALTER TABLE `actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `director`
--

DROP TABLE IF EXISTS `director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `director` (
  `id_director` int NOT NULL AUTO_INCREMENT,
  `name_director` varchar(50) NOT NULL,
  PRIMARY KEY (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `director`
--

LOCK TABLES `director` WRITE;
/*!40000 ALTER TABLE `director` DISABLE KEYS */;
/*!40000 ALTER TABLE `director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `genres`
--

DROP TABLE IF EXISTS `genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `genres` (
  `id_genre` int NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  PRIMARY KEY (`id_genre`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `genres`
--

LOCK TABLES `genres` WRITE;
/*!40000 ALTER TABLE `genres` DISABLE KEYS */;
INSERT INTO `genres` VALUES (1,'Acción'),(8,'Animación'),(7,'Aventura'),(4,'Ciencia Ficción'),(2,'Comedia'),(12,'Crimen'),(10,'Documental'),(3,'Drama'),(9,'Fantasía'),(11,'Musical'),(5,'Romance'),(13,'Suspenso'),(6,'Terror');
/*!40000 ALTER TABLE `genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies`
--

DROP TABLE IF EXISTS `movies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies` (
  `id_movie` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) NOT NULL,
  `poster_url` varchar(200) DEFAULT NULL,
  `release_year` int DEFAULT '2024',
  `adult` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies`
--

LOCK TABLES `movies` WRITE;
/*!40000 ALTER TABLE `movies` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_actors`
--

DROP TABLE IF EXISTS `movies_actors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_actors` (
  `id_movies_actors` int NOT NULL AUTO_INCREMENT,
  `id_movie` int DEFAULT NULL,
  `id_actors` int DEFAULT NULL,
  PRIMARY KEY (`id_movies_actors`),
  KEY `FK_movies_actors1_idx` (`id_movie`),
  KEY `FK_movie_actors2_idx` (`id_actors`),
  CONSTRAINT `FK_movie_actors2` FOREIGN KEY (`id_actors`) REFERENCES `actors` (`id_actors`),
  CONSTRAINT `FK_movies_actors1` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_actors`
--

LOCK TABLES `movies_actors` WRITE;
/*!40000 ALTER TABLE `movies_actors` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_actors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_director`
--

DROP TABLE IF EXISTS `movies_director`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_director` (
  `id_movies_director` int NOT NULL AUTO_INCREMENT,
  `id_movie` int DEFAULT NULL,
  `id_director` int DEFAULT NULL,
  PRIMARY KEY (`id_movies_director`),
  KEY `FK_movies_director1_idx` (`id_movie`),
  KEY `FK_movies_director2_idx` (`id_director`),
  CONSTRAINT `FK_movies_director1` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`),
  CONSTRAINT `FK_movies_director2` FOREIGN KEY (`id_director`) REFERENCES `director` (`id_director`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_director`
--

LOCK TABLES `movies_director` WRITE;
/*!40000 ALTER TABLE `movies_director` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_director` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `movies_genres`
--

DROP TABLE IF EXISTS `movies_genres`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `movies_genres` (
  `id_movie_genre` int NOT NULL AUTO_INCREMENT,
  `id_movie` int DEFAULT NULL,
  `id_genre` int DEFAULT NULL,
  PRIMARY KEY (`id_movie_genre`),
  KEY `FK1_movie_idx` (`id_movie`),
  KEY `FK2_idx` (`id_genre`),
  CONSTRAINT `FK1_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`) ON DELETE SET NULL,
  CONSTRAINT `FK2` FOREIGN KEY (`id_genre`) REFERENCES `genres` (`id_genre`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `movies_genres`
--

LOCK TABLES `movies_genres` WRITE;
/*!40000 ALTER TABLE `movies_genres` DISABLE KEYS */;
/*!40000 ALTER TABLE `movies_genres` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reviews`
--

DROP TABLE IF EXISTS `reviews`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reviews` (
  `id_review` int NOT NULL AUTO_INCREMENT,
  `id_movie` int DEFAULT NULL,
  `reviewer_name` varchar(100) DEFAULT NULL,
  `comment` text,
  `rating` decimal(4,2) DEFAULT NULL,
  PRIMARY KEY (`id_review`),
  KEY `fk_movie_idx` (`id_movie`),
  CONSTRAINT `fk_movie` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reviews`
--

LOCK TABLES `reviews` WRITE;
/*!40000 ALTER TABLE `reviews` DISABLE KEYS */;
/*!40000 ALTER TABLE `reviews` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sinopsis`
--

DROP TABLE IF EXISTS `sinopsis`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sinopsis` (
  `id_sinopsis` int NOT NULL AUTO_INCREMENT,
  `sinopsis_descriptions` varchar(200) NOT NULL,
  `id_movie` int DEFAULT NULL,
  PRIMARY KEY (`id_sinopsis`),
  KEY `FK_movies_sinopsis_idx` (`id_movie`),
  CONSTRAINT `FK_movies_sinopsis` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sinopsis`
--

LOCK TABLES `sinopsis` WRITE;
/*!40000 ALTER TABLE `sinopsis` DISABLE KEYS */;
/*!40000 ALTER TABLE `sinopsis` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `time` (
  `id_time` int NOT NULL AUTO_INCREMENT,
  `time_description` varchar(50) NOT NULL DEFAULT '90 minutos',
  `id_movie` int DEFAULT NULL,
  PRIMARY KEY (`id_time`),
  KEY `FK_movie_time_idx` (`id_movie`),
  CONSTRAINT `FK_movie_time` FOREIGN KEY (`id_movie`) REFERENCES `movies` (`id_movie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-03 15:23:27
