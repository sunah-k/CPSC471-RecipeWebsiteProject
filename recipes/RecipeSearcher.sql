-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: recipesearcher
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `consists_of_ing`
--

DROP TABLE IF EXISTS `consists_of_ing`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `consists_of_ing` (
  `ing_name` char(45) NOT NULL,
  `amount` char(45) NOT NULL,
  `recipe_no` int(11) NOT NULL,
  PRIMARY KEY (`ing_name`),
  KEY `i_name_idx` (`ing_name`),
  KEY `r_no_idx` (`recipe_no`),
  CONSTRAINT `i_name` FOREIGN KEY (`ing_name`) REFERENCES `ingredients` (`name`),
  CONSTRAINT `r_no` FOREIGN KEY (`recipe_no`) REFERENCES `recipe` (`num.`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consists_of_ing`
--

LOCK TABLES `consists_of_ing` WRITE;
/*!40000 ALTER TABLE `consists_of_ing` DISABLE KEYS */;
INSERT INTO `consists_of_ing` VALUES ('Baking powder','3 1/2 Tsp',1),('Butter','3 Tbsp',1),('Eggs','1',1),('Flour','1 1/2 Cup',1),('Milk','1 1/4 Cup',1),('Table Salt','1 Tsp',1),('White Sugar','1 Tbsp',1);
/*!40000 ALTER TABLE `consists_of_ing` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorites`
--

DROP TABLE IF EXISTS `favorites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorites` (
  `user_id` char(45) NOT NULL,
  `r_no.` int(11) NOT NULL,
  `f_name` char(45) NOT NULL,
  PRIMARY KEY (`user_id`),
  KEY `r_no_idx` (`r_no.`),
  KEY `u_id_idx` (`user_id`),
  KEY `f_name_fk_idx` (`f_name`),
  CONSTRAINT `food_name_fk` FOREIGN KEY (`f_name`) REFERENCES `food` (`name`),
  CONSTRAINT `r_no_fk2` FOREIGN KEY (`r_no.`) REFERENCES `recipe` (`num.`),
  CONSTRAINT `u_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorites`
--

LOCK TABLES `favorites` WRITE;
/*!40000 ALTER TABLE `favorites` DISABLE KEYS */;
INSERT INTO `favorites` VALUES ('test',1,'Pancakes');
/*!40000 ALTER TABLE `favorites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food`
--

DROP TABLE IF EXISTS `food`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `food` (
  `name` char(45) NOT NULL,
  `r_no` int(11) NOT NULL,
  PRIMARY KEY (`name`),
  KEY `r_no_idx` (`r_no`),
  CONSTRAINT `r_no_fk` FOREIGN KEY (`r_no`) REFERENCES `recipe` (`num.`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food`
--

LOCK TABLES `food` WRITE;
/*!40000 ALTER TABLE `food` DISABLE KEYS */;
INSERT INTO `food` VALUES ('Pancakes',1);
/*!40000 ALTER TABLE `food` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `food_type`
--

DROP TABLE IF EXISTS `food_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `food_type` (
  `f_name` char(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`f_name`),
  KEY `r_name_fk_idx` (`f_name`) /*!80000 INVISIBLE */,
  CONSTRAINT `f_name` FOREIGN KEY (`f_name`) REFERENCES `food` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `food_type`
--

LOCK TABLES `food_type` WRITE;
/*!40000 ALTER TABLE `food_type` DISABLE KEYS */;
INSERT INTO `food_type` VALUES ('Pancakes','Cake');
/*!40000 ALTER TABLE `food_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ingredients`
--

DROP TABLE IF EXISTS `ingredients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `ingredients` (
  `name` char(45) NOT NULL,
  `type` char(45) NOT NULL,
  PRIMARY KEY (`name`),
  UNIQUE KEY `name_UNIQUE` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ingredients`
--

LOCK TABLES `ingredients` WRITE;
/*!40000 ALTER TABLE `ingredients` DISABLE KEYS */;
INSERT INTO `ingredients` VALUES ('Artichokes','Vegetable'),('Asparagus','Vegetable'),('Baking powder','Misc'),('Baking soda','Misc'),('Beet','Vegetable'),('Blueberry','Fruit'),('Broccoli','Vegetable'),('Brown Sugar','Sugar'),('Brussels sprouts','Vegetable'),('Butter','Dairy'),('Cabbage','Vegetable'),('Cane Sugar','Sugar'),('Cantaloupe','Fruit'),('Carrot','Vegetable'),('Cauliflower','Vegetable'),('Celery','Vegetable'),('Chedder Cheese','Dairy'),('Chicken(breast)','Poultry'),('Chicken(drumstick)','Poultry'),('Chicken(whole)','Poultry'),('Chicken(wings)','Poultry'),('Chilli peppers','Vegetable'),('Cucumber','Vegetable'),('Eggplant','Vegetable'),('Eggs','Protein'),('Flour','Grain'),('Garlic','Vegetable'),('Green onion','Vegetable'),('Honey','Sugar'),('Honeydew(Melon)','Fruit'),('Kale','Vegetable'),('Milk','Dairy'),('Onion','Vegetable'),('Peas','Vegetable'),('Potatoes','Vegetable'),('Pumpkin','Vegetable'),('Rhubarb','Vegetable'),('Rice','Grain'),('Rice flour','Grain'),('Sea Salt','Salt'),('Spinach','Vegetable'),('Steak(t-bone)','Beef'),('Strawberry','Fruit'),('Sweet Rice','Grain'),('Sweet Rice flour','Grain'),('Table Salt','Salt'),('Tomatoes','Fruit'),('Turkey(whole)','Poultry'),('Water','Misc'),('Watermelon','Fruit'),('White Sugar','Sugar'),('Yams','Vegetable');
/*!40000 ALTER TABLE `ingredients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recipe`
--

DROP TABLE IF EXISTS `recipe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `recipe` (
  `NUM.` int(11) NOT NULL,
  `user_id` char(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `time_taken` int(11) NOT NULL,
  `directions` text NOT NULL,
  PRIMARY KEY (`NUM.`),
  UNIQUE KEY `NUM._UNIQUE` (`NUM.`),
  KEY `u_id_idx` (`user_id`),
  CONSTRAINT `u_id` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recipe`
--

LOCK TABLES `recipe` WRITE;
/*!40000 ALTER TABLE `recipe` DISABLE KEYS */;
INSERT INTO `recipe` VALUES (1,'test','Pancakes',10,'1)Mix the flour, baking powder, salt and sugar 2)Add in the milk, egg and melted butter, until no chunks are seen 3) Heat a frying pan, melt a little butter to oil said pan and cook the batter until golden on both sides before serving ');
/*!40000 ALTER TABLE `recipe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `review` (
  `r_no` int(11) NOT NULL,
  `u_id` varchar(45) NOT NULL,
  `rating` text NOT NULL,
  UNIQUE KEY `u_id_UNIQUE` (`u_id`),
  KEY `recipe_num_fk_idx` (`r_no`),
  CONSTRAINT `recipe_num_fk` FOREIGN KEY (`r_no`) REFERENCES `recipe` (`num.`),
  CONSTRAINT `user_id_fk2` FOREIGN KEY (`u_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `user` (
  `ID` char(45) NOT NULL,
  `password` char(45) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ID_UNIQUE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('test','test');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-29  0:28:07
