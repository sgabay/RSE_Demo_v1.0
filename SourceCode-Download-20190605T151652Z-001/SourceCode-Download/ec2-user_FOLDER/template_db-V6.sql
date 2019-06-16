-- MySQL dump 10.13  Distrib 5.5.60, for Linux (x86_64)
--
-- Host: localhost    Database: template_db
-- ------------------------------------------------------
-- Server version	5.5.60

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
-- Table structure for table `catalyst`
--

DROP TABLE IF EXISTS `catalyst`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `catalyst` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `origin_system_ident` int(11) DEFAULT NULL,
  `origin_object_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `origin_object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `origin_fields_json` longtext COLLATE utf8_bin,
  `source_resource_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `version_id` int(11) DEFAULT NULL,
  `status_message` varchar(4096) COLLATE utf8_bin DEFAULT NULL,
  `origin_object_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `action` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `last_updated` datetime DEFAULT NULL,
  `status` int(11) NOT NULL DEFAULT '0',
  `processed` bit(1) DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `catalyst`
--

LOCK TABLES `catalyst` WRITE;
/*!40000 ALTER TABLE `catalyst` DISABLE KEYS */;
/*!40000 ALTER TABLE `catalyst` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_object`
--

DROP TABLE IF EXISTS `config_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_object` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `source_system_ident` int(11) NOT NULL,
  `target_system_ident` int(11) NOT NULL,
  `source_object_type` varchar(100) COLLATE utf8_bin NOT NULL,
  `target_object_type` varchar(100) COLLATE utf8_bin NOT NULL,
  `query` varchar(4096) COLLATE utf8_bin DEFAULT NULL,
  `ordinal` int(11) DEFAULT NULL,
  `last_run` datetime DEFAULT NULL,
  `Name` varchar(1000) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_object`
--

LOCK TABLES `config_object` WRITE;
/*!40000 ALTER TABLE `config_object` DISABLE KEYS */;
INSERT INTO `config_object` VALUES (1,1,2,'portfolioitem/feature','epic','(ObjectID = null) - Disable OR ((Project.Name = \"Consumer Site\") OR (Project.Parent.Name = \"Consumer Site\"))',2,NULL,'AC to Jira Feature (optional: add query)'),(2,1,2,'Iteration','sprint','(Project.Name = \"Consumer Site\")',1,NULL,'AC to Jira Iterations (UPDATE QUERY)'),(3,2,1,'epic','portfolioitem/feature','project=(JIRA PROJECT KEY)',NULL,'2018-05-07 16:43:48','Jira to AC Epic ID, Status (update query)'),(4,1,2,'hierarchicalrequirement','story','(ObjectID = null)',3,NULL,'AC to Jira Stories (UPDATE QUERY, update mapping)'),(5,1,2,'defect','bug','(ObjectID = null)',4,NULL,'AC to Jira Defects (UPDATE QUERY, update mapping)'),(6,2,1,'story','hierarchicalrequirement','project=(JIRA PROJECT KEY)',NULL,'2018-05-07 16:43:50','Jira to AC Stories (update query)'),(7,2,1,'bug','defect','project=(JIRA PROJECT KEY)',NULL,NULL,'Jira to AC bugs (update query)');
/*!40000 ALTER TABLE `config_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_object_field`
--

DROP TABLE IF EXISTS `config_object_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_object_field` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `target_field` varchar(100) COLLATE utf8_bin NOT NULL,
  `source_field` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `transform_fn` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `default_value` varchar(4096) COLLATE utf8_bin DEFAULT NULL,
  `insert` bit(1) DEFAULT NULL,
  `update` bit(1) DEFAULT NULL,
  `config_object_ident` int(11) NOT NULL,
  `required` bit(1) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_object_field`
--

LOCK TABLES `config_object_field` WRITE;
/*!40000 ALTER TABLE `config_object_field` DISABLE KEYS */;
INSERT INTO `config_object_field` VALUES (1,'summary','Name',NULL,NULL,'','',1,'\0'),(2,'description','Description',NULL,NULL,'','',1,'\0'),(3,'Team','Project',NULL,'(VALIDATE)','','',1,'\0'),(4,'project',NULL,NULL,'(JIRA_KEY)','',NULL,1,'\0'),(5,'Epic Name','FormattedID','rallyLabel',NULL,'','',1,'\0'),(6,'ACRank','DragAndDropRank',NULL,NULL,'','',1,'\0'),(7,'status','State',NULL,'To Do (VALIDATE)','','',1,'\0'),(8,'Release','Release',NULL,'R3 (VALIDATE/SET)','','',1,'\0'),(9,'name','Name',NULL,NULL,'','',2,'\0'),(10,'startDate','StartDate',NULL,NULL,'','',2,'\0'),(11,'endDate','EndDate',NULL,NULL,'','',2,'\0'),(12,'boardName',NULL,NULL,'(BOARD NAME)','','',2,'\0'),(13,'c_JiraID','key',NULL,NULL,'','',3,'\0'),(14,'State','status',NULL,NULL,NULL,'',3,'\0'),(15,'summary','Name',NULL,NULL,'','',4,'\0'),(16,'description','Description',NULL,NULL,'','',4,'\0'),(17,'sprint','Iteration',NULL,NULL,'','',4,'\0'),(18,'epic link','PortfolioItem','rallyToJiraObjectLookup',NULL,'','',4,'\0'),(19,'story points','PlanEstimate','convertNullToZero','0','','',4,'\0'),(20,'status','ScheduleState',NULL,'(VALIDATE) To Do','','',4,'\0'),(21,'Team','Project',NULL,'(VALIDATE)','','',4,'\0'),(22,'project',NULL,NULL,'(JIRA KEY)','','',4,'\0'),(23,'ACID','FormattedID',NULL,NULL,'','',4,'\0'),(24,'Release','Release',NULL,'(VALIDATE)','','',4,'\0'),(25,'summary','Name',NULL,NULL,'','',5,'\0'),(26,'description','Description',NULL,NULL,'','',5,'\0'),(27,'project',NULL,NULL,'(JIRA KEY)','',NULL,5,'\0'),(28,'sprint','Iteration',NULL,NULL,'','',5,'\0'),(29,'story points','PlanEstimate','convertNullToZero','0','','',5,'\0'),(30,'status','ScheduleState',NULL,'(VALIDATE)','','',5,'\0'),(31,'ACID','FormattedID',NULL,NULL,'','',5,'\0'),(32,'Team','Project',NULL,'(VALIDATE)','','',5,'\0'),(33,'Name','summary',NULL,NULL,'','',6,'\0'),(34,'Description','description',NULL,NULL,'','',6,'\0'),(35,'Project','Team',NULL,'(VALIDATE)','','',6,''),(36,'PortfolioItem','epic link','jiraToRallyObjectLookup',NULL,'','',6,'\0'),(37,'Iteration','sprint',NULL,NULL,'','',6,'\0'),(38,'ScheduleState','status',NULL,'(VALIDATE)','','',6,'\0'),(39,'PlanEstimate','story points',NULL,NULL,'','',6,'\0'),(40,'c_JiraID','key',NULL,NULL,'','',6,'\0'),(41,'Release','Release',NULL,'(VALIDATE)','','',6,'\0'),(42,'Name','summary',NULL,NULL,'','',7,'\0'),(43,'Description','description',NULL,NULL,'','',7,'\0'),(44,'Project','Team',NULL,'(VALIDATE)','','',7,''),(45,'Iteration','sprint',NULL,NULL,'','',7,'\0'),(46,'ScheduleState','status',NULL,'(VALIDATE)','','',7,'\0'),(47,'PlanEstimate','story points',NULL,NULL,'','',7,'\0'),(48,'c_JiraID','key',NULL,NULL,'','',7,'\0'),(49,'State','status',NULL,'(VALIDATE)','','',7,'\0'),(50,'Release','Release',NULL,NULL,'','',5,'\0'),(51,'ACRank','DragAndDropRank',NULL,NULL,'','',4,'\0'),(52,'ACRank','DragAndDropRank',NULL,NULL,NULL,NULL,5,'\0');
/*!40000 ALTER TABLE `config_object_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `config_object_field_mapping`
--

DROP TABLE IF EXISTS `config_object_field_mapping`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `config_object_field_mapping` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `source_value` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `target_value` varchar(1024) COLLATE utf8_bin DEFAULT NULL,
  `config_object_field_ident` int(11) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `config_object_field_mapping`
--

LOCK TABLES `config_object_field_mapping` WRITE;
/*!40000 ALTER TABLE `config_object_field_mapping` DISABLE KEYS */;
INSERT INTO `config_object_field_mapping` VALUES (1,'Shopping Team','Shopping Team',3),(2,'Payment Team','Payment Team',3),(3,'Fulfillment Team','Fulfillment Team',3),(4,NULL,'To Do',7),(5,'Propose','To Do',7),(6,'Discover','To Do',7),(7,'Develop','In Progress',7),(8,'Validate','In Progress',7),(9,'Internal Release','In Progress',7),(10,'Open Beta','In Progress',7),(11,'GA','In Progress',7),(12,'Done','Done',7),(13,'R1','R1',8),(14,'R2','R2',8),(15,'R3','R3',8),(16,'R4','R4',8),(17,'Done','Validate',14),(18,'In Progress','Develop',14),(19,'Defined','To Do',20),(20,'In-Progress','In Progress',20),(21,'Completed','In Progress',20),(22,'Accepted','Done',20),(23,'R1','R1',24),(24,'R2','R2',24),(25,'R3','R3',24),(26,'R4','R4',24),(27,'Shopping Team','Shopping Team',21),(28,'Payment Team','Payment Team',21),(29,'Fulfillment Team','Fulfillment Team',21),(30,'Consumer Site',NULL,21),(31,'Consumer Site',NULL,3),(32,'Defined','To Do',30),(33,'In-Progress','In Progress',30),(34,'Completed','In Progress',30),(35,'Accepted','Done',30),(36,'Consumer Site',NULL,32),(37,'Shopping Team','Shopping Team',32),(38,'Payment Team','Payment Team',32),(39,'Fulfillment Team','Fulfillment Team',32),(40,'R1','R1',41),(41,'R2','R2',41),(42,'R3','R3',41),(43,'R4','R4',41),(44,'None','Consumer Site',35),(45,'Shopping Team','Shopping Team',35),(46,'Payment Team','Payment Team',35),(47,'Fulfillment Team','Fulfillment Team',35),(48,'To Do','Defined',38),(49,'In Progress','In-Progress',38),(50,'Done','Accepted',38),(51,'None','Consumer Site',44),(52,'Shopping Team','Shopping Team',44),(53,'Payment Team','Payment Team',44),(54,'Fulfillment Team','Fulfillment Team',44),(55,'To Do','Defined',46),(56,'In Progress','In-Progress',46),(57,'Done','Accepted',46),(58,'To Do','Submitted',49),(59,'In Progress','Open',49),(60,'Done','Closed',49),(61,'R1','R1',50),(62,'R2','R2',50),(63,'R3','R3',50),(64,'R4','R4',50);
/*!40000 ALTER TABLE `config_object_field_mapping` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jira_action`
--

DROP TABLE IF EXISTS `jira_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jira_action` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `object_ident` int(11) DEFAULT NULL,
  `object_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `payload` longtext COLLATE utf8_bin,
  `status` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status_message` longtext COLLATE utf8_bin,
  `object_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `system_ident` int(11) DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jira_action`
--

LOCK TABLES `jira_action` WRITE;
/*!40000 ALTER TABLE `jira_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `jira_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jira_link`
--

DROP TABLE IF EXISTS `jira_link`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jira_link` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `outwardIssue` int(11) DEFAULT NULL,
  `inwardIssue` int(11) DEFAULT NULL,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SourceDirection` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `system_id` int(11) DEFAULT NULL,
  `objectType` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jira_link`
--

LOCK TABLES `jira_link` WRITE;
/*!40000 ALTER TABLE `jira_link` DISABLE KEYS */;
/*!40000 ALTER TABLE `jira_link` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jira_object`
--

DROP TABLE IF EXISTS `jira_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jira_object` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `system_ident` int(11) NOT NULL,
  `object_type` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `rally_object_ident` int(11) DEFAULT NULL,
  `object_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `primary_object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `primary_object_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jira_object`
--

LOCK TABLES `jira_object` WRITE;
/*!40000 ALTER TABLE `jira_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `jira_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jira_object_field`
--

DROP TABLE IF EXISTS `jira_object_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jira_object_field` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `parent_object_ident` int(11) NOT NULL,
  `property` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin,
  `last_updated` datetime DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jira_object_field`
--

LOCK TABLES `jira_object_field` WRITE;
/*!40000 ALTER TABLE `jira_object_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `jira_object_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rally_action`
--

DROP TABLE IF EXISTS `rally_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rally_action` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `action` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `object_ident` int(11) DEFAULT NULL,
  `object_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `payload` longtext COLLATE utf8_bin,
  `status` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `status_message` longtext COLLATE utf8_bin,
  `object_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `system_ident` int(11) DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rally_action`
--

LOCK TABLES `rally_action` WRITE;
/*!40000 ALTER TABLE `rally_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `rally_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rally_dependency`
--

DROP TABLE IF EXISTS `rally_dependency`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rally_dependency` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `RallyType` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Predecessor` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `Successor` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `SourceDirection` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `system_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rally_dependency`
--

LOCK TABLES `rally_dependency` WRITE;
/*!40000 ALTER TABLE `rally_dependency` DISABLE KEYS */;
/*!40000 ALTER TABLE `rally_dependency` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rally_object`
--

DROP TABLE IF EXISTS `rally_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rally_object` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `system_ident` int(11) NOT NULL,
  `object_type` varchar(100) COLLATE utf8_bin NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `jira_object_ident` int(11) DEFAULT NULL,
  `object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `object_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `primary_object_id` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `primary_object_type` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rally_object`
--

LOCK TABLES `rally_object` WRITE;
/*!40000 ALTER TABLE `rally_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `rally_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rally_object_field`
--

DROP TABLE IF EXISTS `rally_object_field`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rally_object_field` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` longtext COLLATE utf8_bin,
  `parent_object_ident` int(11) NOT NULL,
  `last_updated` datetime DEFAULT NULL,
  `reference_ident` int(11) DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rally_object_field`
--

LOCK TABLES `rally_object_field` WRITE;
/*!40000 ALTER TABLE `rally_object_field` DISABLE KEYS */;
/*!40000 ALTER TABLE `rally_object_field` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system`
--

DROP TABLE IF EXISTS `system`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin NOT NULL,
  `system_type_ident` int(11) NOT NULL,
  `last_validated` datetime DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system`
--

LOCK TABLES `system` WRITE;
/*!40000 ALTER TABLE `system` DISABLE KEYS */;
INSERT INTO `system` VALUES (1,'Agile Central @ Prod (UPDATE)',2,NULL),(2,'Jira Demo Project (UPDATE)',1,NULL);
/*!40000 ALTER TABLE `system` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_property`
--

DROP TABLE IF EXISTS `system_property`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_property` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `property` varchar(100) COLLATE utf8_bin NOT NULL,
  `value` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `system_ident` int(11) NOT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_property`
--

LOCK TABLES `system_property` WRITE;
/*!40000 ALTER TABLE `system_property` DISABLE KEYS */;
INSERT INTO `system_property` VALUES (1,'Url','https://rally1.rallydev.com',1),(6,'IntegrationUser','lac@acme.com',1),(8,'projectScopeDown','true',1),(10,'ApiKey','_HB1lFODDRu643ka5MVO0Bnps3xikWEekkxwTIyae4Po',1),(16,'IntegrationPassword','lac@acme.com',1),(17,'Url','http://52.24.60.130:8090',2),(24,'restURL','https://rally1.rallydev.com/slm/webservice/v2.0/',1),(25,'WorkspaceName','Name (ie. email-YYYY-MMM-DD)',1),(26,'ProjectName','ART (i.e. Consumer Site)',1),(27,'IntegrationPassword','lac@acme.com',2),(28,'IntegrationUser','lac@acme.com',2),(31,'ProjectKey','KEY(REQUIRED)',2),(32,'ProjectName','PROJECT(REQUIRED)',2),(33,'BoardName','NAME board(REQUIRED)',2),(48,'IntegrationPassword','lac@acme.com',5),(49,'IntegrationUser','lac@acme.com',5),(51,'Url','http://52.24.60.130:8090',5);
/*!40000 ALTER TABLE `system_property` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `system_type`
--

DROP TABLE IF EXISTS `system_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `system_type` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `source_resource_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `target_resource_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `linked_object_field_name` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `library_key` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_type`
--

LOCK TABLES `system_type` WRITE;
/*!40000 ALTER TABLE `system_type` DISABLE KEYS */;
INSERT INTO `system_type` VALUES (1,'Jira','fromJira','toJira','jira_object_ident','jira'),(2,'Agile Central','fromRally','toRally','rally_object_ident','rally');
/*!40000 ALTER TABLE `system_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_map`
--

DROP TABLE IF EXISTS `user_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_map` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `rally_user` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `jira_user` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_map`
--

LOCK TABLES `user_map` WRITE;
/*!40000 ALTER TABLE `user_map` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_map` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `webhook`
--

DROP TABLE IF EXISTS `webhook`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `webhook` (
  `ident` int(11) NOT NULL AUTO_INCREMENT,
  `payload` longtext COLLATE utf8_bin,
  `received_date` datetime NOT NULL,
  `status_message` varchar(2048) COLLATE utf8_bin DEFAULT NULL,
  `caller` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`ident`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `webhook`
--

LOCK TABLES `webhook` WRITE;
/*!40000 ALTER TABLE `webhook` DISABLE KEYS */;
/*!40000 ALTER TABLE `webhook` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-16  7:19:48
