-- MySQL dump 10.13  Distrib 5.6.21, for Win64 (x86_64)
--
-- Host: localhost    Database: vms_development
-- ------------------------------------------------------
-- Server version	5.6.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `roles` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lead` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `training` int(11) DEFAULT '0',
  `shadowing` int(11) DEFAULT '3',
  `desc` text COLLATE utf8_unicode_ci,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES (1,'Cashier','CashierLead@theCSPC.org',0,3,'Take the money. Be nice. That is all. ','2014-12-03 08:56:48','2014-12-03 08:56:48'),(2,'Monitor','MonitorLead@theCSPC.org',0,3,'Watch people. Tell an EC. Still get yelled at.','2014-12-12 07:13:33','2014-12-12 07:13:33'),(3,'Event Coordinator','VC@theCSPC.org',0,9,'Shadow: Cashier, Ambassador and Monitor. Never get it \"right.\" Have everyone hate you then hate you again for not showing up early to stay late for a party you maybe don\'t care about.','2014-12-12 07:18:21','2014-12-12 07:18:21'),(4,'Ambassador','AmbassadorLead@theCSPC.org',0,3,'Be nice to people. Show them around. Don\'t hit on them or try to make dates. ','2014-12-12 07:21:56','2014-12-12 07:21:56'),(5,'Food Prep','VC@theCSPC.org',1,NULL,'Prep food. Don\'t make attendees sick. ','2014-12-12 07:22:54','2014-12-12 07:22:54'),(6,'Library-Host','VC@theCSPC.org',0,NULL,'I think... I mean, I don\'t really know. ','2014-12-12 07:24:37','2014-12-12 07:24:37'),(7,'Librarian','Librarian@theCSPC.org',0,NULL,'Check out materials. ','2014-12-12 07:25:30','2014-12-12 07:25:30'),(8,'Setup','VC@theCSPC.org',1,NULL,'Move stuff into place. Then be told it needs to go back over there. Nope, it should have been where it just was. Fuck it, you move it.','2014-12-12 07:26:15','2014-12-12 07:26:15'),(9,'Staff','VC@theCSPC.org',1,NULL,'Seriously... I have not a clue but you get hours.','2014-12-12 07:26:44','2014-12-12 07:26:44'),(10,'Strike','VC@theCSPC.org',1,NULL,'Hahahaahah.... I hope you like sleep dep, dipshit.','2014-12-12 07:27:57','2014-12-12 07:27:57'),(11,'Host','ChampionLead@theCSPC.org',1,NULL,'Set the tone for the party. ','2014-12-12 07:28:44','2014-12-12 07:28:44'),(12,'Passport Guide','PassportLead@theCSPC.org',1,NULL,'Go to Passport meeting then go to another party and passport things.','2014-12-12 07:30:02','2014-12-12 07:30:02'),(13,'Non-Event: Duster','SiteCoordinator@theCSPC.org',1,NULL,'Go in once a week and clean everything.','2014-12-12 07:31:40','2014-12-12 07:31:40'),(14,'Stocking','SiteCoordinator@theCSPC.org',1,NULL,'Stock soda, candy & peanut dispensers, etc.','2014-12-12 07:33:10','2014-12-12 07:33:10'),(15,'Office Minion','SiteCoordinator@theCSPC.org',1,NULL,'Do office things, in the office.','2014-12-12 07:33:47','2014-12-12 07:33:47'),(16,'Laundry Team','SiteCoordinator@theCSPC.org',1,NULL,'Take laundry from the bins and run it through the washing machine and dryer. Wear gloves. ','2014-12-12 07:34:30','2014-12-12 07:34:30'),(17,'MONITOR-TRANSITION STAFF','MonitorLead@theCSPC.org',0,3,'Probably a monitor who strikes the party, but we\'re not sure.','2014-12-12 07:35:39','2014-12-12 07:35:39'),(18,'Intro-Teacher','introlead@thecspc.org',0,NULL,'Tell people the rules of CSPC. Try to not talk past 6:30 on Tuesday evening.','2014-12-12 07:37:10','2014-12-12 07:37:10'),(19,'Intro-Cashier','introlead@thecspc.org',0,NULL,'Deal with the paperwork for newbies.','2014-12-12 07:38:16','2014-12-12 07:38:16'),(20,'Intro-Ambassador','introlead@thecspc.org',0,NULL,'Ambassador the newbies.','2014-12-12 07:38:40','2014-12-12 07:38:40'),(21,'Greeter','AmbassadorLead@theCSPC.org',1,NULL,'Sort of like Ambassador but probably closer to the door. ','2014-12-12 07:41:08','2014-12-12 07:41:08'),(22,'Non-Event:Parking Lot','SiteCoordinator@theCSPC.org',1,NULL,'Keep it cleaned up, as much as one can for a property that has about a dozen people telling you what to do. ','2014-12-12 07:42:16','2014-12-12 07:42:16'),(23,'Non-Event: Costo Prep','SiteCoordinator@theCSPC.org',0,NULL,'Go to Costco','2014-12-12 07:43:40','2014-12-12 07:43:40'),(24,'Non-Event: Costco Intake','SiteCoordinator@theCSPC.org',0,NULL,'put away groceries and sundries from Costco.','2014-12-12 07:44:26','2014-12-12 07:44:26'),(25,'Kitchen Assistant','SiteCoordinator@theCSPC.org',1,NULL,'Assist with food prep','2014-12-12 07:45:21','2014-12-12 07:45:21'),(26,'Kitchen Cleanup','SiteCoordinator@theCSPC.org',1,NULL,'throw away the ranch dip that no one ate. wash the dishes and put them away.','2014-12-12 07:46:26','2014-12-12 07:46:26'),(27,'DJ','VC@theCSPC.org',1,NULL,'Plug in your iPod, load Pandora, go.','2014-12-12 07:47:26','2014-12-12 07:47:26'),(28,'Door Staff','Grind@theCSPC.org',1,NULL,'Stand by the door','2014-12-12 07:48:54','2014-12-12 07:48:54'),(29,'Grind Staff','Grind@theCSPC.org',1,NULL,'Who even knows','2014-12-12 07:49:20','2014-12-12 07:49:20'),(30,'Transition','VC@theCSPC.org',1,NULL,'Basically you\'re strike. ','2014-12-12 07:52:18','2014-12-12 07:52:18'),(31,'Workshop-Cashier','education@theFSPC.org',1,NULL,'Most people pay in advance.','2014-12-12 07:53:20','2014-12-12 07:53:20'),(32,'Workshop-EC','education@theFSPC.org',0,NULL,'check the checklists, hand out surveys afterward','2014-12-12 07:54:11','2014-12-12 07:54:11'),(33,'Chef','VC@theCSPC.org',0,NULL,'cook your ass off','2014-12-12 07:55:04','2014-12-12 07:55:04'),(34,'Faciitator','VC@theCSPC.org',0,NULL,'combo of ambassador and monitor','2014-12-12 07:56:50','2014-12-12 07:56:50'),(35,'Service Facilitator','VC@theCSPC.org',0,NULL,'keep the servers in line','2014-12-12 07:57:49','2014-12-12 07:57:49');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20141203073123');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-03 23:05:28
