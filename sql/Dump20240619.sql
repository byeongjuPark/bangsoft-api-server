CREATE DATABASE  IF NOT EXISTS `bangsoft` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `bangsoft`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: bangsoft
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
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `board_number` int NOT NULL AUTO_INCREMENT COMMENT '게시물 번호',
  `title` text NOT NULL COMMENT '게시물 제목',
  `content` text NOT NULL COMMENT '게시물 내용',
  `write_datetime` datetime NOT NULL COMMENT '게시물 작성 날짜',
  `favorite_count` int NOT NULL DEFAULT '0' COMMENT '게시물 좋아요 수',
  `comment_count` int NOT NULL DEFAULT '0' COMMENT '게시물 댓글 수 ',
  `view_count` int NOT NULL DEFAULT '0' COMMENT '게시물 조회 수 ',
  `writer_email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  PRIMARY KEY (`board_number`),
  KEY `FK_user_TO_board` (`writer_email`),
  CONSTRAINT `FK_user_TO_board` FOREIGN KEY (`writer_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시물 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'1','1','2024-01-01 00:00:00',3,2,0,'test@test.com'),(2,'수정된 제목입니다.','수정된 내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(3,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(4,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(5,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(6,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(7,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(8,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(9,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(10,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(11,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(12,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(13,'제목입니다.','내용입니다.','2024-01-01 20:20:00',0,0,0,'test1@test.com'),(14,'제목입니다.','내용입니다.','2024-05-01 02:18:18',0,0,0,'pbj2577@naver.com'),(15,'제목입니다.','내용입니다.','2024-05-01 02:18:33',0,0,0,'pbj2577@naver.com'),(16,'제목입니다.','내용입니다.','2024-05-01 02:19:04',0,0,0,'pbj2577@naver.com'),(17,'제목입니다.','내용입니다.','2024-05-01 02:19:17',0,0,0,'pbj2577@naver.com'),(18,'제목입니다.','내용입니다.','2024-05-01 02:21:23',0,0,0,'pbj2577@naver.com'),(19,'제목입니다.','내용입니다.','2024-05-01 02:21:36',0,0,0,'pbj2577@naver.com');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `board_list_view`
--

DROP TABLE IF EXISTS `board_list_view`;
/*!50001 DROP VIEW IF EXISTS `board_list_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `board_list_view` AS SELECT 
 1 AS `board_number`,
 1 AS `title`,
 1 AS `content`,
 1 AS `title_image`,
 1 AS `view_count`,
 1 AS `favorite_count`,
 1 AS `comment_count`,
 1 AS `write_datetime`,
 1 AS `writer_email`,
 1 AS `writer_nickname`,
 1 AS `writer_profile_image`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `comment`
--

DROP TABLE IF EXISTS `comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comment` (
  `comment_number` int NOT NULL AUTO_INCREMENT COMMENT '댓글 번호',
  `content` text NOT NULL COMMENT '댓글 내용',
  `write_datetime` datetime NOT NULL COMMENT '작성 날짜 및 시간',
  `user_email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  `board_number` int NOT NULL COMMENT '게시물 번호',
  PRIMARY KEY (`comment_number`),
  KEY `FK_user_TO_comment` (`user_email`),
  KEY `FK_board_TO_comment` (`board_number`),
  CONSTRAINT `FK_board_TO_comment` FOREIGN KEY (`board_number`) REFERENCES `board` (`board_number`),
  CONSTRAINT `FK_user_TO_comment` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='댓글 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comment`
--

LOCK TABLES `comment` WRITE;
/*!40000 ALTER TABLE `comment` DISABLE KEYS */;
INSERT INTO `comment` VALUES (1,'반갑습니다.','2023-01-01 20:30:00','test1@test.com',2);
/*!40000 ALTER TABLE `comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorite`
--

DROP TABLE IF EXISTS `favorite`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite` (
  `user_email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  `board_number` int NOT NULL COMMENT '게시물 번호',
  PRIMARY KEY (`user_email`,`board_number`),
  KEY `FK_board_TO_favorite` (`board_number`),
  CONSTRAINT `FK_board_TO_favorite` FOREIGN KEY (`board_number`) REFERENCES `board` (`board_number`),
  CONSTRAINT `FK_user_TO_favorite` FOREIGN KEY (`user_email`) REFERENCES `user` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='좋아요 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite`
--

LOCK TABLES `favorite` WRITE;
/*!40000 ALTER TABLE `favorite` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `sequence` int NOT NULL AUTO_INCREMENT,
  `board_number` int NOT NULL COMMENT '게시물 번호',
  `image` varchar(200) NOT NULL,
  PRIMARY KEY (`sequence`),
  KEY `FK_board_TO_image` (`board_number`),
  CONSTRAINT `FK_board_TO_image` FOREIGN KEY (`board_number`) REFERENCES `board` (`board_number`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='게시물 이미지 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (1,1,'2341esa'),(2,2,'url'),(3,2,'url'),(4,2,'url'),(5,2,'url'),(6,18,'http://localhost:4000/file/4e2c0dbe-d5f0-48d4-8d86-f09560d255c3.PNG'),(7,18,'http://localhost:4000/file/4e2c0dbe-d5f0-48d4-8d86-f09560d255c3.PNG'),(8,19,'http://localhost:4000/file/4e2c0dbe-d5f0-48d4-8d86-f09560d255c3.PNG'),(9,19,'http://localhost:4000/file/4e2c0dbe-d5f0-48d4-8d86-f09560d255c3.PNG');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `search_log`
--

DROP TABLE IF EXISTS `search_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `search_log` (
  `sequence` int NOT NULL AUTO_INCREMENT COMMENT '시퀀스',
  `search_word` text NOT NULL COMMENT '검색어',
  `relation_word` text COMMENT '관련 검색어',
  `relation` tinyint NOT NULL COMMENT '관련 검색어 여부',
  PRIMARY KEY (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='검색 기록 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `search_log`
--

LOCK TABLES `search_log` WRITE;
/*!40000 ALTER TABLE `search_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `search_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `email` varchar(50) NOT NULL COMMENT '사용자 이메일',
  `password` varchar(100) NOT NULL COMMENT '사용자 비밀번호',
  `nickname` varchar(20) NOT NULL COMMENT '사용자 닉네임',
  `tel_number` varchar(15) NOT NULL COMMENT '사용자 휴대전화 번호',
  `address` text NOT NULL COMMENT '사용자 주소',
  `address_detail` text COMMENT '사용자 상세 주소',
  `profile_image` text COMMENT '사용자 프로필 사진',
  `agreed_personal` tinyint(1) NOT NULL COMMENT '개인정보 동의 여부',
  `joined_date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastest_login_date` datetime DEFAULT NULL,
  PRIMARY KEY (`email`),
  UNIQUE KEY `nickname` (`nickname`),
  UNIQUE KEY `tel_number` (`tel_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='사용자 테이블';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('guest@bangsoft.com','$2a$10$WOtLEwn1pimfWlU0kUL54.vtcBfeW7bc63LadTQFjbsCTmkX27BZy','게스트','01011112222','서울특별시','골목길',NULL,1,'2024-03-14 18:16:16',NULL),('guest1@bangsoft.com','$2a$10$dlce5SVDfMmxDZsgf3e/a.bO8Ahh3e1WNMstR0nwy9USIDCLDx6D6','게스트2','01011112223','서울특별시','골목길',NULL,1,'2024-03-14 18:16:58',NULL),('guest2@bangsoft.com','$2a$10$yytw6M5Cc/yyKkkZySNr0uwKgmray6N/NybYYa6WRwZ802TgUsRj2','게스트4','01011112224','서울특별시','골목길',NULL,1,'2024-03-14 18:48:00',NULL),('pbj2577@naver.com','$2a$10$hcZ.dXS3oYO7c/65/iJ9l.aSvmRD5kR/mSHbTB3oNTQIj2rx4flka','게스트튼','01041966235','전남 순천시 서면 고룡길 19-9','푠가',NULL,1,'2024-04-30 01:19:48','2024-04-30 01:19:48'),('pdsjakd@nave.rcom','$2a$10$igpAbfsy9ZkKwvT6gdhK3.pp9RqW4rfxODQAkV7F8G3HoZa1BDzbW','박두산','01010202031','전남 고흥군 고흥읍 두원로 1','그러치 112',NULL,1,'2024-04-30 01:14:43','2024-04-30 01:14:43'),('test@test.com','$2a$10$yytw6M5Cc/yyKkkZySNr0uwKgmray6N/NybYYa6WRwZ802TgUsRj2','테스터','01041231234','서울','골목길',NULL,0,'2024-03-14 18:16:16',NULL),('test1@test.com','$2a$10$yytw6M5Cc/yyKkkZySNr0uwKgmray6N/NybYYa6WRwZ802TgUsRj2','수정된닉네임','01012341234','부산광역시 부산진구','롯데백화점','url2',0,'2024-03-14 18:16:16',NULL),('testapi@bangsoft.com','$2a$10$iH0SmL9wAbaAjHwWo59/POL8Xco.CHP5XeH89JVzofbdMbI0ayLHC','게스트62','01011112233','서울특별시','골목길',NULL,1,'2024-03-18 11:19:27','2024-03-18 11:19:27');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `board_list_view`
--

/*!50001 DROP VIEW IF EXISTS `board_list_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_unicode_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `board_list_view` AS select `b`.`board_number` AS `board_number`,`b`.`title` AS `title`,`b`.`content` AS `content`,`i`.`image` AS `title_image`,`b`.`view_count` AS `view_count`,`b`.`favorite_count` AS `favorite_count`,`b`.`comment_count` AS `comment_count`,`b`.`write_datetime` AS `write_datetime`,`b`.`writer_email` AS `writer_email`,`u`.`nickname` AS `writer_nickname`,`u`.`profile_image` AS `writer_profile_image` from ((`board` `b` join `user` `u` on((`b`.`writer_email` = `u`.`email`))) left join (select `image`.`board_number` AS `board_number`,any_value(`image`.`image`) AS `image` from `image` group by `image`.`board_number`) `i` on((`b`.`board_number` = `i`.`board_number`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-06-19 16:09:06
