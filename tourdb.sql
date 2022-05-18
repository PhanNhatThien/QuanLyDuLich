-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: localhost    Database: tourdb
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
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add category',6,'add_category'),(22,'Can change category',6,'change_category'),(23,'Can delete category',6,'delete_category'),(24,'Can view category',6,'view_category'),(25,'Can add user',7,'add_user'),(26,'Can change user',7,'change_user'),(27,'Can delete user',7,'delete_user'),(28,'Can view user',7,'view_user'),(29,'Can add dia danh',6,'add_diadanh'),(30,'Can change dia danh',6,'change_diadanh'),(31,'Can delete dia danh',6,'delete_diadanh'),(32,'Can view dia danh',6,'view_diadanh'),(33,'Can add tour',8,'add_tour'),(34,'Can change tour',8,'change_tour'),(35,'Can delete tour',8,'delete_tour'),(36,'Can view tour',8,'view_tour'),(37,'Can add tin tuc',9,'add_tintuc'),(38,'Can change tin tuc',9,'change_tintuc'),(39,'Can delete tin tuc',9,'delete_tintuc'),(40,'Can view tin tuc',9,'view_tintuc'),(41,'Can add tag',10,'add_tag'),(42,'Can change tag',10,'change_tag'),(43,'Can delete tag',10,'delete_tag'),(44,'Can view tag',10,'view_tag'),(45,'Can add rating',11,'add_rating'),(46,'Can change rating',11,'change_rating'),(47,'Can delete rating',11,'delete_rating'),(48,'Can view rating',11,'view_rating'),(49,'Can add action',12,'add_action'),(50,'Can change action',12,'change_action'),(51,'Can delete action',12,'delete_action'),(52,'Can view action',12,'view_action'),(53,'Can add comment',13,'add_comment'),(54,'Can change comment',13,'change_comment'),(55,'Can delete comment',13,'delete_comment'),(56,'Can view comment',13,'view_comment'),(57,'Can add application',14,'add_application'),(58,'Can change application',14,'change_application'),(59,'Can delete application',14,'delete_application'),(60,'Can view application',14,'view_application'),(61,'Can add access token',15,'add_accesstoken'),(62,'Can change access token',15,'change_accesstoken'),(63,'Can delete access token',15,'delete_accesstoken'),(64,'Can view access token',15,'view_accesstoken'),(65,'Can add grant',16,'add_grant'),(66,'Can change grant',16,'change_grant'),(67,'Can delete grant',16,'delete_grant'),(68,'Can view grant',16,'view_grant'),(69,'Can add refresh token',17,'add_refreshtoken'),(70,'Can change refresh token',17,'change_refreshtoken'),(71,'Can delete refresh token',17,'delete_refreshtoken'),(72,'Can view refresh token',17,'view_refreshtoken'),(73,'Can add id token',18,'add_idtoken'),(74,'Can change id token',18,'change_idtoken'),(75,'Can delete id token',18,'delete_idtoken'),(76,'Can view id token',18,'view_idtoken'),(77,'Can add lession view',19,'add_lessionview'),(78,'Can change lession view',19,'change_lessionview'),(79,'Can delete lession view',19,'delete_lessionview'),(80,'Can view lession view',19,'view_lessionview'),(81,'Can add tin tuc view',20,'add_tintucview'),(82,'Can change tin tuc view',20,'change_tintucview'),(83,'Can delete tin tuc view',20,'delete_tintucview'),(84,'Can view tin tuc view',20,'view_tintucview');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext COLLATE utf8mb4_unicode_520_ci,
  `object_repr` varchar(200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_tour_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2022-05-05 03:28:23.397904','1','cho ben thanh',1,'[{\"added\": {}}]',8,1),(2,'2022-05-05 03:39:47.649994','1','Buon Don',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Image\", \"Diadanh\"]}}]',8,1),(3,'2022-05-05 03:41:06.095621','1','cho ben thanh',2,'[{\"changed\": {\"fields\": [\"Subject\", \"Image\", \"Diadanh\"]}}]',8,1),(4,'2022-05-05 03:42:23.722510','2','Buon Don',1,'[{\"added\": {}}]',8,1),(5,'2022-05-18 16:55:34.271621','3','Thethe',1,'[{\"added\": {}}]',7,1),(6,'2022-05-18 17:07:30.189906','2','chi tiet 2',1,'[{\"added\": {}}]',9,1),(7,'2022-05-18 17:07:55.459474','2','chi tiet 2',2,'[{\"changed\": {\"fields\": [\"Tour\"]}}]',9,1),(8,'2022-05-18 17:09:50.459269','5','good',1,'[{\"added\": {}}]',13,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `model` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(15,'oauth2_provider','accesstoken'),(14,'oauth2_provider','application'),(16,'oauth2_provider','grant'),(18,'oauth2_provider','idtoken'),(17,'oauth2_provider','refreshtoken'),(5,'sessions','session'),(12,'tour','action'),(13,'tour','comment'),(6,'tour','diadanh'),(19,'tour','lessionview'),(11,'tour','rating'),(10,'tour','tag'),(9,'tour','tintuc'),(20,'tour','tintucview'),(8,'tour','tour'),(7,'tour','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-05-03 16:31:40.106813'),(2,'contenttypes','0002_remove_content_type_name','2022-05-03 16:31:41.325589'),(3,'auth','0001_initial','2022-05-03 16:31:43.310361'),(4,'auth','0002_alter_permission_name_max_length','2022-05-03 16:31:44.122852'),(5,'auth','0003_alter_user_email_max_length','2022-05-03 16:31:44.185301'),(6,'auth','0004_alter_user_username_opts','2022-05-03 16:31:44.232178'),(7,'auth','0005_alter_user_last_login_null','2022-05-03 16:31:44.294679'),(8,'auth','0006_require_contenttypes_0002','2022-05-03 16:31:44.325923'),(9,'auth','0007_alter_validators_add_error_messages','2022-05-03 16:31:44.372810'),(10,'auth','0008_alter_user_username_max_length','2022-05-03 16:31:44.404049'),(11,'auth','0009_alter_user_last_name_max_length','2022-05-03 16:31:44.450972'),(12,'auth','0010_alter_group_name_max_length','2022-05-03 16:31:44.607218'),(13,'auth','0011_update_proxy_permissions','2022-05-03 16:31:44.654910'),(14,'auth','0012_alter_user_first_name_max_length','2022-05-03 16:31:44.733086'),(15,'tour','0001_initial','2022-05-03 16:31:48.186837'),(16,'admin','0001_initial','2022-05-03 16:31:49.673919'),(17,'admin','0002_logentry_remove_auto_add','2022-05-03 16:31:49.767677'),(18,'admin','0003_logentry_add_action_flag_choices','2022-05-03 16:31:49.845794'),(19,'sessions','0001_initial','2022-05-03 16:31:51.314565'),(20,'tour','0002_rename_category_diadanh','2022-05-03 16:35:30.145334'),(21,'tour','0003_tour','2022-05-04 16:39:12.977761'),(22,'tour','0004_tintuc','2022-05-05 04:48:41.741878'),(23,'tour','0005_alter_tintuc_tour','2022-05-05 07:24:29.102156'),(24,'tour','0006_alter_tintuc_tour','2022-05-05 07:32:37.810884'),(25,'tour','0007_tag_tintuc_tags','2022-05-05 15:31:16.532747'),(26,'tour','0008_rating_action','2022-05-06 07:58:03.635710'),(27,'tour','0009_comment','2022-05-06 09:44:39.500357'),(28,'oauth2_provider','0001_initial','2022-05-07 16:27:46.238153'),(29,'oauth2_provider','0002_auto_20190406_1805','2022-05-07 16:27:46.597294'),(30,'oauth2_provider','0003_auto_20201211_1314','2022-05-07 16:27:47.259336'),(31,'oauth2_provider','0004_auto_20200902_2022','2022-05-07 16:27:52.057719'),(32,'oauth2_provider','0005_auto_20211222_2352','2022-05-07 16:27:52.287317'),(33,'tour','0010_lessionview','2022-05-11 05:12:08.894640'),(34,'tour','0010_tintucview','2022-05-11 05:15:13.582255'),(35,'tour','0011_alter_tintucview_tintuc','2022-05-11 05:22:42.739960'),(36,'tour','0012_alter_comment_tintuc','2022-05-18 01:58:21.898042');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `session_data` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('vej557rbmh7xowh5ufzcfb34v34myws4','.eJxVjMsOwiAQRf-FtSGUNy7d-w1kZgCpGkhKuzL-uzbpQrf3nHNfLMK21riNvMQ5sTOb2Ol3Q6BHbjtId2i3zqm3dZmR7wo_6ODXnvLzcrh_BxVG_dZIgEgFnPfGFuddsCkIHYyyQspCVFCg8RKkVs4ZgiCk8ZPQQvlsKLP3B-z3N3o:1noME5:U1C-GOL8-QQ756nVfw9xEZJD6jvP1mrCVpn3y5qoSS0','2022-05-24 09:32:17.244114');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_accesstoken`
--

DROP TABLE IF EXISTS `oauth2_provider_accesstoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_accesstoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `source_refresh_token_id` bigint DEFAULT NULL,
  `id_token_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token` (`token`),
  UNIQUE KEY `source_refresh_token_id` (`source_refresh_token_id`),
  UNIQUE KEY `id_token_id` (`id_token_id`),
  KEY `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_tour_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_acce_application_id_b22886e1_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_acce_id_token_id_85db651b_fk_oauth2_pr` FOREIGN KEY (`id_token_id`) REFERENCES `oauth2_provider_idtoken` (`id`),
  CONSTRAINT `oauth2_provider_acce_source_refresh_token_e66fbc72_fk_oauth2_pr` FOREIGN KEY (`source_refresh_token_id`) REFERENCES `oauth2_provider_refreshtoken` (`id`),
  CONSTRAINT `oauth2_provider_accesstoken_user_id_6e4c9a65_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_accesstoken`
--

LOCK TABLES `oauth2_provider_accesstoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_accesstoken` VALUES (1,'qlDr3hwjJpxtYCAYgEbyYqDPTk6SRb','2022-05-10 19:37:37.490554','read write',1,1,'2022-05-10 09:37:37.492552','2022-05-10 09:37:37.492552',NULL,NULL),(2,'2aqxCrZvvdnpnQNkfN7lL6xIkfE8uE','2022-05-11 02:33:26.887579','read write',1,1,'2022-05-10 16:33:26.889578','2022-05-10 16:33:26.889578',NULL,NULL),(3,'FRUbDSMsjaCNA5iG79gbT24GvCCxuH','2022-05-11 02:53:33.688217','read write',1,1,'2022-05-10 16:53:33.692205','2022-05-10 16:53:33.692205',NULL,NULL),(4,'2g6431DGuDYovUzrbhhHII5HSYJX6m','2022-05-18 11:43:48.629423','read write',1,1,'2022-05-18 01:43:48.631426','2022-05-18 01:43:48.631426',NULL,NULL),(5,'iLhdETYaa9skEvxCZXVo9K6bV8eEGw','2022-05-18 12:14:01.960165','read write',1,1,'2022-05-18 02:14:01.965158','2022-05-18 02:14:01.965158',NULL,NULL),(6,'t6gOOrhgwgVCFwthb8O4g0ooHSUY9X','2022-05-18 16:20:26.763154','read write',1,1,'2022-05-18 06:20:26.764228','2022-05-18 06:20:26.764228',NULL,NULL);
/*!40000 ALTER TABLE `oauth2_provider_accesstoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_application`
--

DROP TABLE IF EXISTS `oauth2_provider_application`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_application` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `client_id` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `redirect_uris` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `client_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `authorization_grant_type` varchar(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `client_secret` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `skip_authorization` tinyint(1) NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `algorithm` varchar(5) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `client_id` (`client_id`),
  KEY `oauth2_provider_application_user_id_79829054_fk_tour_user_id` (`user_id`),
  KEY `oauth2_provider_application_client_secret_53133678` (`client_secret`),
  CONSTRAINT `oauth2_provider_application_user_id_79829054_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_application`
--

LOCK TABLES `oauth2_provider_application` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_application` DISABLE KEYS */;
INSERT INTO `oauth2_provider_application` VALUES (1,'s8EkbgtO4X8IXcigpVTXplPsSx0ycMVmknyatkmv','','confidential','password','5Gd99JUAzJ08MhfDToA88APrI66rSTtDawi5hswb8ctVlZt5U7tJ4xtAPOFdyPuhVv3xcTzO4mM21dT9JavyMi0wVmAqkuXWoW98ZgAIHo3JgjP0JN5WOKe2ikKNjyCF','TourApp',1,0,'2022-05-07 16:31:03.087028','2022-05-07 16:31:03.087028','');
/*!40000 ALTER TABLE `oauth2_provider_application` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_grant`
--

DROP TABLE IF EXISTS `oauth2_provider_grant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_grant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `code` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `redirect_uri` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `code_challenge` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `code_challenge_method` varchar(10) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `nonce` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `claims` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT (_utf8mb3''),
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`),
  KEY `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_grant_user_id_e8f62af8_fk_tour_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_gran_application_id_81923564_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_grant_user_id_e8f62af8_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_grant`
--

LOCK TABLES `oauth2_provider_grant` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_grant` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_grant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_idtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_idtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_idtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `jti` char(32) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `expires` datetime(6) NOT NULL,
  `scope` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `application_id` bigint DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `jti` (`jti`),
  KEY `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_idtoken_user_id_dd512b59_fk_tour_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_idto_application_id_08c5ff4f_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_idtoken_user_id_dd512b59_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_idtoken`
--

LOCK TABLES `oauth2_provider_idtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` DISABLE KEYS */;
/*!40000 ALTER TABLE `oauth2_provider_idtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `oauth2_provider_refreshtoken`
--

DROP TABLE IF EXISTS `oauth2_provider_refreshtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `oauth2_provider_refreshtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `access_token_id` bigint DEFAULT NULL,
  `application_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  `created` datetime(6) NOT NULL,
  `updated` datetime(6) NOT NULL,
  `revoked` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `access_token_id` (`access_token_id`),
  UNIQUE KEY `oauth2_provider_refreshtoken_token_revoked_af8a5134_uniq` (`token`,`revoked`),
  KEY `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` (`application_id`),
  KEY `oauth2_provider_refreshtoken_user_id_da837fce_fk_tour_user_id` (`user_id`),
  CONSTRAINT `oauth2_provider_refr_access_token_id_775e84e8_fk_oauth2_pr` FOREIGN KEY (`access_token_id`) REFERENCES `oauth2_provider_accesstoken` (`id`),
  CONSTRAINT `oauth2_provider_refr_application_id_2d1c311b_fk_oauth2_pr` FOREIGN KEY (`application_id`) REFERENCES `oauth2_provider_application` (`id`),
  CONSTRAINT `oauth2_provider_refreshtoken_user_id_da837fce_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `oauth2_provider_refreshtoken`
--

LOCK TABLES `oauth2_provider_refreshtoken` WRITE;
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` DISABLE KEYS */;
INSERT INTO `oauth2_provider_refreshtoken` VALUES (1,'vKVM4n1nv7CJ6daSuwEVUE0lU2e8vX',1,1,1,'2022-05-10 09:37:37.531500','2022-05-10 09:37:37.531500',NULL),(2,'ErELXXiq2eg7BCycARZK7EMrZqZGbN',2,1,1,'2022-05-10 16:33:26.904579','2022-05-10 16:33:26.904579',NULL),(3,'7iqIeIErTVXk0r3GF95CHp7bweKtMz',3,1,1,'2022-05-10 16:53:33.699198','2022-05-10 16:53:33.699198',NULL),(4,'tPrT1PCwxO5RNl5udJugHWoNMRYyJi',4,1,1,'2022-05-18 01:43:48.643423','2022-05-18 01:43:48.643423',NULL),(5,'ANrwtlF2EhNUv46wslMQF1kVGfe6I5',5,1,1,'2022-05-18 02:14:01.974162','2022-05-18 02:14:01.974162',NULL),(6,'FJbdfsil0dos9Jk35Z5LT4hjUqAjJA',6,1,1,'2022-05-18 06:20:26.773560','2022-05-18 06:20:26.773560',NULL);
/*!40000 ALTER TABLE `oauth2_provider_refreshtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_action`
--

DROP TABLE IF EXISTS `tour_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_action` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `type` smallint unsigned NOT NULL,
  `creator_id` bigint NOT NULL,
  `tintuc_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tour_action_creator_id_50261e7f_fk_tour_user_id` (`creator_id`),
  KEY `tour_action_tintuc_id_a53c5f68_fk_tour_tintuc_id` (`tintuc_id`),
  CONSTRAINT `tour_action_creator_id_50261e7f_fk_tour_user_id` FOREIGN KEY (`creator_id`) REFERENCES `tour_user` (`id`),
  CONSTRAINT `tour_action_tintuc_id_a53c5f68_fk_tour_tintuc_id` FOREIGN KEY (`tintuc_id`) REFERENCES `tour_tintuc` (`id`),
  CONSTRAINT `tour_action_chk_1` CHECK ((`type` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_action`
--

LOCK TABLES `tour_action` WRITE;
/*!40000 ALTER TABLE `tour_action` DISABLE KEYS */;
INSERT INTO `tour_action` VALUES (1,'2022-05-10 17:24:24.737815','2022-05-10 17:24:24.737815',0,1,1);
/*!40000 ALTER TABLE `tour_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_comment`
--

DROP TABLE IF EXISTS `tour_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_comment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `creator_id` bigint NOT NULL,
  `tintuc_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tour_comment_creator_id_d3f9b0ce_fk_tour_user_id` (`creator_id`),
  KEY `tour_comment_tintuc_id_34107a5f_fk_tour_tintuc_id` (`tintuc_id`),
  CONSTRAINT `tour_comment_creator_id_d3f9b0ce_fk_tour_user_id` FOREIGN KEY (`creator_id`) REFERENCES `tour_user` (`id`),
  CONSTRAINT `tour_comment_tintuc_id_34107a5f_fk_tour_tintuc_id` FOREIGN KEY (`tintuc_id`) REFERENCES `tour_tintuc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_comment`
--

LOCK TABLES `tour_comment` WRITE;
/*!40000 ALTER TABLE `tour_comment` DISABLE KEYS */;
INSERT INTO `tour_comment` VALUES (1,'hay','2022-05-18 06:19:16.457941','2022-05-18 07:10:31.501286',1,1),(4,'xuat sac','2022-05-18 07:03:46.090756','2022-05-18 07:03:46.090756',2,1),(5,'good','2022-05-18 17:09:50.453277','2022-05-18 17:09:50.453277',3,1);
/*!40000 ALTER TABLE `tour_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_diadanh`
--

DROP TABLE IF EXISTS `tour_diadanh`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_diadanh` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_diadanh`
--

LOCK TABLES `tour_diadanh` WRITE;
/*!40000 ALTER TABLE `tour_diadanh` DISABLE KEYS */;
INSERT INTO `tour_diadanh` VALUES (2,'ben thanh'),(1,'buon don');
/*!40000 ALTER TABLE `tour_diadanh` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_rating`
--

DROP TABLE IF EXISTS `tour_rating`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_rating` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `rate` smallint unsigned NOT NULL,
  `creator_id` bigint NOT NULL,
  `tintuc_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tour_rating_creator_id_3cc5da7c_fk_tour_user_id` (`creator_id`),
  KEY `tour_rating_tintuc_id_cbaa388f_fk_tour_tintuc_id` (`tintuc_id`),
  CONSTRAINT `tour_rating_creator_id_3cc5da7c_fk_tour_user_id` FOREIGN KEY (`creator_id`) REFERENCES `tour_user` (`id`),
  CONSTRAINT `tour_rating_tintuc_id_cbaa388f_fk_tour_tintuc_id` FOREIGN KEY (`tintuc_id`) REFERENCES `tour_tintuc` (`id`),
  CONSTRAINT `tour_rating_chk_1` CHECK ((`rate` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_rating`
--

LOCK TABLES `tour_rating` WRITE;
/*!40000 ALTER TABLE `tour_rating` DISABLE KEYS */;
INSERT INTO `tour_rating` VALUES (1,'2022-05-10 17:31:40.222028','2022-05-10 17:31:40.222028',5,1,1);
/*!40000 ALTER TABLE `tour_rating` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tag`
--

DROP TABLE IF EXISTS `tour_tag`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_tag` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tag`
--

LOCK TABLES `tour_tag` WRITE;
/*!40000 ALTER TABLE `tour_tag` DISABLE KEYS */;
INSERT INTO `tour_tag` VALUES (2,'dulich'),(1,'search');
/*!40000 ALTER TABLE `tour_tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tintuc`
--

DROP TABLE IF EXISTS `tour_tintuc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_tintuc` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `content` longtext COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `tour_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_tintuc_subject_tour_id_ace252e4_uniq` (`subject`,`tour_id`),
  KEY `tour_tintuc_tour_id_f96034c3_fk_tour_tour_id` (`tour_id`),
  CONSTRAINT `tour_tintuc_tour_id_f96034c3_fk_tour_tour_id` FOREIGN KEY (`tour_id`) REFERENCES `tour_tour` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tintuc`
--

LOCK TABLES `tour_tintuc` WRITE;
/*!40000 ALTER TABLE `tour_tintuc` DISABLE KEYS */;
INSERT INTO `tour_tintuc` VALUES (1,'chi tiet 1','tour/2022/05/R_VFTTP7d.jpg','2022-05-05 03:28:23.390909','2022-05-05 16:31:32.463699',1,'du lich',1),(2,'chi tiet 2','tour/2022/05/R_zsjkLfX.jpg','2022-05-18 17:07:30.166906','2022-05-18 17:07:55.443475',1,'địa danh đẹp',2);
/*!40000 ALTER TABLE `tour_tintuc` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tintuc_tags`
--

DROP TABLE IF EXISTS `tour_tintuc_tags`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_tintuc_tags` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tintuc_id` bigint NOT NULL,
  `tag_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_tintuc_tags_tintuc_id_tag_id_3e744128_uniq` (`tintuc_id`,`tag_id`),
  KEY `tour_tintuc_tags_tag_id_9fe618f1_fk_tour_tag_id` (`tag_id`),
  CONSTRAINT `tour_tintuc_tags_tag_id_9fe618f1_fk_tour_tag_id` FOREIGN KEY (`tag_id`) REFERENCES `tour_tag` (`id`),
  CONSTRAINT `tour_tintuc_tags_tintuc_id_effd0995_fk_tour_tintuc_id` FOREIGN KEY (`tintuc_id`) REFERENCES `tour_tintuc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tintuc_tags`
--

LOCK TABLES `tour_tintuc_tags` WRITE;
/*!40000 ALTER TABLE `tour_tintuc_tags` DISABLE KEYS */;
INSERT INTO `tour_tintuc_tags` VALUES (1,1,1),(2,1,2);
/*!40000 ALTER TABLE `tour_tintuc_tags` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tintucview`
--

DROP TABLE IF EXISTS `tour_tintucview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_tintucview` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `views` int NOT NULL,
  `tintuc_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_tintucview_tintuc_id_ee4c5db5_uniq` (`tintuc_id`),
  CONSTRAINT `tour_tintucview_tintuc_id_ee4c5db5_fk_tour_tintuc_id` FOREIGN KEY (`tintuc_id`) REFERENCES `tour_tintuc` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tintucview`
--

LOCK TABLES `tour_tintucview` WRITE;
/*!40000 ALTER TABLE `tour_tintucview` DISABLE KEYS */;
INSERT INTO `tour_tintucview` VALUES (1,'2022-05-11 05:37:40.372277','2022-05-18 01:37:28.102778',10,1);
/*!40000 ALTER TABLE `tour_tintucview` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_tour`
--

DROP TABLE IF EXISTS `tour_tour`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_tour` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `subject` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `image` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `created_date` datetime(6) NOT NULL,
  `updated_date` datetime(6) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `description` longtext COLLATE utf8mb4_unicode_520_ci,
  `diadanh_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_tour_subject_diadanh_id_7c2f3323_uniq` (`subject`,`diadanh_id`),
  KEY `tour_tour_diadanh_id_3b22ec62_fk_tour_diadanh_id` (`diadanh_id`),
  CONSTRAINT `tour_tour_diadanh_id_3b22ec62_fk_tour_diadanh_id` FOREIGN KEY (`diadanh_id`) REFERENCES `tour_diadanh` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_tour`
--

LOCK TABLES `tour_tour` WRITE;
/*!40000 ALTER TABLE `tour_tour` DISABLE KEYS */;
INSERT INTO `tour_tour` VALUES (1,'cho ben thanh','tour/2022/05/R_VFTTP7d.jpg','2022-05-05 03:28:23.390909','2022-05-05 03:41:06.087627',1,'khu du lich noi tieng tpHCM',2),(2,'Buon Don','tour/2022/05/R_1_18vjDtJ.jpg','2022-05-05 03:42:23.715508','2022-05-05 03:42:23.715508',1,'khu du lich',1);
/*!40000 ALTER TABLE `tour_tour` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_user`
--

DROP TABLE IF EXISTS `tour_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `first_name` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `last_name` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `email` varchar(254) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `avatar` varchar(100) COLLATE utf8mb4_unicode_520_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_user`
--

LOCK TABLES `tour_user` WRITE;
/*!40000 ALTER TABLE `tour_user` DISABLE KEYS */;
INSERT INTO `tour_user` VALUES (1,'pbkdf2_sha256$320000$zCYxq9gwN5GXq89Mc6lQtD$gUWP83TBanwc5EMGPKXDaQf0jDnchJkpr6ZNrao7JZo=','2022-05-10 09:32:17.231136',1,'admin','','','admin@gmail.com',1,1,'2022-05-04 17:29:51.997817',''),(2,'pbkdf2_sha256$320000$8a6PfONQ1biLk2Cr4apvV4$DD0DPdJ8F4hDosAwwbVu8nWDbiy8Eogpc6/qbXgAZ4M=',NULL,0,'thien','thien','phan','user123@gmail.com',0,1,'2022-05-06 18:14:33.981653',''),(3,'1','2022-05-18 16:52:28.000000',1,'Thethe','the','nguyen','nguyenthe@gmail.com',0,1,'2022-05-18 16:51:43.000000','uploads/2022/05/R_1.jpg');
/*!40000 ALTER TABLE `tour_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_user_groups`
--

DROP TABLE IF EXISTS `tour_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_user_groups_user_id_group_id_0af6f172_uniq` (`user_id`,`group_id`),
  KEY `tour_user_groups_group_id_3b9132f0_fk_auth_group_id` (`group_id`),
  CONSTRAINT `tour_user_groups_group_id_3b9132f0_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `tour_user_groups_user_id_a5ee24aa_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_user_groups`
--

LOCK TABLES `tour_user_groups` WRITE;
/*!40000 ALTER TABLE `tour_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `tour_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tour_user_user_permissions`
--

DROP TABLE IF EXISTS `tour_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tour_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `tour_user_user_permissions_user_id_permission_id_6789e08c_uniq` (`user_id`,`permission_id`),
  KEY `tour_user_user_permi_permission_id_d15c17ee_fk_auth_perm` (`permission_id`),
  CONSTRAINT `tour_user_user_permi_permission_id_d15c17ee_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `tour_user_user_permissions_user_id_d6f606b0_fk_tour_user_id` FOREIGN KEY (`user_id`) REFERENCES `tour_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tour_user_user_permissions`
--

LOCK TABLES `tour_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `tour_user_user_permissions` DISABLE KEYS */;
INSERT INTO `tour_user_user_permissions` VALUES (1,3,1);
/*!40000 ALTER TABLE `tour_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-05-19  0:57:54
