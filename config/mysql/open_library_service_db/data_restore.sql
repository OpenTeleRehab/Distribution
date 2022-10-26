-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: open_library_service
-- ------------------------------------------------------
-- Server version	8.0.29

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additional_fields`
--

DROP TABLE IF EXISTS `additional_fields`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_fields` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `field` json NOT NULL,
  `value` json NOT NULL,
  `exercise_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_fields`
--

LOCK TABLES `additional_fields` WRITE;
/*!40000 ALTER TABLE `additional_fields` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_fields` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `additional_homes`
--

DROP TABLE IF EXISTS `additional_homes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additional_homes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `display_quick_stat` tinyint(1) NOT NULL DEFAULT '0',
  `display_feature_resource` tinyint(1) NOT NULL DEFAULT '0',
  `resources` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additional_homes`
--

LOCK TABLES `additional_homes` WRITE;
/*!40000 ALTER TABLE `additional_homes` DISABLE KEYS */;
/*!40000 ALTER TABLE `additional_homes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `answers`
--

DROP TABLE IF EXISTS `answers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `answers` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `description` json NOT NULL,
  `question_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `global_answer_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `answers`
--

LOCK TABLES `answers` WRITE;
/*!40000 ALTER TABLE `answers` DISABLE KEYS */;
/*!40000 ALTER TABLE `answers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `categories`
--

DROP TABLE IF EXISTS `categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `categories` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `parent_id` int DEFAULT NULL,
  `global_category_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categories`
--

LOCK TABLES `categories` WRITE;
/*!40000 ALTER TABLE `categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contributors`
--

DROP TABLE IF EXISTS `contributors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contributors` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `included_in_acknowledgment` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `contributors_email_unique` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contributors`
--

LOCK TABLES `contributors` WRITE;
/*!40000 ALTER TABLE `contributors` DISABLE KEYS */;
/*!40000 ALTER TABLE `contributors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_material_categories`
--

DROP TABLE IF EXISTS `education_material_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_material_categories` (
  `education_material_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`education_material_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_material_categories`
--

LOCK TABLES `education_material_categories` WRITE;
/*!40000 ALTER TABLE `education_material_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_material_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `education_materials`
--

DROP TABLE IF EXISTS `education_materials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `education_materials` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `file_id` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `edit_translation` int unsigned DEFAULT NULL,
  `editing_by` int unsigned DEFAULT NULL,
  `editing_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `global_education_material_id` int NOT NULL,
  `global` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `education_materials`
--

LOCK TABLES `education_materials` WRITE;
/*!40000 ALTER TABLE `education_materials` DISABLE KEYS */;
/*!40000 ALTER TABLE `education_materials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_categories`
--

DROP TABLE IF EXISTS `exercise_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_categories` (
  `exercise_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_categories`
--

LOCK TABLES `exercise_categories` WRITE;
/*!40000 ALTER TABLE `exercise_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercise_file`
--

DROP TABLE IF EXISTS `exercise_file`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercise_file` (
  `exercise_id` int NOT NULL,
  `file_id` int NOT NULL,
  `order` int NOT NULL,
  PRIMARY KEY (`exercise_id`,`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercise_file`
--

LOCK TABLES `exercise_file` WRITE;
/*!40000 ALTER TABLE `exercise_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_file` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercises`
--

DROP TABLE IF EXISTS `exercises`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exercises` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `sets` tinyint DEFAULT NULL,
  `reps` tinyint DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `edit_translation` int unsigned DEFAULT NULL,
  `editing_by` int unsigned DEFAULT NULL,
  `editing_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `global_exercise_id` int NOT NULL,
  `global` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercises`
--

LOCK TABLES `exercises` WRITE;
/*!40000 ALTER TABLE `exercises` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercises` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `failed_jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `files`
--

DROP TABLE IF EXISTS `files`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `files` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `filename` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `metadata` json DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `size` double unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `files`
--

LOCK TABLES `files` WRITE;
/*!40000 ALTER TABLE `files` DISABLE KEYS */;
/*!40000 ALTER TABLE `files` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `queue` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `attempts` tinyint unsigned NOT NULL,
  `reserved_at` int unsigned DEFAULT NULL,
  `available_at` int unsigned NOT NULL,
  `created_at` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_queue_index` (`queue`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `languages`
--

DROP TABLE IF EXISTS `languages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `languages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `rtl` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
/*!40000 ALTER TABLE `languages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `localizations`
--

DROP TABLE IF EXISTS `localizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `localizations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `translation_id` int NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `localizations`
--

LOCK TABLES `localizations` WRITE;
/*!40000 ALTER TABLE `localizations` DISABLE KEYS */;
/*!40000 ALTER TABLE `localizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `migrations` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2021_01_01_000000_add_columns_to_users_table',1),(5,'2021_01_02_000000_create_categories_table',1),(6,'2021_01_03_000000_create_files_table',1),(7,'2021_01_04_000000_create_translations_table',1),(8,'2021_01_05_000000_create_languages_table',1),(9,'2021_01_06_000000_create_localizations_table',1),(10,'2021_02_01_000000_create_exercises_table',1),(11,'2021_02_02_000000_create_exercise_categories_table',1),(12,'2021_02_03_000000_create_exercise_files_table',1),(13,'2021_02_04_000000_create_additional_fields_table',1),(14,'2021_03_01_000000_create_education_materials_table',1),(15,'2021_03_02_000000_create_education_material_categories_table',1),(16,'2021_04_01_000000_create_questionnaires_table',1),(17,'2021_04_02_000000_create_questionnaire_categories_table',1),(18,'2021_04_03_000000_create_questions_table',1),(19,'2021_04_04_000000_create_answers_table',1),(20,'2021_05_01_000000_create_term_and_conditions_table',1),(21,'2021_05_02_000000_create_static_pages_table',1),(22,'2021_05_03_000000_create_privacy_policies_table',1),(23,'2021_07_30_035351_alter_exercises_table',1),(24,'2021_07_30_040138_alter_education_materials_table',1),(25,'2021_07_30_040158_alter_questionnaires_table',1),(26,'2021_08_02_065643_create_contributor_table',1),(27,'2021_08_04_021846_rename_approved_by_exercise_table',1),(28,'2021_08_04_021904_rename_approved_by_questionnaire_table',1),(29,'2021_08_04_021929_rename_approved_by_education_material_table',1),(30,'2021_08_04_073858_add_size_to_files_table',1),(31,'2021_08_11_081301_add_type_user_table',1),(32,'2021_08_16_034159_add_auto_translated_to_exercises_table',1),(33,'2021_08_17_005508_add_auto_translated_to_education_materials_table',1),(34,'2021_08_17_005556_add_auto_translated_to_questionnaires_table',1),(35,'2021_08_17_083120_change_auto_translated_education_material_table',1),(36,'2021_08_17_083139_change_auto_translated_exercise_table',1),(37,'2021_08_17_083153_change_auto_translated_questionnaire_table',1),(38,'2021_08_27_034947_alter_static_page_table',1),(39,'2021_08_27_042015_create_additional_homes_table',1),(40,'2021_08_30_100827_add_edit_translation_to_exercises_table',1),(41,'2021_08_30_101259_add_edit_translation_to_education_materials_table',1),(42,'2021_08_30_101329_add_edit_translation_to_questionnaires_table',1),(43,'2021_08_31_021056_add_columns_in_term_and_conditions_table',1),(44,'2021_08_31_033122_term_condition_banners_table',1),(45,'2021_09_01_070907_change_resources_additional_home_table',1),(46,'2021_09_02_040451_additional_acknowledgments_table',1),(47,'2021_09_02_040655_add_column_in_static_pages_table',1),(48,'2021_09_03_031800_add_column_in_contributors_table',1),(49,'2021_09_07_085444_create_jobs_table',1),(50,'2021_09_09_045257_add_editing_to_resources_table',1),(51,'2021_09_09_074547_add_slug_in_exercises_table',1),(52,'2021_09_09_074708_add_slug_in_education_materials_table',1),(53,'2021_09_09_074802_add_slug_in_questionnaires_table',1),(54,'2021_09_15_102802_drop_additional_acknowledgments_table',1),(55,'2022_09_15_071853_add_global_education_material_id_and_global_to_education_materials_table',1),(56,'2022_09_15_082203_add_global_exercise_id_and_global_to_exercises_table',1),(57,'2022_09_15_082223_add_global_questionnaire_id_and_global_to_questionnaires_table',1),(58,'2022_09_16_065249_add_soft_delete_to_questionnaires_table',1),(59,'2022_09_16_065258_add_soft_delete_to_exercises_table',1),(60,'2022_09_16_065308_add_soft_delete_to_education_materials_table',1),(61,'2022_09_16_072835_add_global_question_id_to_questions_table',1),(62,'2022_09_16_073403_add_global_answer_id_to_answers_table',1),(63,'2022_09_16_082501_add_global_category_id_to_categories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privacy_policies`
--

DROP TABLE IF EXISTS `privacy_policies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `privacy_policies` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` json NOT NULL,
  `published_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privacy_policies`
--

LOCK TABLES `privacy_policies` WRITE;
/*!40000 ALTER TABLE `privacy_policies` DISABLE KEYS */;
/*!40000 ALTER TABLE `privacy_policies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaire_categories`
--

DROP TABLE IF EXISTS `questionnaire_categories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaire_categories` (
  `questionnaire_id` int NOT NULL,
  `category_id` int NOT NULL,
  PRIMARY KEY (`questionnaire_id`,`category_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaire_categories`
--

LOCK TABLES `questionnaire_categories` WRITE;
/*!40000 ALTER TABLE `questionnaire_categories` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaire_categories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questionnaires`
--

DROP TABLE IF EXISTS `questionnaires`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questionnaires` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `description` json NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hash` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `reviewed_by` int DEFAULT NULL,
  `uploaded_by` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `edit_translation` int unsigned DEFAULT NULL,
  `editing_by` int unsigned DEFAULT NULL,
  `editing_at` timestamp NULL DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `global_questionnaire_id` int NOT NULL,
  `global` tinyint(1) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questionnaires`
--

LOCK TABLES `questionnaires` WRITE;
/*!40000 ALTER TABLE `questionnaires` DISABLE KEYS */;
/*!40000 ALTER TABLE `questionnaires` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `questions`
--

DROP TABLE IF EXISTS `questions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `questions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `questionnaire_id` int NOT NULL,
  `title` json NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `order` int NOT NULL,
  `file_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `global_question_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `questions`
--

LOCK TABLES `questions` WRITE;
/*!40000 ALTER TABLE `questions` DISABLE KEYS */;
/*!40000 ALTER TABLE `questions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `static_pages`
--

DROP TABLE IF EXISTS `static_pages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `static_pages` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `title` json NOT NULL,
  `content` json NOT NULL,
  `file_id` int DEFAULT NULL,
  `url_path_segment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `partner_content` json DEFAULT NULL,
  `additional_home_id` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `static_pages`
--

LOCK TABLES `static_pages` WRITE;
/*!40000 ALTER TABLE `static_pages` DISABLE KEYS */;
/*!40000 ALTER TABLE `static_pages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_and_conditions`
--

DROP TABLE IF EXISTS `term_and_conditions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_and_conditions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `version` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `content` json NOT NULL,
  `published_date` datetime DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `title` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_and_conditions`
--

LOCK TABLES `term_and_conditions` WRITE;
/*!40000 ALTER TABLE `term_and_conditions` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_and_conditions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `term_condition_banners`
--

DROP TABLE IF EXISTS `term_condition_banners`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `term_condition_banners` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `term_condition_banners`
--

LOCK TABLES `term_condition_banners` WRITE;
/*!40000 ALTER TABLE `term_condition_banners` DISABLE KEYS */;
/*!40000 ALTER TABLE `term_condition_banners` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `key` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=523 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'dashboard','Dashboard','admin_portal'),(2,'resources','Resources','admin_portal'),(3,'categories','Categories','admin_portal'),(4,'translations','Translations','admin_portal'),(5,'users','Users','admin_portal'),(6,'profile','Profile','admin_portal'),(7,'gender','Gender','admin_portal'),(8,'static_pages','Static Pages','admin_portal'),(9,'404','404 Not Found','admin_portal'),(10,'confirm.submission','Confirm Submission','admin_portal'),(11,'common.close','Close','admin_portal'),(12,'common.yes','Yes','admin_portal'),(13,'common.no','No','admin_portal'),(14,'common.welcome','Welcome','admin_portal'),(15,'common.logout','Logout','admin_portal'),(16,'common.profile.update','Update Profile','admin_portal'),(17,'common.search.label','Search','admin_portal'),(18,'common.media','Media','admin_portal'),(19,'common.information','Information','admin_portal'),(20,'common.categories','Categories','admin_portal'),(21,'common.selected','Selected','admin_portal'),(22,'common.additional_fields','Additional Fields','admin_portal'),(23,'common.add_more_fields','Add More Fields','admin_portal'),(24,'common.submit','Submit','admin_portal'),(25,'common.add_more','Add More','admin_portal'),(26,'common.cancel','Cancel','admin_portal'),(27,'common.remove','Remove','admin_portal'),(28,'common.default','default','admin_portal'),(29,'common.show_language.version','Show language version','admin_portal'),(30,'common.create','Create','admin_portal'),(31,'common.edit','Edit','admin_portal'),(32,'common.delete','Delete','admin_portal'),(33,'common.save','Save','admin_portal'),(34,'common.approve','Approve','admin_portal'),(35,'common.reject','Reject','admin_portal'),(36,'common.items','Items','admin_portal'),(37,'common.first_name','First Name','admin_portal'),(38,'common.last_name','Last Name','admin_portal'),(39,'common.email','Email','admin_portal'),(40,'common.delete_confirmation_message','Are you sure want to delete this record?','admin_portal'),(41,'common.upload_image','Upload Image','admin_portal'),(42,'common.type.image','Image','admin_portal'),(43,'common.type.archive','Archive','admin_portal'),(44,'common.type.media','Media','admin_portal'),(45,'common.type.pdf','PDF','admin_portal'),(46,'common.type.document','Document','admin_portal'),(47,'common.type.spreadsheet','Spreadsheet','admin_portal'),(48,'common.type.presentation','Presentation','admin_portal'),(49,'common.english','English','admin_portal'),(50,'common.next','Next','admin_portal'),(51,'common.previous','Previous','admin_portal'),(52,'common.total_edit_translations','Total edit translations: ${index} of ${total}','admin_portal'),(53,'common.oops','Oops!','admin_portal'),(54,'common.404.title','404 Not Found','admin_portal'),(55,'common.404.description','Sorry, an error has occurred, Requested page not found!','admin_portal'),(56,'dashboard.quick_stats','Quick Stats','admin_portal'),(57,'dashboard.total_exercises','Total Exercises','admin_portal'),(58,'dashboard.total_education_materials','Total Education Materials','admin_portal'),(59,'dashboard.total_questionnaires','Total Questionnaires','admin_portal'),(60,'dashboard.new_submissions','New Submissions','admin_portal'),(61,'dashboard.new_translations','New Translations','admin_portal'),(62,'banner.search.placeholder','Search for rehabilitation resources','admin_portal'),(63,'education_material.search','Search materials','admin_portal'),(64,'questionnaire.search','Search questionnaires','admin_portal'),(65,'exercise.search','Search exercises','admin_portal'),(66,'exercise.download','Download Exercises','admin_portal'),(67,'exercise.title','Title','admin_portal'),(68,'exercise.title.placeholder','Enter exercise title','admin_portal'),(69,'exercise.sets','Sets','admin_portal'),(70,'exercise.reps','Reps','admin_portal'),(71,'exercise.sets.placeholder','Enter number of Sets','admin_portal'),(72,'exercise.reps.placeholder','Enter number of Reps','admin_portal'),(73,'exercise.show_sets_reps','Set default exercise sets and reps','admin_portal'),(74,'exercise.additional_field.label','Label','admin_portal'),(75,'exercise.additional_field.value','Value','admin_portal'),(76,'exercise.additional_field.placeholder.label','Enter label','admin_portal'),(77,'exercise.additional_field.placeholder.value','Enter value','admin_portal'),(78,'exercise.media_upload.required','Please upload the image','admin_portal'),(79,'exercise.title.required','Please fill in the title','admin_portal'),(80,'exercise.sets.required','Please fill in the correct number of Sets','admin_portal'),(81,'exercise.reps.required','Please fill in the correct number of Reps','admin_portal'),(82,'exercise.additional_field.label.required','Please fill in the label','admin_portal'),(83,'exercise.additional_field.value.required','Please fill in the value','admin_portal'),(84,'exercise.delete_confirmation_title','Exercise Deletion','admin_portal'),(85,'category.exercises','Exercises','admin_portal'),(86,'category.education_materials','Education Materials','admin_portal'),(87,'category.questionnaires','Questionnaires','admin_portal'),(88,'category.search','Search category','admin_portal'),(89,'category.search_sub_category','Search sub-category','admin_portal'),(90,'category.title','Category title','admin_portal'),(91,'category.category','Category','admin_portal'),(92,'category.category_value','Category value','admin_portal'),(93,'placeholder.enter_category_name','Enter category name','admin_portal'),(94,'placeholder.enter_category_value','Enter category value','admin_portal'),(95,'category.category_value_hint','Use semicolon ( ; ) between values to separate','admin_portal'),(96,'category.not_inused','Not used','admin_portal'),(97,'category.delete_confirmation_title','Category deletion','admin_portal'),(98,'category.new_exercise','New Exercise Category Value','admin_portal'),(99,'category.edit_exercise','Edit Exercise Category','admin_portal'),(100,'category.new_education','New Education Material Category Value','admin_portal'),(101,'category.edit_education','Edit Education Material Category','admin_portal'),(102,'category.new_questionnaire','New Questionnaire Category Value','admin_portal'),(103,'category.edit_questionnaire','Edit Questionnaire Category','admin_portal'),(104,'category.number_of_categories','${number} categories','admin_portal'),(105,'category.number_of_sub_categories','${number} sub-categories','admin_portal'),(106,'category.selected','selected','admin_portal'),(107,'error.category','Please fill in the title','admin_portal'),(108,'error.current_category','Please choose category','admin_portal'),(109,'error.category_value','Please fill in the titles','admin_portal'),(110,'toast_title.new_exercise','New exercise','admin_portal'),(111,'toast_title.approve_exercise','Approve exercise','admin_portal'),(112,'toast_title.approve_questionnaire','Approve questionnaire','admin_portal'),(113,'toast_title.reject_exercise','Reject exercise','admin_portal'),(114,'toast_title.reject_questionnaire','Reject questionnaire','admin_portal'),(115,'toast_title.new_category','New category','admin_portal'),(116,'toast_title.edit_category','Edit category','admin_portal'),(117,'toast_title.delete_category','Delete category','admin_portal'),(118,'toast_title.delete_exercise','Delete exercise','admin_portal'),(119,'toast_title.delete_education_material','Delete education material','admin_portal'),(120,'toast_title.delete_questionnaire','Delete questionnaire','admin_portal'),(121,'success_message.exercise_update','Exercise ${status} successfully','admin_portal'),(122,'success_message.exercise_create','Exercise created successfully','admin_portal'),(123,'success_message.exercise_reject','Exercise rejected successfully','admin_portal'),(124,'success_message.questionnaire_reject','Questionnaire rejected successfully','admin_portal'),(125,'success_message.exercise_delete','Exercise deleted successfully','admin_portal'),(126,'success_message.education_material_delete','Education material deleted successfully','admin_portal'),(127,'success_message.questionnaire_delete','Questionnaire deleted successfully','admin_portal'),(128,'success_message.category_add','Category created successfully','admin_portal'),(129,'success_message.category_update','Category updated successfully','admin_portal'),(130,'success_message.category_delete','Category deleted successfully','admin_portal'),(131,'exercise.create','Add new Exercise','admin_portal'),(132,'exercise.edit','Edit/Review Resource','admin_portal'),(133,'placeholder.first_name','Enter first name','admin_portal'),(134,'placeholder.last_name','Enter last name','admin_portal'),(135,'placeholder.email','Enter email','admin_portal'),(136,'user.error.first_name','Please fill in first name','admin_portal'),(137,'user.error.last_name','Please fill in last name','admin_portal'),(138,'user.error.email','Please fill in the email','admin_portal'),(139,'success_message.contribute_create','Contribute submission successfully','admin_portal'),(140,'resource.exercises','Exercises','admin_portal'),(141,'resource.education_materials','Education Materials','admin_portal'),(142,'resource.questionnaires','Questionnaires','admin_portal'),(143,'common.new_content','New Content','admin_portal'),(144,'common.no_data','No Data','admin_portal'),(145,'resource.search','Search','admin_portal'),(146,'common.language','Language','admin_portal'),(147,'common.title','Title','admin_portal'),(148,'common.status','Status','admin_portal'),(149,'common.uploaded_by','Uploaded By','admin_portal'),(150,'common.uploaded_by_email','Contributor Email','admin_portal'),(151,'common.uploaded_date','Uploaded Date','admin_portal'),(152,'common.reviewed_by','Reviewed By','admin_portal'),(153,'common.need_action','Need Action','admin_portal'),(154,'common.pending','Pending','admin_portal'),(155,'common.approved','Approved','admin_portal'),(156,'common.rejected','Rejected','admin_portal'),(157,'personal','Personal','admin_portal'),(158,'profile.information','Profile Information','admin_portal'),(159,'profile.password','Password','admin_portal'),(160,'logout','Logout','admin_portal'),(161,'logout.confirmation','Logout Confirmation','admin_portal'),(162,'logout.message','Are you sure to logout?','admin_portal'),(163,'logout.cancel','No','admin_portal'),(164,'logout.confirm','Yes','admin_portal'),(165,'common.filters','Filters','admin_portal'),(166,'common.columns','Columns','admin_portal'),(167,'common.all','All','admin_portal'),(168,'common.clear','Clear','admin_portal'),(169,'common.apply','Apply','admin_portal'),(170,'common.search','Search','admin_portal'),(171,'common.role','Role','admin_portal'),(172,'common.last_login','Last Login','admin_portal'),(173,'common.action','Action','admin_portal'),(174,'common.disabled','Disable','admin_portal'),(175,'common.enabled','Enable','admin_portal'),(176,'common.resend_mail','Send mail','admin_portal'),(177,'common.search.placeholder','Search','admin_portal'),(178,'common.timerange.placeholder','Select time range','admin_portal'),(179,'common.languages','Languages','admin_portal'),(180,'common.system_labels','System labels','admin_portal'),(181,'common.labels','Labels','admin_portal'),(182,'common.id','ID','admin_portal'),(183,'common.name','Name','admin_portal'),(184,'common.code','Code','admin_portal'),(185,'exercise.saved','saved','admin_portal'),(186,'exercise.approved','approved','admin_portal'),(187,'toast_title.save_exercise','Save exercise','admin_portal'),(188,'toast_title.save_questionnaire','Save questionnaire','admin_portal'),(189,'education_material.edit','Edit/Review Education Material','admin_portal'),(190,'education_material.create','Add New Education Material','admin_portal'),(191,'education_material.title','Title','admin_portal'),(192,'education_material.title.placeholder','Enter education material title','admin_portal'),(193,'education_material.title.required','Please fill in the title','admin_portal'),(194,'education_material.upload_file','Upload file','admin_portal'),(195,'education_material.upload_file.placeholder','Browse a file','admin_portal'),(196,'education_material.upload_file.required','Please select a file','admin_portal'),(197,'education_material.upload_file.max_size','Please select a file smaller than ${size} MB','admin_portal'),(198,'education_material.delete_confirmation_title','Education Material Deletion','admin_portal'),(199,'toast_title.new_education_material','New education material','admin_portal'),(200,'toast_title.approve_education_material','Approve education material','admin_portal'),(201,'toast_title.save_education_material','Save education material','admin_portal'),(202,'toast_title.reject_education_material','Reject education material','admin_portal'),(203,'success_message.education_material_update','Education material ${status} successfully','admin_portal'),(204,'success_message.questionnaire_update','Questionnaire ${status} successfully','admin_portal'),(205,'success_message.education_material_create','Education material created successfully','admin_portal'),(206,'success_message.education_material_reject','Education material rejected successfully','admin_portal'),(207,'error_message.education_material_create','Education material cannot be created','admin_portal'),(208,'education_material.approved','approved','admin_portal'),(209,'education_material.saved','saved','admin_portal'),(210,'user.management','User Management','admin_portal'),(211,'user.new','New User','admin_portal'),(212,'common.admin','Admin','admin_portal'),(213,'common.moderator','Moderator','admin_portal'),(214,'common.gender','Gender','admin_portal'),(215,'common.female','Female','admin_portal'),(216,'common.male','Male','admin_portal'),(217,'common.other','Other','admin_portal'),(218,'common.active','Active','admin_portal'),(219,'common.inactive','Inactive','admin_portal'),(220,'user.hint_message_user','Admins can manage other users, manage submitted resources, manage categories, manage UI label translations, and manage static pages.','admin_portal'),(221,'user.hint_message_resource','Moderators can manage manage submitted resources.','admin_portal'),(222,'toast_title.new_admin_account','New user account','admin_portal'),(223,'success_message.user_add','User created successfully','admin_portal'),(224,'user.delete_confirmation_title','User deletion','admin_portal'),(225,'toast_title.delete_admin_account','Delete user','admin_portal'),(226,'success_message.user_delete','User deleted successfully','admin_portal'),(227,'user.switchStatus_confirmation_title','Switch user status','admin_portal'),(228,'common.switchStatus_confirmation_message','Are you sure want to switch the status of this record?','admin_portal'),(229,'toast_title.edit_admin_account','Edit admin account','admin_portal'),(230,'success_message.user_update','User updated successfully','admin_portal'),(231,'user.edit','Edit User','admin_portal'),(232,'error_message.email_exists','Email already exists','admin_portal'),(233,'language.new','New language','admin_portal'),(234,'language.edit','Edit Language','admin_portal'),(235,'language.name','Name','admin_portal'),(236,'language.code','Code','admin_portal'),(237,'language.rtl','RTL Layout','admin_portal'),(238,'error_message.language_exists','Language already exist!','admin_portal'),(239,'toast_title.new_language','New language','admin_portal'),(240,'toast_title.edit_language','Edit language','admin_portal'),(241,'toast_title.delete_language','Delete language','admin_portal'),(242,'error.language.name','Please fill in name','admin_portal'),(243,'error.language.code','Please fill in code','admin_portal'),(244,'error.language.code.format','Code must be in 2 digits','admin_portal'),(245,'placeholder.language.name','Enter name','admin_portal'),(246,'placeholder.language.code','Enter code','admin_portal'),(247,'success_message.language_add','Language created successfully','admin_portal'),(248,'success_message.language_update','Language updated successfully','admin_portal'),(249,'success_message.language_delete','Language deleted successfully','admin_portal'),(250,'error_message.language_delete','Language cannot be deleted','admin_portal'),(251,'language.delete_confirmation_title','Language deletion','admin_portal'),(252,'additional_field.aim','Aim','admin_portal'),(253,'additional_field.progressions_variations','Progressions and variations','admin_portal'),(254,'additional_field.precautions','Precautions','admin_portal'),(255,'placeholder.gender','Please select a gender','admin_portal'),(256,'placeholder.language','Please select a language','admin_portal'),(257,'toast_title.edit_profile','Edit user profile','admin_portal'),(258,'success_message.profile_update','Profile updated successfully','admin_portal'),(259,'toast_title.rensend_admin_account','Send email','admin_portal'),(260,'success_message.resend_email','Email sent successfully','admin_portal'),(261,'common.user_profile','User Profile','admin_portal'),(262,'common.copyright','Copyright © Fédération Handicap International 2021','admin_portal'),(263,'translations.label.platform','Platform','admin_portal'),(264,'common.key','Key','admin_portal'),(265,'toast_title.update_localization','Edit localization','admin_portal'),(266,'success_message.localization_update','Localization updated successfully','admin_portal'),(267,'error_message.localization_update','Localization cannot be updated','admin_portal'),(268,'questionnaire.approved','approved','admin_portal'),(269,'questionnaire.saved','saved','admin_portal'),(270,'questionnaire.create','Add new Questionnaire','admin_portal'),(271,'questionnaire.new','New Questionnaire','admin_portal'),(272,'questionnaire.edit','Edit Questionnaire','admin_portal'),(273,'questionnaire.title','Title','admin_portal'),(274,'questionnaire.description','Description','admin_portal'),(275,'questionnaire.title.placeholder','Enter title','admin_portal'),(276,'questionnaire.title.required','Please fill in the title','admin_portal'),(277,'questionnaire.description.placeholder','Enter Description','admin_portal'),(278,'questionnaire.description.required','Please fill in the Description','admin_portal'),(279,'questionnaire.new.question','New Question','admin_portal'),(280,'questionnaire.delete_confirmation_title','Questionnaire Deletion','admin_portal'),(281,'question.add.more.answer','Add more answer','admin_portal'),(282,'question.type.checkbox','Checkboxes','admin_portal'),(283,'question.type.multiple_choice','Multiple choice','admin_portal'),(284,'question.type.open_ended_free_text','Open-ended free text','admin_portal'),(285,'question.type.open_ended_numbers_only','Open-ended numbers only','admin_portal'),(286,'question.title.required','Please fill in the title','admin_portal'),(287,'question.answer.description.placeholder','Enter description','admin_portal'),(288,'question.answer.description.required','Please fill in the description','admin_portal'),(289,'questionnaire.question_number','Question ${number}','admin_portal'),(290,'toast_title.update_questionnaire','Edit questionnaire','admin_portal'),(291,'toast_title.new_questionnaire','New questionnaire','admin_portal'),(292,'success_message.questionnaire_create','Questionnaire created successfully','admin_portal'),(293,'common.homepage','Home','admin_portal'),(294,'common.about_us','About Us','admin_portal'),(295,'common.term_condition','Term and Conditions','admin_portal'),(296,'common.acknowledgment','Acknowledgment','admin_portal'),(297,'translation','Translations','admin_portal'),(298,'static_page','Static Pages','admin_portal'),(299,'category','Categories','admin_portal'),(300,'static_page.url','URL path segment','admin_portal'),(301,'static_page.image','Banner Image','admin_portal'),(302,'static_page.title','Page Title','admin_portal'),(303,'home_introduction_text','Introduction Text','admin_portal'),(304,'error.static_page.url','Please fill in url path segment','admin_portal'),(305,'error.static_page.title','Please fill in page title','admin_portal'),(306,'error.home_introduction_text','Please fill in introduction text','admin_portal'),(307,'home_display_quick_stat','Display Quick Stats','admin_portal'),(308,'home_display_feature_resource','Display Featured Resources','admin_portal'),(309,'static_page_partner_content','Partners','admin_portal'),(310,'placeholder.static_page.title','Please fill in page title','admin_portal'),(311,'placeholder.static_page.url','Please fill in url path segment','admin_portal'),(312,'term_and_condition.new','New Term & Condition','admin_portal'),(313,'term_and_condition.edit','Edit Term & Condition','admin_portal'),(314,'term_and_condition.version','Version','admin_portal'),(315,'term_and_condition.content','Content','admin_portal'),(316,'term_and_condition.published_date','Published date','admin_portal'),(317,'term_and_condition.status_published','Published','admin_portal'),(318,'term_and_condition.status_draft','Draft','admin_portal'),(319,'term_and_condition.status_expired','Expired','admin_portal'),(320,'term_and_condition.publish_confirmation_title','Publish Term & Condition','admin_portal'),(321,'term_and_condition.publish_confirmation_message','Are you sure want to publish this Term & Condition?','admin_portal'),(322,'placeholder.term_and_condition.version','Enter version','admin_portal'),(323,'placeholder.term_and_condition.content','Enter content','admin_portal'),(324,'error.term_and_condition.version','Please fill in version','admin_portal'),(325,'error.term_and_condition.content','Please fill in content','admin_portal'),(326,'toast_title.new_term_and_condition','New term & condition','admin_portal'),(327,'toast_title.edit_term_and_condition','Edit term & condition','admin_portal'),(328,'toast_title.publish_term_and_condition','Publish term & condition','admin_portal'),(329,'term_and_condition.view_title','Term & Condition Content','admin_portal'),(330,'term_and_condition.upload_file.max_size','Please select a file smaller than ${size} MB','admin_portal'),(331,'term_and_condition.title','Page Title','admin_portal'),(332,'placeholder.term_and_condition.title','Enter title','admin_portal'),(333,'error.term_and_condition.title','Please fill in title','admin_portal'),(334,'success_message.team_and_condition_publish','Term & Condition published successfully','admin_portal'),(335,'term_and_condition_banner','Term and Condition Banner','admin_portal'),(336,'success_message.term_and_condition_banner.save','Term and condition banner saved successfully','admin_portal'),(337,'toast_title.add_term_and_condition_banner','Term and Condition Banner','admin_portal'),(338,'home_feature_resource','Featured Resources','admin_portal'),(339,'about_us.content','Content','admin_portal'),(340,'common.view','View','admin_portal'),(341,'common.publish','Publish','admin_portal'),(342,'success_message.term_and_condition_update','Term and Condition updated successfully','admin_portal'),(343,'success_message.term_and_condition_add','Term and Condition saved successfully','admin_portal'),(344,'toast_title.update_aboutus','Update About us','admin_portal'),(345,'toast_title.update_homepage','Update Homepage','admin_portal'),(346,'toast_title.update_acknowledgment','Update Acknowledgment','admin_portal'),(347,'toast_title.new_homepage','New Home page','admin_portal'),(348,'toast_title.new_acknowledgment','New Acknowledgment','admin_portal'),(349,'success_message.home_page_update','Home page updated successfully','admin_portal'),(350,'success_message.about_us_update','About us updated successfully','admin_portal'),(351,'success_message.acknowledgment_update','Acknowledgment updated successfully','admin_portal'),(352,'success_message.home_page_add','Homepage added successfully','admin_portal'),(353,'success_message.about_us_add','About us added successfully','admin_portal'),(354,'success_message.acknowledgment_add','Acknowledgment added successfully','admin_portal'),(355,'error.home_featured_resources','Please select a featured resources','admin_portal'),(356,'error.about_us_content','Please fill in content','admin_portal'),(357,'toast_title.new_aboutus','New About us page','admin_portal'),(358,'acknowledgment.hide_contributors','Hide Contributors','admin_portal'),(359,'resources.category.required','Please select category','admin_portal'),(360,'toast_title.edit_translation.reject','Reject translate','admin_portal'),(361,'toast_title.edit_translation.approve','Approve translate','admin_portal'),(362,'success_message.edit_translation.reject','This translate rejected successfully','admin_portal'),(363,'success_message.edit_translation.approve','This translate approved successfully','admin_portal'),(364,'resources.block_editing_message','Block multi-user editing. Currently, it is editing by ${editing_by}.','admin_portal'),(365,'media.hover','To edit the media objects, click on \'Reject\' below','admin_portal'),(366,'frontend','Go to front page','admin_portal'),(367,'home','Home','public_portal'),(368,'library','Library','public_portal'),(369,'contribute','Contribute','public_portal'),(370,'confirm.submission','Confirm Submission','public_portal'),(371,'404','404 Not Found','public_portal'),(372,'common.close','Close','public_portal'),(373,'common.yes','Yes','public_portal'),(374,'common.no','No','public_portal'),(375,'common.welcome','Welcome','public_portal'),(376,'common.copyright','Copyright © Fédération Handicap International 2021','public_portal'),(377,'common.search.label','Search','public_portal'),(378,'common.media','Media','public_portal'),(379,'common.information','Information','public_portal'),(380,'common.categories','Categories','public_portal'),(381,'common.selected','Selected','public_portal'),(382,'common.additional_fields','Additional Fields','public_portal'),(383,'common.add_more_fields','Add More Fields','public_portal'),(384,'common.submit','Submit','public_portal'),(385,'common.add_more','Add More','public_portal'),(386,'common.cancel','Cancel','public_portal'),(387,'common.remove','Remove','public_portal'),(388,'common.default','default','public_portal'),(389,'common.language','Language','public_portal'),(390,'common.show_language.version','Show language version','public_portal'),(391,'common.create','Create','public_portal'),(392,'common.edit','Edit','public_portal'),(393,'common.delete','Delete','public_portal'),(394,'common.save','Save','public_portal'),(395,'common.approve','Approve','public_portal'),(396,'common.reject','Reject','public_portal'),(397,'common.items','Items','public_portal'),(398,'common.first_name','First Name','public_portal'),(399,'common.last_name','Last Name','public_portal'),(400,'common.email','Email','public_portal'),(401,'common.cancel_confirmation_title','Cancel Confirmation','public_portal'),(402,'common.cancel_confirmation_message','Are you sure you want to cancel this submission?','public_portal'),(403,'common.upload_image','Upload Image','public_portal'),(404,'common.type.image','Image','public_portal'),(405,'common.type.archive','Archive','public_portal'),(406,'common.type.media','Media','public_portal'),(407,'common.type.pdf','PDF','public_portal'),(408,'common.type.document','Document','public_portal'),(409,'common.type.spreadsheet','Spreadsheet','public_portal'),(410,'common.type.presentation','Presentation','public_portal'),(411,'common.no_file_translate','No file translated','public_portal'),(412,'common.english','English','public_portal'),(413,'common.oops','Oops!','public_portal'),(414,'common.404.title','404 Not Found','public_portal'),(415,'common.404.description','Sorry, an error has occurred, Requested page not found!','public_portal'),(416,'dashboard.title','Access hundreds of rehabilitation resources...','public_portal'),(417,'dashboard.total_exercises','Total Exercises','public_portal'),(418,'dashboard.total_education_materials','Total Education Materials','public_portal'),(419,'dashboard.total_questionnaires','Total Questionnaires','public_portal'),(420,'banner.search.placeholder','Search for rehabilitation resources','public_portal'),(421,'library.exercises','Exercises','public_portal'),(422,'library.education_materials','Education Materials','public_portal'),(423,'library.questionnaires','Questionnaires','public_portal'),(424,'library.material','Education Material','public_portal'),(425,'exercise.search','Search exercises','public_portal'),(426,'education_material.search','Search materials','public_portal'),(427,'questionnaire.search','Search questionnaires','public_portal'),(428,'exercise.number_of_sets_and_reps','${sets} sets - ${reps} reps','public_portal'),(429,'exercise.learn_more','Learn More','public_portal'),(430,'exercise.title','Title','public_portal'),(431,'exercise.title.placeholder','Enter exercise title','public_portal'),(432,'exercise.sets','Sets','public_portal'),(433,'exercise.reps','Reps','public_portal'),(434,'exercise.sets.placeholder','Enter number of Sets','public_portal'),(435,'exercise.reps.placeholder','Enter number of Reps','public_portal'),(436,'exercise.show_sets_reps','Set default exercise sets and reps','public_portal'),(437,'exercise.additional_field.label','Label','public_portal'),(438,'exercise.additional_field.value','Value','public_portal'),(439,'exercise.additional_field.placeholder.label','Enter label','public_portal'),(440,'exercise.additional_field.placeholder.value','Enter value','public_portal'),(441,'exercise.media_upload.required','Please upload the image','public_portal'),(442,'exercise.title.required','Please fill in the title','public_portal'),(443,'exercise.sets.required','Please fill in the correct number of Sets','public_portal'),(444,'exercise.reps.required','Please fill in the correct number of Reps','public_portal'),(445,'exercise.additional_field.label.required','Please fill in the label','public_portal'),(446,'exercise.additional_field.value.required','Please fill in the value','public_portal'),(447,'exercise.review.modal.title','Please Review Your Submission','public_portal'),(448,'exercise.file_name','File Name','public_portal'),(449,'exercise.file_type','File Type','public_portal'),(450,'exercise.file_size','Size','public_portal'),(451,'exercise.attachment.download','Download','public_portal'),(452,'category.selected','selected','public_portal'),(453,'exercise.attachments','Attachments','public_portal'),(454,'exercise.related_resources','Related Resources','public_portal'),(455,'exercise.edit_translation','Edit Translation','public_portal'),(456,'exercise.create','Add new Exercise','public_portal'),(457,'contribute.submission.enter_your_detail','Enter your details','public_portal'),(458,'contribute.submission.total_selected_resource','Total resource selected to upload: ${number} items','public_portal'),(459,'contribute.agree_term_condition','I agree with Terms and Conditions of this library','public_portal'),(460,'contribute.agree_include_in_contributors_list','I agree to be included in the contributors list in the Acknowledgement page','public_portal'),(461,'contribute.back_to_library','Back to the Library','public_portal'),(462,'contribute.confirm_submission.title','Confirm Submission','public_portal'),(463,'contribute.confirm_submission.text','Thank you for contributing to the library. To complete your submission please click on the confirmation link that was sent to your email.','public_portal'),(464,'contribute.submission_success.title','Submission Confirmed','public_portal'),(465,'contribute.submission_success.text','Your submission has been confirmed and is now being reviewed by the OpenTeleRehab Library Team. Your contributed resource will be available in the library once it gets approved.','public_portal'),(466,'contribute.submission_expired.title','Your Verification Link Has Expired','public_portal'),(467,'contribute.submission_expired.text','We are very sorry, you have taken too long to confirm your submission and the verification link has expired.','public_portal'),(468,'contribute.submission_incorrect.title','Your Verification Link is Incorrect','public_portal'),(469,'contribute.submission_incorrect.text','Sorry, no record exists on our system with this URL.','public_portal'),(470,'success_message.contribute_create','Contribute submission successfully','public_portal'),(471,'education_material.title','Title','public_portal'),(472,'education_material.title.placeholder','Enter education material title','public_portal'),(473,'education_material.title.required','Please fill in the title','public_portal'),(474,'education_material.upload_file','Upload file','public_portal'),(475,'education_material.upload_file.placeholder','Browse a file','public_portal'),(476,'education_material.upload_file.required','Please select a file','public_portal'),(477,'education_material.upload_file.max_size','Please select a file smaller than ${size} MB','public_portal'),(478,'login_link','Click ${link} to login as moderator/admin','public_portal'),(479,'login_here','here','public_portal'),(480,'additional_field.aim','Aim','public_portal'),(481,'additional_field.progressions_variations','Progressions and variations','public_portal'),(482,'additional_field.precautions','Precautions','public_portal'),(483,'error.email','Please fill in the email','public_portal'),(484,'placeholder.email','Enter email','public_portal'),(485,'placeholder.first_name','Enter first name','public_portal'),(486,'placeholder.last_name','Enter last name','public_portal'),(487,'error.first_name','Please fill in first name','public_portal'),(488,'error.last_name','Please fill in last name','public_portal'),(489,'common.no_data','No Data','public_portal'),(490,'questionnaire.title','Title','public_portal'),(491,'questionnaire.title.placeholder','Enter questionnaire title','public_portal'),(492,'questionnaire.title.required','Please fill in the title','public_portal'),(493,'questionnaire.description','Description','public_portal'),(494,'questionnaire.description.placeholder','Enter Description','public_portal'),(495,'questionnaire.question_number','Question ${number}','public_portal'),(496,'question.type.checkbox','Checkboxes','public_portal'),(497,'question.type.multiple_choice','Multiple choice','public_portal'),(498,'question.type.open_ended_free_text','Open-ended free text','public_portal'),(499,'question.type.open_ended_numbers_only','Open-ended numbers only','public_portal'),(500,'question.answer.description.placeholder','Enter description','public_portal'),(501,'question.answer.description.required','Please fill in the description','public_portal'),(502,'questionnaire.new.question','New Question','public_portal'),(503,'question.add.more.answer','Add more answer','public_portal'),(504,'question.title.placeholder','Enter question','public_portal'),(505,'question.title.required','Please fill in the title','public_portal'),(506,'questionnaire.questions','questions','public_portal'),(507,'library.questionnaire','Questionnaire','public_portal'),(508,'questionnaire.number_of_question','No. of Questions','public_portal'),(509,'term_condition','Terms & Conditions','public_portal'),(510,'about_us','About Us','public_portal'),(511,'static_page.partner','Our Partners','public_portal'),(512,'homepage_view_resources','View All Resources','public_portal'),(513,'homepage_contribute_library','Contribute to The library','public_portal'),(514,'contributor.resources_contributed','Resources contributed','public_portal'),(515,'contributor.translations_approved','Translations approved','public_portal'),(516,'acknowledgment','Acknowledgments','public_portal'),(517,'resources.category.required','Please select category','public_portal'),(518,'success_message.file_upload','File uploaded successfully','public_portal'),(519,'error_message.file_upload','Could not upload file','public_portal'),(520,'contribute.title','Contribute to the Library','public_portal'),(521,'contribute.confirm_translation_submission.text','Thank you for contributing translation to the library.','public_portal'),(522,'back_to_be','click ${link} to go back to admin page','public_portal');
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `language_id` int DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (8,'admin@we.co',NULL,NULL,NULL,'2022-10-24 09:45:43','2022-10-24 10:03:25','Admin','User',NULL,1,NULL,'2022-10-24 10:03:25','admin');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 10:04:57
