-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: board
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `spring_board`
--

DROP TABLE IF EXISTS `spring_board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spring_board` (
  `num` int NOT NULL AUTO_INCREMENT,
  `title` char(200) DEFAULT NULL,
  `content` text,
  `id` char(100) DEFAULT NULL,
  `hits` int DEFAULT '0',
  `dt` datetime DEFAULT CURRENT_TIMESTAMP,
  `category` char(50) DEFAULT NULL,
  `LIKE_COUNT` int DEFAULT '0',
  PRIMARY KEY (`num`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spring_board`
--

LOCK TABLES `spring_board` WRITE;
/*!40000 ALTER TABLE `spring_board` DISABLE KEYS */;
INSERT INTO `spring_board` VALUES (4,'테스트1','테스트1',NULL,29,'2023-04-20 14:09:43','free_2',1),(5,'테스트2','테스트2',NULL,15,'2023-04-20 14:09:52','free_2',2),(6,'테스트3','테스트3',NULL,20,'2023-04-20 14:09:58','free_2',2),(7,'sdfsf','asf',NULL,0,'2023-04-26 12:10:05','free,1',0),(8,'fsdfsdf','dfsfsdf',NULL,0,'2023-04-26 12:12:21','free,1',0),(9,'zzzz','sdfsdf',NULL,0,'2023-04-26 12:13:02','자유로운 이야기,1',0),(10,'zzzz','sdfsdfsd',NULL,0,'2023-04-26 12:13:49','자유로운 이야기,1',0),(11,'zzzz','sdfsdfsd',NULL,0,'2023-04-26 12:15:44','자유로운 이야기,1',0),(12,'fsfs','fsdfdsf',NULL,0,'2023-04-26 12:21:13',NULL,0),(13,'fsdfdsf','sdfsdfsdf',NULL,0,'2023-04-26 12:22:07',NULL,0),(14,'fsdf','sdfsdf',NULL,1,'2023-04-26 12:22:35','null',0),(15,'sdfsd','fsdfsdf',NULL,1,'2023-04-26 12:23:52','free_1',0),(16,'fsf','sfsf',NULL,0,'2023-04-26 12:24:32','free_1',0),(17,'sf','sfsfd',NULL,0,'2023-04-26 12:33:54','free_1',0),(18,'fsf','sdfsdfs',NULL,144,'2023-04-26 12:36:26','board_1',0),(19,'fsf','sfsdfsf',NULL,0,'2023-04-26 12:36:29','board_1',0),(20,'sfs','dfsdfs',NULL,0,'2023-04-26 12:36:36','free_2',0),(21,'fsdf','sdfsf',NULL,0,'2023-04-26 12:36:43','board_3',0);
/*!40000 ALTER TABLE `spring_board` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-04-26 16:12:27
