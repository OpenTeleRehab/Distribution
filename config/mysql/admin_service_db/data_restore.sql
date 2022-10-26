-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: admin_service
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
  `auto_translated` json DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `suggested_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `answer_id` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `suggested_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `auto_translated` json DEFAULT NULL,
  `hi_only` tinyint(1) DEFAULT NULL,
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
-- Table structure for table `clinics`
--

DROP TABLE IF EXISTS `clinics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clinics` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  `region` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `province` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `city` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `therapist_limit` int DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clinics`
--

LOCK TABLES `clinics` WRITE;
/*!40000 ALTER TABLE `clinics` DISABLE KEYS */;
INSERT INTO `clinics` VALUES (1,'Clinic A',1,'Phnom Penh','Phnom Penh','Phnom Penh',10),(2,'Clinic B',1,'Siem Reap',NULL,'Siem Reap',8),(3,'Clinic C',1,'Banteay Meanchey','Banteay Meanchey','Banteay Meanchey',2),(4,'Clinic D',1,'Banteay Meanchey','Banteay Meanchey','Banteay Meanchey',10);
/*!40000 ALTER TABLE `clinics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `color_schemes`
--

DROP TABLE IF EXISTS `color_schemes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `color_schemes` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `primary_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `secondary_color` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `color_schemes`
--

LOCK TABLES `color_schemes` WRITE;
/*!40000 ALTER TABLE `color_schemes` DISABLE KEYS */;
/*!40000 ALTER TABLE `color_schemes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `iso_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_code` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `language_id` int DEFAULT NULL,
  `therapist_limit` int NOT NULL DEFAULT '50',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Cambodia','KH','855',2,30),(2,'Viet Nam','VN','84',3,20);
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `therapist_id` int DEFAULT NULL,
  `file_id` json NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT '1',
  `education_material_id` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `suggested_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `include_feedback` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `get_pain_level` tinyint(1) NOT NULL DEFAULT '0',
  `therapist_id` int DEFAULT NULL,
  `sets` tinyint DEFAULT NULL,
  `reps` tinyint DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT '1',
  `exercise_id` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `suggested_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
-- Table structure for table `favorite_activities_therapists`
--

DROP TABLE IF EXISTS `favorite_activities_therapists`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `favorite_activities_therapists` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `activity_id` int NOT NULL,
  `therapist_id` int NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `is_favorite` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorite_activities_therapists`
--

LOCK TABLES `favorite_activities_therapists` WRITE;
/*!40000 ALTER TABLE `favorite_activities_therapists` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorite_activities_therapists` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `thumbnail` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `size` double DEFAULT '0',
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
-- Table structure for table `global_patients`
--

DROP TABLE IF EXISTS `global_patients`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_patients` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `patient_id` int NOT NULL,
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_of_birth` datetime DEFAULT NULL,
  `identity` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clinic_id` int NOT NULL,
  `country_id` int NOT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `deleted_at` datetime DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_patients`
--

LOCK TABLES `global_patients` WRITE;
/*!40000 ALTER TABLE `global_patients` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_patients` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `global_treatment_plans`
--

DROP TABLE IF EXISTS `global_treatment_plans`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `global_treatment_plans` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `treatment_id` int NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` int DEFAULT NULL,
  `country_id` int DEFAULT NULL,
  `start_date` timestamp NULL DEFAULT NULL,
  `end_date` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `global_treatment_plans`
--

LOCK TABLES `global_treatment_plans` WRITE;
/*!40000 ALTER TABLE `global_treatment_plans` DISABLE KEYS */;
/*!40000 ALTER TABLE `global_treatment_plans` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guidances`
--

DROP TABLE IF EXISTS `guidances`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `guidances` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `content` json NOT NULL,
  `order` int unsigned DEFAULT NULL,
  `title` json NOT NULL,
  `auto_translated` json DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guidances`
--

LOCK TABLES `guidances` WRITE;
/*!40000 ALTER TABLE `guidances` DISABLE KEYS */;
/*!40000 ALTER TABLE `guidances` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `international_classification_diseases`
--

DROP TABLE IF EXISTS `international_classification_diseases`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `international_classification_diseases` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` json NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `international_classification_diseases`
--

LOCK TABLES `international_classification_diseases` WRITE;
/*!40000 ALTER TABLE `international_classification_diseases` DISABLE KEYS */;
/*!40000 ALTER TABLE `international_classification_diseases` ENABLE KEYS */;
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
  `auto_translated` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `languages`
--

LOCK TABLES `languages` WRITE;
/*!40000 ALTER TABLE `languages` DISABLE KEYS */;
INSERT INTO `languages` VALUES (1,'English','en',0,NULL),(2,'Khmer','km',0,NULL),(3,'Tiếng Việt','vi',0,NULL);
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
  `auto_translated` tinyint(1) DEFAULT '0',
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
) ENGINE=InnoDB AUTO_INCREMENT=103 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1),(3,'2019_08_19_000000_create_failed_jobs_table',1),(4,'2020_11_06_032757_add_columns_to_users_table',1),(5,'2020_11_10_064826_alter_users_table',1),(6,'2020_11_18_162838_add_enabled_column_to_users_table',1),(7,'2020_11_19_151812_create_country_table',1),(8,'2020_11_19_152510_create_clinic_table',1),(9,'2020_11_19_152510_create_profession_table',1),(10,'2020_11_24_042318_add_gender_to_users_table',1),(11,'2020_12_01_090816_alter_clinic_table',1),(12,'2020_12_01_090822_alter_country_table',1),(13,'2020_12_02_025140_create_exercises_table',1),(14,'2020_12_04_040256_create_files_table',1),(15,'2020_12_04_063615_create_exercise_files_table',1),(16,'2020_12_15_071238_add_columns_to_countries_table',1),(17,'2020_12_16_040537_add_get_pain_level_to_exercises_table',1),(18,'2020_12_16_064237_add_columns_clinics_table',1),(19,'2020_12_17_014818_add_language_to_users_table',1),(20,'2020_12_17_072641_create_translations_table',1),(21,'2020_12_17_072710_create_localizations_table',1),(22,'2020_12_18_100618_create_languages_table',1),(23,'2020_12_21_081256_change_localizations_table',1),(24,'2020_12_22_080433_add_additional_fields_column_to_exercises_table',1),(25,'2021_01_13_070720_update_translatable_columns_for_exercises_table',1),(26,'2021_01_15_040750_create_term_and_conditions_table',1),(27,'2021_01_20_064508_change_term_and_conditions_table',1),(28,'2021_01_29_074322_add_thumbnail_column_to_files_table',1),(29,'2021_02_03_100042_create_education_materials_table',1),(30,'2021_02_04_080948_alter_education_materials_table',1),(31,'2021_02_04_081026_create_questionnaires_table',1),(32,'2021_02_08_070739_create_questions_table',1),(33,'2021_02_08_070803_create_answers_table',1),(34,'2021_02_09_073104_alter_questionnaires_table',1),(35,'2021_02_09_075232_add_file_id_to_questions_table',1),(36,'2021_02_11_034434_change_clinic_table',1),(37,'2021_02_16_143038_add_order_column_to_questions_table',1),(38,'2021_02_17_041748_add_is_used_column_to_exercises_table',1),(39,'2021_03_01_022529_create_static_pages_table',1),(40,'2021_03_01_092037_change_static_pages_table',1),(41,'2021_03_03_034230_create_categories_table',1),(42,'2021_03_05_024717_create_education_material_categories_table',1),(43,'2021_03_05_024717_create_exercise_categories_table',1),(44,'2021_03_05_075708_add_columns_static_pages_table',1),(45,'2021_03_09_063206_create_questionnaire_categories_table',1),(46,'2021_03_16_090420_add_therapist_to_exercises_table',1),(47,'2021_03_17_101020_add_therapist_id_to_education_materials_table',1),(48,'2021_03_18_024214_favorite_activities_therapists_table',1),(49,'2021_03_19_034119_add_therapist_id_to_questionnaires_table',1),(50,'2021_03_23_064124_create_system_limits_table',1),(51,'2021_03_26_044855_add_last_login_to_users_table',1),(52,'2021_03_26_064900_create_additional_fields_table',1),(53,'2021_03_26_072712_remove_additional_fields_from_exercises_table',1),(54,'2021_03_26_074038_alter_file_id_in_education_materials_table',1),(55,'2021_03_30_020611_add_sets_reps_columns_to_exercises_table',1),(56,'2021_04_07_061118_alter_professions_table',1),(57,'2021_04_19_062540_add_therapist_limit_to_countries_table',1),(58,'2021_04_19_071241_add_therapist_limit_to_clinics_table',1),(59,'2021_04_20_074443_create_privacy_policies_table',1),(60,'2021_04_21_015455_add_rtl_to_languages_table',1),(61,'2021_04_28_095932_create_partner_logos_table',1),(62,'2021_05_31_090933_create_guidances_table',1),(63,'2021_06_02_094420_add_title_guidances_table',1),(64,'2021_06_07_035116_create_international_classification_disease_table',1),(65,'2021_06_08_024652_remove_is_used_clinics_table',1),(66,'2021_06_24_014445_alter_international_classification_diseases_table',1),(67,'2021_09_03_020326_add_soft_deletes_resource_library_tables',1),(68,'2021_11_01_040054_create_global_patients_table',1),(69,'2021_11_03_034406_create_global_treatment_plans_table',1),(70,'2022_01_18_045017_create_color_schemes_table',1),(71,'2022_01_25_064632_create_organizations_table',1),(72,'2022_02_11_043817_add_columns_in_organizations_table',1),(73,'2022_02_21_084105_add_status_and_created_by_to_organizations_table',1),(74,'2022_02_28_090118_add_columns_in_exercises_table',1),(75,'2022_02_28_091144_add_columns_in_education_materials_table',1),(76,'2022_02_28_091445_add_columns_in_questionnaires_table',1),(77,'2022_03_03_065043_add_question_id_column_in_questions_table',1),(78,'2022_03_03_075844_add_answer_id_column_in_answers_table',1),(79,'2022_03_24_070743_remove_columns_in_color_schemes_table',1),(80,'2022_04_05_041500_alter_table_guidance_change_title',1),(81,'2022_08_18_072041_add_size_to_files_table',1),(82,'2022_08_25_081317_add_auto_translated_to_exercises_table',1),(83,'2022_08_25_082547_add_auto_translated_to_education_materials_table',1),(84,'2022_08_25_082557_add_auto_translated_to_questionnaires_table',1),(85,'2022_08_25_083908_add_auto_translated_to_categories_table',1),(86,'2022_08_25_084053_add_auto_translated_to_privacy_policies_table',1),(87,'2022_08_25_084115_add_auto_translated_to_term_and_conditions_table',1),(88,'2022_08_25_084232_add_auto_translated_to_guidances_table',1),(89,'2022_08_25_084304_add_auto_translated_to_static_pages_table',1),(90,'2022_08_26_013938_add_auto_translated_to_localizations_table',1),(91,'2022_08_26_022755_add_auto_translated_to_languages_table',1),(92,'2022_08_26_050258_create_jobs_table',1),(93,'2022_08_30_045205_add_auto_translated_to_additional_fields_table',1),(94,'2022_08_30_065650_add_auto_translated_to_questions_table',1),(95,'2022_08_30_065700_add_auto_translated_to_answers_table',1),(96,'2022_08_31_134539_add_parent_id_and_suggested_lang_to_exercises_table',1),(97,'2022_08_31_134603_add_parent_id_and_suggested_lang_to_additional_fields_table',1),(98,'2022_08_31_140526_add_parent_id_and_suggested_lang_to_education_materials_table',1),(99,'2022_08_31_140533_add_parent_id_and_suggested_lang_to_questionnaires_table',1),(100,'2022_09_01_045036_add_parent_id_and_suggested_lang_to_questions_table',1),(101,'2022_09_01_045044_add_parent_id_and_suggested_lang_to_answers_table',1),(102,'2022_09_14_070536_add_hi_only_to_categories_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `organizations`
--

DROP TABLE IF EXISTS `organizations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `organizations` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sub_domain_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `max_number_of_therapist` int NOT NULL,
  `max_ongoing_treatment_plan` int NOT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_by` int unsigned NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `organizations`
--

LOCK TABLES `organizations` WRITE;
/*!40000 ALTER TABLE `organizations` DISABLE KEYS */;
INSERT INTO `organizations` VALUES (1,'hi','hi','organization-admin@we.co','hi',NULL,'2022-10-20 01:20:49','2022-10-20 02:02:29',50,15,'success',0);
/*!40000 ALTER TABLE `organizations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `partner_logos`
--

DROP TABLE IF EXISTS `partner_logos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `partner_logos` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `file_id` int DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `partner_logos`
--

LOCK TABLES `partner_logos` WRITE;
/*!40000 ALTER TABLE `partner_logos` DISABLE KEYS */;
/*!40000 ALTER TABLE `partner_logos` ENABLE KEYS */;
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
  `auto_translated` json DEFAULT NULL,
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
-- Table structure for table `professions`
--

DROP TABLE IF EXISTS `professions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `professions` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `professions`
--

LOCK TABLES `professions` WRITE;
/*!40000 ALTER TABLE `professions` DISABLE KEYS */;
INSERT INTO `professions` VALUES (1,'Profession 011',1),(2,'Profession 022',1);
/*!40000 ALTER TABLE `professions` ENABLE KEYS */;
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
  `is_used` tinyint(1) NOT NULL DEFAULT '0',
  `therapist_id` int DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `global` tinyint(1) NOT NULL DEFAULT '1',
  `questionnaire_id` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `suggested_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `file_id` int DEFAULT NULL,
  `order` int NOT NULL,
  `question_id` int DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
  `parent_id` int DEFAULT NULL,
  `suggested_lang` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
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
  `platform` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `url_path_segment` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `private` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `background_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `text_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `auto_translated` json DEFAULT NULL,
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
-- Table structure for table `system_limits`
--

DROP TABLE IF EXISTS `system_limits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `system_limits` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `content_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `system_limits_content_type_unique` (`content_type`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `system_limits`
--

LOCK TABLES `system_limits` WRITE;
/*!40000 ALTER TABLE `system_limits` DISABLE KEYS */;
INSERT INTO `system_limits` VALUES (1,'therapist_content_limit',20),(2,'number_of_ongoing_treatment_per_therapist',15),(3,'pain_threshold_limit',8);
/*!40000 ALTER TABLE `system_limits` ENABLE KEYS */;
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
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `auto_translated` json DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=1526 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
INSERT INTO `translations` VALUES (1,'common.welcome','Welcome','admin_portal'),(2,'common.cancel','Cancel','admin_portal'),(3,'common.create','Create','admin_portal'),(4,'common.yes','Yes','admin_portal'),(5,'common.no','No','admin_portal'),(6,'common.email','Email','admin_portal'),(7,'common.first_name','First Name','admin_portal'),(8,'common.last_name','Last Name','admin_portal'),(9,'common.country','Country','admin_portal'),(10,'common.clinic','Clinic','admin_portal'),(11,'common.edit_info','Edit info','admin_portal'),(12,'common.deactivate','Deactivate','admin_portal'),(13,'common.delete','Delete','admin_portal'),(14,'common.actions','Actions','admin_portal'),(15,'common.save','Save','admin_portal'),(16,'common.filters','Filters','admin_portal'),(17,'common.columns','Columns','admin_portal'),(18,'common.search.placeholder','Search','admin_portal'),(19,'common.active','Active','admin_portal'),(20,'common.inactive','Inactive','admin_portal'),(21,'common.all','All','admin_portal'),(22,'common.clear','Clear','admin_portal'),(23,'common.apply','Apply','admin_portal'),(24,'common.timerange.placeholder','Select Timerange','admin_portal'),(25,'common.back','Back','admin_portal'),(26,'common.edit','Edit','admin_portal'),(27,'common.login','Login','admin_portal'),(28,'common.forgot_password','Forgot your password?','admin_portal'),(29,'common.password','Password','admin_portal'),(30,'common.therapist_portal','Therapist Portal','admin_portal'),(31,'common.admin_portal','Admin Portal','admin_portal'),(32,'common.password-recovery','Password Recovery','admin_portal'),(33,'common.recovery-password-instruction','Please enter your email address. You will receive a reset password instruction via email.','admin_portal'),(34,'common.recover_password','Recover Password','admin_portal'),(35,'common.update-password','Update Password','admin_portal'),(36,'common.new-password','New Password','admin_portal'),(37,'common.resend_mail','Resend Mail','admin_portal'),(38,'placeholder.new-password','Enter new password','admin_portal'),(39,'common.confirm-password','Confirm Password','admin_portal'),(40,'placeholder.confirm-password','Enter confirm password','admin_portal'),(41,'common.submit','Submit','admin_portal'),(42,'common.information','Information','admin_portal'),(43,'common.back-to-application','Back to application','admin_portal'),(44,'common.proceed-with-action','Proceed with action','admin_portal'),(45,'common.error','Error','admin_portal'),(46,'common.new_content','New Content','admin_portal'),(47,'common.delete_confirmation_message','Are you sure want to delete this record?','admin_portal'),(48,'common.transfer_confirmation_message','Do you want to transfer this therapist\'s patient(s) to other therapist ?','admin_portal'),(49,'common.switchStatus_confirmation_message','Are you sure want to switch the status of this record?','admin_portal'),(50,'common.total_edit_translations','Available suggestions','admin_portal'),(51,'common.next','Next','admin_portal'),(52,'common.previous','Previous','admin_portal'),(53,'common.approve','Approve','admin_portal'),(54,'common.reject','Reject','admin_portal'),(55,'toast_title.translation.approve','Approve Translation','admin_portal'),(56,'toast_title.translation.reject','Reject Translation','admin_portal'),(57,'success_message.translation.approve','Translation approved successfully','admin_portal'),(58,'error_message.translation.approve','Translation cannot be approved','admin_portal'),(59,'success_message.translation.reject','Translation rejected successfully','admin_portal'),(60,'error_message.translation.reject','Translation cannot be rejected','admin_portal'),(61,'user.delete_confirmation_title','User deletion','admin_portal'),(62,'translator.delete_confirmation_title','Translator deletion','admin_portal'),(63,'clinic.delete_confirmation_title','Clinic deletion','admin_portal'),(64,'country.delete_confirmation_title','Country deletion','admin_portal'),(65,'language.delete_confirmation_title','Language deletion','admin_portal'),(66,'questionnaire.delete_confirmation_title','Questionnaire deletion','admin_portal'),(67,'questionnaire.update_used_questionnaire_confirmation_title','Questionnaire update','admin_portal'),(68,'questionnaire.update_used_questionnaire_confirmation_message','Attention, any update will apply to questionnaires currently and previously shared with patients. Are you still want to update ?','admin_portal'),(69,'therapist.delete_confirmation_title','Therapist deletion','admin_portal'),(70,'therapist.transfer_confirmation_title','Patient transfer','admin_portal'),(71,'common.no_data','No Data','admin_portal'),(72,'common.paginate.show_number_of_records','Show ${recordStart} to ${recordEnd} of ${totalCount} items','admin_portal'),(73,'common.paginate.per_page','per page','admin_portal'),(74,'common.limit_treatment','Treatment Limit(Default:${defaultLimitedPatients})','admin_portal'),(75,'common.on_going.treatment','On-going Treatments: ${onGoingPatients}','admin_portal'),(76,'common.super_admin','Super Admin','admin_portal'),(77,'common.organization_admin','Organization Admin','admin_portal'),(78,'common.global_admin','Global Admin','admin_portal'),(79,'common.country_admin','Country Admin','admin_portal'),(80,'common.clinic_admin','Clinic Admin','admin_portal'),(81,'common.on_going.treatment_let','On-going Treatment Limit','admin_portal'),(82,'common.assigned_patient','Assigned Patient','admin_portal'),(83,'common.language','Language','admin_portal'),(84,'common.remove','Remove','admin_portal'),(85,'common.global_admin.management','Organization admins can manage Organization Admins/ Country Admins, create and upload the content (exercises and questionnaires).','admin_portal'),(86,'common.country_admin.management','Country Admins manage therapist of a country','admin_portal'),(87,'common.clinic_admin.management','Country Admins manage therapist of a clinic','admin_portal'),(88,'common.status','Status','admin_portal'),(89,'common.last_login','Last Login','admin_portal'),(90,'common.action','Actions','admin_portal'),(91,'common.show_language.version','Showing language version','admin_portal'),(92,'common.category','Category','admin_portal'),(93,'common.id','ID','admin_portal'),(94,'common.name','Name','admin_portal'),(95,'common.code','Code','admin_portal'),(96,'common.key','Key','admin_portal'),(97,'common.english','English','admin_portal'),(98,'common.iso_code','ISO Code','admin_portal'),(99,'common.phone_code','Phone Code','admin_portal'),(100,'common.country.iso_code','Country ISO Code','admin_portal'),(101,'common.translation_suggested','Translation Suggested','admin_portal'),(102,'common.region.state','Region / Stage','admin_portal'),(103,'common.province','Province','admin_portal'),(104,'common.city','City','admin_portal'),(105,'common.profession','Profession','admin_portal'),(106,'common.default','default','admin_portal'),(107,'common.disabled','Disabled','admin_portal'),(108,'common.enabled','Enabled','admin_portal'),(109,'common.publish','Publish','admin_portal'),(110,'common.therapist','Therapist','admin_portal'),(111,'common.transfer','Transfer','admin_portal'),(112,'common.auto_translate','Auto Translate','admin_portal'),(113,'common.auto_translate_confirmation_message','Are you sure want to auto translate this language?','admin_portal'),(114,'translator','Translator','admin_portal'),(115,'patient_transfer_therapist','Transfer \'${patientName}\' to below therapist:','admin_portal'),(116,'profile.current_password','Current Passwords','admin_portal'),(117,'profile.new_password','New Passwords','admin_portal'),(118,'profile.confirm_password','Confirm New Passwords','admin_portal'),(119,'portal.name','Admin Portal','admin_portal'),(120,'home','Home','admin_portal'),(121,'login','Login','admin_portal'),(122,'dashboard','Dashboard','admin_portal'),(123,'not_found_page','404 page','admin_portal'),(124,'category','Categories','admin_portal'),(125,'category.category','Category','admin_portal'),(126,'category.sub_category','Subcategory','admin_portal'),(127,'category.title','Category Title','admin_portal'),(128,'category.category_value','Category Value','admin_portal'),(129,'category.category_value_hint','Use semicolon ( ; ) between values to separate','admin_portal'),(130,'category.new_exercise','New Exercise Category Value','admin_portal'),(131,'category.edit_exercise','Edit Exercise Category','admin_portal'),(132,'category.new_education','New Education Material Category Value','admin_portal'),(133,'category.edit_education','Edit Education Material Category','admin_portal'),(134,'category.new_questionnaire','New Questionnaire Category Value','admin_portal'),(135,'category.edit_questionnaire','Edit Questionnaire Category','admin_portal'),(136,'category.number_of_categories','${number} categories','admin_portal'),(137,'category.number_of_sub_categories','${number} sub-categories','admin_portal'),(138,'category.search','Search category','admin_portal'),(139,'category.search_sub_category','Search sub-category','admin_portal'),(140,'category.selected','selected','admin_portal'),(141,'category.not_inused','Not-inused','admin_portal'),(142,'category.hi_only','HI only','admin_portal'),(143,'category.delete_confirmation_title','Category deletion','admin_portal'),(144,'error.category','Please fill in the title','admin_portal'),(145,'error.current_category','Please choose category','admin_portal'),(146,'error.category_value','Please fill in the titles','admin_portal'),(147,'service_setup','Services Setup','admin_portal'),(148,'therapist','Therapists','admin_portal'),(149,'profile.change_password','Edit password','admin_portal'),(150,'setting','Settings','admin_portal'),(151,'setting.countries','Countries','admin_portal'),(152,'setting.translations','Translations','admin_portal'),(153,'setting.term_and_conditions','Term & Conditions','admin_portal'),(154,'setting.privacy_policy','Privacy Policy','admin_portal'),(155,'setting.system_limits','System Limits','admin_portal'),(156,'setting.clinics','Clinics','admin_portal'),(157,'setting.professions','Professions','admin_portal'),(158,'setting.languages','Languages','admin_portal'),(159,'setting.static_page','Static Pages','admin_portal'),(160,'setting.guidance_page','Guidance Pages','admin_portal'),(161,'organization_admin','Organization Admin','admin_portal'),(162,'global_admin','Global Admin','admin_portal'),(163,'country_admin','Country Admin','admin_portal'),(164,'clinic_admin','Clinic Admin','admin_portal'),(165,'therapist.management','Therapist Management','admin_portal'),(166,'therapist.list','Therapist List','admin_portal'),(167,'patient.list','Patient List','admin_portal'),(168,'therapist.new','New Therapist','admin_portal'),(169,'guidance_page.new','New Guidance page','admin_portal'),(170,'guidance_page.edit','Edit Guidance page','admin_portal'),(171,'therapist.edit','Edit Therapist','admin_portal'),(172,'service_setup.exercises','Exercises','admin_portal'),(173,'service_setup.education_materials','Education Materials','admin_portal'),(174,'service_setup.questionnaires','Questionnaires','admin_portal'),(175,'questionnaire.question_number','Question ${number}','admin_portal'),(176,'questionnaire.number_of_question','No. of Questions','admin_portal'),(177,'exercise.search','Search exercises','admin_portal'),(178,'education_material.search','Search materials','admin_portal'),(179,'questionnaire.search','Search questionnaires','admin_portal'),(180,'exercise.create','Add new Exercise','admin_portal'),(181,'exercise.edit','Edit Exercise','admin_portal'),(182,'exercise.new','New Exercise','admin_portal'),(183,'exercise.single_upload','Upload single exercise','admin_portal'),(184,'exercise.bulk_upload','Upload bulk exercises','admin_portal'),(185,'exercise.media','MEDIA','admin_portal'),(186,'exercise.information','INFORMATION','admin_portal'),(187,'exercise.title','Title','admin_portal'),(188,'exercise.title.placeholder','Enter title','admin_portal'),(189,'exercise.title.required','Please fill in the title','admin_portal'),(190,'exercise.set_efault_exercise_sets_and_reps','Set default exercise sets and reps','admin_portal'),(191,'exercise.sets','Sets','admin_portal'),(192,'exercise.sets.placeholder','Enter number of Sets','admin_portal'),(193,'exercise.sets.required','Please fill in the correct number of Sets','admin_portal'),(194,'exercise.reps','Reps','admin_portal'),(195,'exercise.reps.placeholder','Enter number of Reps','admin_portal'),(196,'exercise.reps.required','Please fill in the correct number of Reps','admin_portal'),(197,'exercise.number_of_sets_and_reps','${sets} sets - ${reps} reps','admin_portal'),(198,'exercise.include_collecting_feedback','Collect number of sets and reps completed','admin_portal'),(199,'exercise.get_pain_level_feedback','Get pain level feedback','admin_portal'),(200,'exercise.delete_confirmation_title','Exercise deletion','admin_portal'),(201,'user.switchStatus_confirmation_title','Switch user status','admin_portal'),(202,'translator.switchStatus_confirmation_title','Switch translator status','admin_portal'),(203,'exercise.media_upload.required','Please upload the image','admin_portal'),(204,'exercise.additional_field.add_more_field','Add more field','admin_portal'),(205,'exercise.additional_field.label','Label','admin_portal'),(206,'exercise.additional_field.value','Value','admin_portal'),(207,'exercise.additional_field.label.required','Please fill in the label','admin_portal'),(208,'exercise.additional_field.value.required','Please fill in the value','admin_portal'),(209,'exercise.additional_field.placeholder.label','Enter label','admin_portal'),(210,'exercise.additional_field.placeholder.value','Enter value','admin_portal'),(211,'exercise.additional_field.placeholder.description','Enter description','admin_portal'),(212,'exercise.media_upload','Upload image','admin_portal'),(213,'exercise.download','Download Exercises','admin_portal'),(214,'exercise.bulk_upload.instruction','Download template, then input the content and upload','admin_portal'),(215,'exercise.bulk_upload.file.placeholder','Browse a file','admin_portal'),(216,'exercise.bulk_upload.file.required','Please select a file','admin_portal'),(217,'exercise.bulk_upload.file.max_size','Please select a file smaller than ${size} MB','admin_portal'),(218,'exercise.bulk_upload.download_template','Download template','admin_portal'),(219,'exercise.bulk_upload.number_of_new_exercises','${number} exercise(s) have been added.','admin_portal'),(220,'exercise.bulk_upload.number_of_updated_exercises','${number} exercise(s) have been updated.','admin_portal'),(221,'exercise.bulk_upload.back_to_exercises','Back to Exercises','admin_portal'),(222,'exercise.bulk_upload.upload_exercises','Upload Exercises','admin_portal'),(223,'education_material.create','Add new Education Material','admin_portal'),(224,'education_material.new','New Education Material','admin_portal'),(225,'education_material.edit','Edit Education Material','admin_portal'),(226,'education_material.title','Title','admin_portal'),(227,'education_material.type','Type','admin_portal'),(228,'education_material.title.placeholder','Enter title','admin_portal'),(229,'education_material.title.required','Please fill in the title','admin_portal'),(230,'education_material.upload_file','Upload file','admin_portal'),(231,'education_material.upload_file.placeholder','Browse a file','admin_portal'),(232,'education_material.upload_file.required','Please select a file','admin_portal'),(233,'education_material.upload_file.max_size','Please select a file smaller than ${size} MB','admin_portal'),(234,'education.delete_confirmation_title','Education material deletion','admin_portal'),(235,'questionnaire.create','Add new Questionnaire','admin_portal'),(236,'questionnaire.new','New Questionnaire','admin_portal'),(237,'questionnaire.edit','Edit Questionnaire','admin_portal'),(238,'questionnaire.title','Title','admin_portal'),(239,'questionnaire.description','Description','admin_portal'),(240,'questionnaire.title.placeholder','Enter title','admin_portal'),(241,'questionnaire.title.required','Please fill in the title','admin_portal'),(242,'questionnaire.description.placeholder','Enter Description','admin_portal'),(243,'questionnaire.description.required','Please fill in the Description','admin_portal'),(244,'questionnaire.new.question','New Question','admin_portal'),(245,'question.add.more.answer','Add more answer','admin_portal'),(246,'question.type.checkbox','Checkboxes','admin_portal'),(247,'question.type.multiple_choice','Multiple choice','admin_portal'),(248,'question.type.open_ended_free_text','Open-ended free text','admin_portal'),(249,'question.type.open_ended_numbers_only','Open-ended numbers only','admin_portal'),(250,'question.title.required','Please fill in the title','admin_portal'),(251,'question.answer.description.placeholder','Enter description','admin_portal'),(252,'question.answer.description.required','Please fill in the description','admin_portal'),(253,'question.media_upload','Upload image','admin_portal'),(254,'admin','Admins','admin_portal'),(255,'admin.management','Admin Management','admin_portal'),(256,'admin.new','New Admin','admin_portal'),(257,'admin.edit','Edit Admin','admin_portal'),(258,'admin.hint_message_global_admin','Organization admins can manage Organization Admins/ Country Admin, create and upload the content (exercises and questionnaires).','admin_portal'),(259,'admin.hint_message_country_admin','Country admins manage therapist of a country.','admin_portal'),(260,'admin.hint_message_clinic_admin','Clinic admins manage therapist of a clinics.','admin_portal'),(261,'admin.information','Profile Information','admin_portal'),(262,'admin.password','Passwords','admin_portal'),(263,'translator.new','New Translator','admin_portal'),(264,'translator.management','Translator Management','admin_portal'),(265,'translator.edit','Edit Translator','admin_portal'),(266,'personal','Personal','admin_portal'),(267,'profile','Profile','admin_portal'),(268,'profile.setting','Settings Privacy','admin_portal'),(269,'gender','Gender','admin_portal'),(270,'male','Male','admin_portal'),(271,'female','Female','admin_portal'),(272,'other','Others','admin_portal'),(273,'logout','Logout','admin_portal'),(274,'logout.confirmation','Logout Confirmation','admin_portal'),(275,'logout.message','Are you sure to logout?','admin_portal'),(276,'logout.cancel','No','admin_portal'),(277,'logout.confirm','Yes','admin_portal'),(278,'profile.information','Profile Information','admin_portal'),(279,'profile.password','Password','admin_portal'),(280,'placeholder.last_name','Enter last name','admin_portal'),(281,'placeholder.therapist','Please select a therapist','admin_portal'),(282,'placeholder.first_name','Enter first name','admin_portal'),(283,'placeholder.clinic','Please select a clinic','admin_portal'),(284,'placeholder.country','Please select a country','admin_portal'),(285,'placeholder.email','Enter email','admin_portal'),(286,'placeholder.limit_patient','Enter Limit Patient','admin_portal'),(287,'placeholder.profession','Please select a profession','admin_portal'),(288,'placeholder.language','Please select a language','admin_portal'),(289,'placeholder.birth_date','Enter Birth Date','admin_portal'),(290,'placeholder.institution','Enter Institution','admin_portal'),(291,'placeholder.gender','Please select a gender','admin_portal'),(292,'placeholder.category_item','Category Item','admin_portal'),(293,'placeholder.category','Please choose category','admin_portal'),(294,'placeholder.enter_category_name','Enter category name','admin_portal'),(295,'placeholder.enter_category_value','Enter category value','admin_portal'),(296,'placeholder.password','Enter password','admin_portal'),(297,'error.email','Please fill in the email','admin_portal'),(298,'error.first_name','Please fill first name','admin_portal'),(299,'error.last_name','Please fill last name','admin_portal'),(300,'error.gender','Please select a gender','admin_portal'),(301,'error.country','Please select a country','admin_portal'),(302,'error.country.in_used','Country has been used','admin_portal'),(303,'error.clinic','Please select a clinic','admin_portal'),(304,'error.limit_patient','Please fill limit patient','admin_portal'),(305,'error.limit_patient.lessthan','The treatment limit can not set less than total on-going treatment plans of the therapist','admin_portal'),(306,'toast_title.new_admin_account','New admin account','admin_portal'),(307,'toast_title.new_translator_account','New translator account','admin_portal'),(308,'toast_title.edit_admin_account','Edit admin account','admin_portal'),(309,'toast_title.edit_translator_account','Edit translator account','admin_portal'),(310,'toast_title.edit_profile','Edit user profile','admin_portal'),(311,'toast_title.edit_therapist_account','Edit therapist account','admin_portal'),(312,'toast_title.error_message','Error message','admin_portal'),(313,'toast_title.change_password','Change password','admin_portal'),(314,'toast_title.new_exercise','New exercise','admin_portal'),(315,'toast_title.update_exercise','Edit exercise','admin_portal'),(316,'toast_title.delete_exercise','Delete exercise','admin_portal'),(317,'toast_title.delete_profession','Delete profession','admin_portal'),(318,'toast_title.new_education_material','New education material','admin_portal'),(319,'toast_title.update_education_material','Edit education material','admin_portal'),(320,'toast_title.delete_education_material','Delete education material','admin_portal'),(321,'toast_title.new_questionnaire','New questionnaire','admin_portal'),(322,'toast_title.update_questionnaire','Edit questionnaire','admin_portal'),(323,'toast_title.update_localization','Edit localization','admin_portal'),(324,'toast_title.new_category','New category','admin_portal'),(325,'toast_title.edit_category','Edit category','admin_portal'),(326,'toast_title.delete_category','Delete category','admin_portal'),(327,'toast_title.upload_exercises','Upload exercises','admin_portal'),(328,'error.confirm_password_required','Please fill in confirm new password','admin_portal'),(329,'error.current_password','Please fill in the current password','admin_portal'),(330,'error.new_password','Please fill in the new password','admin_portal'),(331,'error.confirm_password','Password does not match','admin_portal'),(332,'error.new_password_validation','Passwords must be at least ${passwordLength} characters long, contains both uppercase and lowercase letters, at least one number and one symbol.','admin_portal'),(333,'error.new_password_validation_exist','The new password can not be the same as the current password','admin_portal'),(334,'error_message.email_exists','Email already exists','admin_portal'),(335,'success_message.exercise_bulk_upload','Exercises uploaded successfully','admin_portal'),(336,'success_message.resend_email','Email sent successfully','admin_portal'),(337,'error_message.resend_email','Email sending failed','admin_portal'),(338,'success_message.user_add','User created successfully','admin_portal'),(339,'success_message.translator_add','Translator created successfully','admin_portal'),(340,'success_message.user_update','User updated successfully','admin_portal'),(341,'success_message.translator_update','Translator updated successfully','admin_portal'),(342,'success_message.guidance.update','Guidance page updated successfully','admin_portal'),(343,'success_message.guidance.delete','Guidance page deleted successfully','admin_portal'),(344,'error_message.guidance.delete','Guidance page deleted failed','admin_portal'),(345,'toast_title.delete_admin_account','Delete user','admin_portal'),(346,'toast_title.delete_translator_account','Delete translator','admin_portal'),(347,'toast_title.delete_questionnaire','Delete questionnaire','admin_portal'),(348,'toast_title.delete_therapist_account','Delete therapist','admin_portal'),(349,'toast_title.update_guidance_page','Update Guidance page','admin_portal'),(350,'toast_title.new_guidance_page','New Guidance page','admin_portal'),(351,'toast_title.delete_guidance_page','Delete Guidance page','admin_portal'),(352,'toast_title.rensend_admin_account','Send email','admin_portal'),(353,'toast_title.rensend_translator_account','Send email','admin_portal'),(354,'success_message.user_delete','User deleted successfully','admin_portal'),(355,'success_message.translator_delete','Translator deleted successfully','admin_portal'),(356,'error_message.user_delete','User deletion failed','admin_portal'),(357,'error_message.translator_delete','Translator deletion failed','admin_portal'),(358,'success_message.therapist_delete','Therapist deleted successfully','admin_portal'),(359,'error_message.translator_update','Translator cannot be updated','admin_portal'),(360,'error_message.therapist_delete','Therapist deletion failed','admin_portal'),(361,'success_message.profile_update','Profile updated successfully','admin_portal'),(362,'success_message.update_profile_success','Profile updated successfully','admin_portal'),(363,'success_message.change_password_success','Password changed successfully','admin_portal'),(364,'success_message.exercise_create','Exercise created successfully','admin_portal'),(365,'success_message.exercise_delete','Exercise deleted successfully','admin_portal'),(366,'success_message.exercise_update','Exercise updated successfully','admin_portal'),(367,'error_message.exercise_update','Exercise cannot be updated','admin_portal'),(368,'error_message.exercise_bulk_upload_title_required','Field \'title\' is required at row \'${row}\' on sheet \'${sheet}\'','admin_portal'),(369,'success_message.education_material_create','Education material created successfully','admin_portal'),(370,'success_message.education_material_delete','Education material deleted successfully','admin_portal'),(371,'success_message.education_material_update','Education material updated successfully','admin_portal'),(372,'success_message.questionnaire_create','Questionnaire created successfully','admin_portal'),(373,'success_message.questionnaire_update','Questionnaire updated successfully','admin_portal'),(374,'success_message.questionnaire_delete','Questionnaire deleted successfully','admin_portal'),(375,'success_message.localization_update','Localization updated successfully','admin_portal'),(376,'success_message.profession_update','Profession updated successfully','admin_portal'),(377,'success_message.profession_create','Profession created successfully','admin_portal'),(378,'success_message.profession_delete','Profession deleted successfully','admin_portal'),(379,'error_message.profession_delete','Profession cannot be deleted','admin_portal'),(380,'profession.delete_confirmation_title','Profession deletion','admin_portal'),(381,'error_message.profession_exists','Profession already exist','admin_portal'),(382,'toast_title.new_profession','New profession','admin_portal'),(383,'toast_title.edit_profession','Edit profession','admin_portal'),(384,'success_message.category_add','Category created successfully','admin_portal'),(385,'success_message.category_update','Category updated successfully','admin_portal'),(386,'success_message.category_delete','Category deleted successfully','admin_portal'),(387,'error_message.wrong_password','Old password is not valid','admin_portal'),(388,'error_message.cannot_change_password','Password is unable to change','admin_portal'),(389,'error_message.user_add','User cannot be created','admin_portal'),(390,'error_message.translator_add','Translator cannot be created','admin_portal'),(391,'success_message.guidance_add','Guidance page created successfully','admin_portal'),(392,'error_message.exercise_create','Exercise cannot be created','admin_portal'),(393,'error_message.exercise_delete','Exercise cannot be deleted','admin_portal'),(394,'error_message.education_material_create','Education material cannot be created','admin_portal'),(395,'error_message.education_material_delete','Education material cannot be deleted','admin_portal'),(396,'error_message.questionnaire_delete','Questionnaire cannot be deleted','admin_portal'),(397,'error_message.clinic_delete','Clinic cannot be deleted','admin_portal'),(398,'error_message.country_delete','Country cannot be deleted','admin_portal'),(399,'error_message.language_delete','Language cannot be deleted','admin_portal'),(400,'error_message.questionnaire_create','Questionnaire cannot be created','admin_portal'),(401,'error_message.localization_update','Localization cannot be updated','admin_portal'),(402,'error_message.category_delete','Category cannot be deleted','admin_portal'),(403,'error_message.exercise_bulk_upload','Exercises cannot be uploaded','admin_portal'),(404,'country.new','New Country','admin_portal'),(405,'profession.new','New Profession','admin_portal'),(406,'profession.edit','Edit Profession','admin_portal'),(407,'error.profession.name','Please fill in name','admin_portal'),(408,'profession.name','Name','admin_portal'),(409,'placeholder.profession.name','Enter name','admin_portal'),(410,'country.edit','Edit Country','admin_portal'),(411,'country.name','Name','admin_portal'),(412,'country.iso_code','ISO Code','admin_portal'),(413,'country.phone_code','Phone Code','admin_portal'),(414,'common.therapist_limit','Therapist Limit','admin_portal'),(415,'term_and_condition.new','New Term & Condition','admin_portal'),(416,'privacy_policy.new','New Privacy Policy','admin_portal'),(417,'term_and_condition.edit','Edit Term & Condition','admin_portal'),(418,'term_and_condition.version','Version','admin_portal'),(419,'privacy_policy.version','Version','admin_portal'),(420,'term_and_condition.content','Content','admin_portal'),(421,'privacy_policy.content','Content','admin_portal'),(422,'term_and_condition.published_date','Published date','admin_portal'),(423,'privacy_policy.published_date','Published date','admin_portal'),(424,'term_and_condition.status_published','Published','admin_portal'),(425,'privacy_policy.status_published','Published','admin_portal'),(426,'term_and_condition.status_draft','Draft','admin_portal'),(427,'privacy_policy.status_draft','Draft','admin_portal'),(428,'term_and_condition.status_expired','Expired','admin_portal'),(429,'privacy_policy.status_expired','Expired','admin_portal'),(430,'term_and_condition.publish_confirmation_title','Publish Term & Condition','admin_portal'),(431,'privacy_policy.publish_confirmation_title','Publish Privacy Policy','admin_portal'),(432,'term_and_condition.publish_confirmation_message','Are you sure want to publish this Term & Condition?','admin_portal'),(433,'privacy_policy.publish_confirmation_message','Are you sure want to publish this Privacy Policy?','admin_portal'),(434,'placeholder.term_and_condition.version','Enter version','admin_portal'),(435,'placeholder.privacy_policy.version','Enter version','admin_portal'),(436,'placeholder.term_and_condition.content','Enter content','admin_portal'),(437,'error.term_and_condition.version','Please fill in version','admin_portal'),(438,'error.term_and_condition.content','Please fill in content','admin_portal'),(439,'error.privacy_policy.version','Please fill in version','admin_portal'),(440,'error.privacy_policy.content','Please fill in content','admin_portal'),(441,'success_message.team_and_condition_add','Term & Condition created successfully','admin_portal'),(442,'success_message.privacy_policy_add','Privacy Policy created successfully','admin_portal'),(443,'success_message.team_and_condition_update','Term & Condition updated successfully','admin_portal'),(444,'success_message.privacy_policy_update','Privacy Policy updated successfully','admin_portal'),(445,'success_message.team_and_condition_publish','Term & Condition published successfully','admin_portal'),(446,'success_message.privacy_policy_publish','Privacy Policy published successfully','admin_portal'),(447,'placeholder.country.name','Enter name','admin_portal'),(448,'placeholder.country.iso_code','Enter iso code','admin_portal'),(449,'placeholder.country.phone_code','Enter phone code','admin_portal'),(450,'placeholder.country.therapist_limit','Enter therapist limit','admin_portal'),(451,'error.country.iso_code','Please fill in iso code','admin_portal'),(452,'error.country.name','Please fill in name','admin_portal'),(453,'error.country.phone_code','Please fill in phone code','admin_portal'),(454,'error.therapist','Please select a therapist','admin_portal'),(455,'error.country.phone_code.format','Phone code must be in number only','admin_portal'),(456,'error.country.therapist_limit.format','Therapist limit must be in number only','admin_portal'),(457,'error.country.therapist_limit','Please fill in therapist limit','admin_portal'),(458,'error.country.therapist_limit.reached','The therapist limit has been reached','admin_portal'),(459,'error.country.therapist_limit.lessthan.therapist','The therapist limit can not set less than total therapists of the clinic','admin_portal'),(460,'error.country.therapist_limit.lessthan.theraist_limit_clinic','The therapist limit can not set less than total therapist limit of country\'s clinic','admin_portal'),(461,'error.country.iso_code.format','Iso code must be in 2 digits','admin_portal'),(462,'error_message.country_exists','Country already exist','admin_portal'),(463,'success_message.country_add','Country created successfully','admin_portal'),(464,'success_message.country_update','Country updated successfully','admin_portal'),(465,'toast_title.new_country','New country','admin_portal'),(466,'toast_title.edit_country','Edit country','admin_portal'),(467,'toast_title.new_term_and_condition','New term & condition','admin_portal'),(468,'toast_title.new_privacy_policy','New privacy policy','admin_portal'),(469,'toast_title.edit_term_and_condition','Edit term & condition','admin_portal'),(470,'toast_title.edit_privacy_policy','Edit privacy policy','admin_portal'),(471,'toast_title.publish_term_and_condition','Publish term & condition','admin_portal'),(472,'toast_title.publish_privacy_policy','Publish privacy policy','admin_portal'),(473,'clinic.new','New Clinic','admin_portal'),(474,'clinic.edit','Edit Clinic','admin_portal'),(475,'clinic.province','Province','admin_portal'),(476,'clinic.name','Name','admin_portal'),(477,'clinic.region','Region','admin_portal'),(478,'clinic.city','City','admin_portal'),(479,'clinic.country.iso_code','Country\'s iso code','admin_portal'),(480,'placeholder.clinic.name','Enter name','admin_portal'),(481,'placeholder.clinic.region','Enter region','admin_portal'),(482,'placeholder.clinic.province','Enter province','admin_portal'),(483,'placeholder.clinic.city','Enter city','admin_portal'),(484,'error.clinic.region','Please fill in region','admin_portal'),(485,'error.clinic.city','Please fill in city','admin_portal'),(486,'toast_title.new_clinic','New clinic','admin_portal'),(487,'toast_title.edit_clinic','Edit clinic','admin_portal'),(488,'success_message.clinic_add','Clinic created successfully','admin_portal'),(489,'success_message.clinic_update','Clinic updated successfully','admin_portal'),(490,'toast_title.delete_clinic','Delete clinic','admin_portal'),(491,'toast_title.delete_country','Delete country','admin_portal'),(492,'success_message.clinic_delete','Clinic deleted successfully','admin_portal'),(493,'success_message.country_delete','Country deleted successfully','admin_portal'),(494,'setting.translations.platform','Platform','admin_portal'),(495,'placeholder.setting.translations.platform','Please select a platform','admin_portal'),(496,'language.new','New Language','admin_portal'),(497,'language.edit','Edit Language','admin_portal'),(498,'language.name','Name','admin_portal'),(499,'language.code','Code','admin_portal'),(500,'language.rtl','RTL Layout','admin_portal'),(501,'language.auto_translate_confirmation_title','Auto Translate Language','admin_portal'),(502,'translation.new','New','admin_portal'),(503,'error_message.language_exists','Language already exist!','admin_portal'),(504,'error_message.language_not_exists','Language already not exist!','admin_portal'),(505,'toast_title.new_language','New language','admin_portal'),(506,'toast_title.edit_language','Edit language','admin_portal'),(507,'error.language.name','Please fill in name','admin_portal'),(508,'error.language.code','Please fill in code','admin_portal'),(509,'error.language.code.format','Code must be in 2 digits','admin_portal'),(510,'placeholder.language.name','Enter name','admin_portal'),(511,'placeholder.language.code','Enter code','admin_portal'),(512,'success_message.language_add','Language created successfully','admin_portal'),(513,'success_message.language_update','Language updated successfully','admin_portal'),(514,'success_message.language_delete','Language deleted successfully','admin_portal'),(515,'success_message.auto_translated','Auto-translated successfully','admin_portal'),(516,'common.type.media','Media','admin_portal'),(517,'common.type.pdf','PDF','admin_portal'),(518,'common.type.archive','Archive','admin_portal'),(519,'common.type.text','Text','admin_portal'),(520,'common.type.image','Image','admin_portal'),(521,'common.type.document','Document','admin_portal'),(522,'common.type.spreadsheet','Spreadsheet','admin_portal'),(523,'common.type.presentation','Presentation','admin_portal'),(524,'common.type.unknown','Unknown','admin_portal'),(525,'common.close','Close','admin_portal'),(526,'common.view','View','admin_portal'),(527,'static_page.new','New Static Page','admin_portal'),(528,'static_page.edit','Edit Static Page','admin_portal'),(529,'privacy_policy.edit','Edit Privacy Policy','admin_portal'),(530,'static_page.image','Image','admin_portal'),(531,'static_page.title','Title','admin_portal'),(532,'placeholder.static_page.title','Please fill in title','admin_portal'),(533,'static_page.url','URL path segment','admin_portal'),(534,'static_page.private','Private','admin_portal'),(535,'placeholder.static_page.url','Please fill in url path segment','admin_portal'),(536,'placeholder.platform','Please select platform','admin_portal'),(537,'static_page.background_color','Page background color','admin_portal'),(538,'static_page.text_color','Page text color','admin_portal'),(539,'static_page.media_upload','Upload image','admin_portal'),(540,'error.static_page.title','Please fill in title','admin_portal'),(541,'error.static_page.url','Please fill in url path segment','admin_portal'),(542,'error_message.url_exists','This url has been defined','admin_portal'),(543,'error.static_page.platform','Please select a platform','admin_portal'),(544,'toast_title.new_static_page','New static page','admin_portal'),(545,'toast_title.update_static_page','Update static page','admin_portal'),(546,'success_message.static_file.update','Static page updated successfully','admin_portal'),(547,'success_message.static_page_add','Static page added successfully','admin_portal'),(548,'common.region','Region/Stage','admin_portal'),(549,'common.total_therapist','Total Therapists','admin_portal'),(550,'common.total_patient','Total number of patients','admin_portal'),(551,'common.ongoing_treatment_plan','Ongoing Treatment Plan','admin_portal'),(552,'common.total.ongoing_treatment_plan','Total number of On-going Treatment Plans','admin_portal'),(553,'common.storage_used','Storage Used','admin_portal'),(554,'common.total_global_admin','Total Organization Admins','admin_portal'),(555,'common.total_country_admin','Total Country Admins','admin_portal'),(556,'common.total_clinic_admin','Total Clinic Admins','admin_portal'),(557,'common.country_admin_per_country','Country Admins per Country','admin_portal'),(558,'common.clinic_admin_per_country','Clinic Admins per Country','admin_portal'),(559,'common.patient_by_age_per_country','Patients by Age per Country','admin_portal'),(560,'common.ongoing_by_age_per_country','On-Going Treatment by Age per Country','admin_portal'),(561,'common.treatment_by_age_per_country','Treatment by Age per Country','admin_portal'),(562,'common.therapist_per_country','Therapist per Country','admin_portal'),(563,'common.patient_by_gender_per_country','Patient by Gender per Country','admin_portal'),(564,'common.treatment_by_gender_per_country','Treatment by Gender per Country','admin_portal'),(565,'common.ongoing_treatement_by_gender_per_country','On-Going Treatment by Gender per Country','admin_portal'),(566,'common.finished','Finished','admin_portal'),(567,'common.on_going','On-going','admin_portal'),(568,'common.planned','Planned','admin_portal'),(569,'common.date_of_birth','Date Of Birth','admin_portal'),(570,'common.age','Age','admin_portal'),(571,'common.ongoing_treatment_status','Status','admin_portal'),(572,'common.diagnostic','Diagnostic','admin_portal'),(573,'common.next_appointment','Next Appointment','admin_portal'),(574,'patient','Patients','admin_portal'),(575,'age.single_year','year','admin_portal'),(576,'age.single_month','month','admin_portal'),(577,'age.single_day','day','admin_portal'),(578,'age.plural_year','years','admin_portal'),(579,'age.plural_month','months','admin_portal'),(580,'age.plural_day','days','admin_portal'),(581,'common.male','Male','admin_portal'),(582,'common.female','Female','admin_portal'),(583,'common.other','Other','admin_portal'),(584,'common.year','years','admin_portal'),(585,'dashboard.total_clinic_admin','Total Clinic Admins','admin_portal'),(586,'dashboard.total_therapist','Total Therapists','admin_portal'),(587,'dashboard.therapist_per_clinic','Therapist per Clinic','admin_portal'),(588,'dashboard.patient_by_gender_per_clinic','Patients by Gender per Clinic','admin_portal'),(589,'dashboard.patient_by_age_per_clinic','Patients by Age per Clinic','admin_portal'),(590,'dashboard.ongoing_treatment_by_gender_per_clinic','On-Going Treatments by Gender per Clinic','admin_portal'),(591,'dashboard.ongoing_treatment_by_age_per_clinic','On-Going Treatments by Gender per Clinic','admin_portal'),(592,'system_limit.content_type','Content type','admin_portal'),(593,'system_limit.value','Value','admin_portal'),(594,'error_message.system_limit_update','System limit updated fail','admin_portal'),(595,'success_message.system_limit_update','System limit updated successfully','admin_portal'),(596,'toast_title.edit_system_limit','Edit system limit','admin_portal'),(597,'toast_title.auto_translate_language','Auto translate language','admin_portal'),(598,'activities','Activities','admin_portal'),(599,'preset_treatment','Preset Treatment','admin_portal'),(600,'common.no_file_translate','No file translated','admin_portal'),(601,'therapist_content_limit','Therapist Content Limit','admin_portal'),(602,'number_of_ongoing_treatment_per_therapist','Number of ongoing treatment per therapist','admin_portal'),(603,'static_page.partner_logo','Mobile Splash Screen Partner Logo','admin_portal'),(604,'success_message.partner_logo.save','Partner logo saved successfully','admin_portal'),(605,'toast_title.add_partner_logo','Partner Logo','admin_portal'),(606,'term_and_condition.view_title','Term & Condition Content','admin_portal'),(607,'privacy_policy.view_title','Privacy Policy Content','admin_portal'),(608,'common.treatment','Treatment','admin_portal'),(609,'common.ongoing_treatment','On-Going Treatment','admin_portal'),(610,'common.week','Week','admin_portal'),(611,'common.day','Day','admin_portal'),(612,'common.duration','Duration','admin_portal'),(613,'common.description','Description','admin_portal'),(614,'common.start_date','Start date','admin_portal'),(615,'common.end_date','End date','admin_portal'),(616,'treatment_plan.back_to_list','Back To Treatment History','admin_portal'),(617,'treatment_plan.activities_tab','Activities','admin_portal'),(618,'treatment_plan.questionnaires_tab','Questionnaires','admin_portal'),(619,'treatment_plan.adherence_tab','Adherence','admin_portal'),(620,'treatment_plan.goal_tracking_tab','Goals Tracking','admin_portal'),(621,'patient.back_to_list','Back To Patient List','admin_portal'),(622,'activity.questionnaire','Questionnaire','admin_portal'),(623,'common.pain_level','Pain level','admin_portal'),(624,'common.time_range','Time range','admin_portal'),(625,'common.completed','Completed','admin_portal'),(626,'questionnaire.submitted_date','Submitted Date','admin_portal'),(627,'activity.questionnaire.questions','questions','admin_portal'),(628,'activity.material','EDUCATION Material','admin_portal'),(629,'treatment_plan.detail','Treatment Plan Detail','admin_portal'),(630,'treatment_plan.treatment_history','Treatment History','admin_portal'),(631,'treatment_plan.goal.number','Goal ${number}','admin_portal'),(632,'treatment_plan.goal.extreme_satisfaction','Extreme satisfaction','admin_portal'),(633,'treatment_plan.goal.no_satisfaction','No satisfaction','admin_portal'),(634,'common.treatment_name','Treatment Name','admin_portal'),(635,'common.reps','reps','admin_portal'),(636,'common.sets','sets','admin_portal'),(637,'profile.faq','FAQ','admin_portal'),(638,'profile.tc','Term and Condition','admin_portal'),(639,'profile.pp','Privacy Policy','admin_portal'),(640,'pain_threshold_limit','Pain threshold limit','admin_portal'),(641,'success_message.disease_update','Disease updated successfully','admin_portal'),(642,'success_message.disease_create','Disease created successfully','admin_portal'),(643,'success_message.disease_delete','Disease deleted successfully','admin_portal'),(644,'error_message.disease_delete','Disease cannot be deleted','admin_portal'),(645,'disease.delete_confirmation_title','Disease deletion','admin_portal'),(646,'guidance.delete_confirmation_title','Guidance deletion','admin_portal'),(647,'error_message.disease_exists','Disease already exist','admin_portal'),(648,'toast_title.new_disease','New disease','admin_portal'),(649,'toast_title.edit_disease','Edit disease','admin_portal'),(650,'disease.upload','Upload Diseases','admin_portal'),(651,'disease.new','New Disease','admin_portal'),(652,'disease.bulk_upload.instruction','Download template, then input the content and upload','admin_portal'),(653,'disease.bulk_upload.file.placeholder','Browse a file','admin_portal'),(654,'disease.bulk_upload.file.required','Please select a file','admin_portal'),(655,'disease.bulk_upload.file.max_size','Please select a file smaller than ${size} MB','admin_portal'),(656,'disease.bulk_upload.download_template','Download template','admin_portal'),(657,'disease.bulk_upload.number_of_new_diseases','${number} disease(s) have been added.','admin_portal'),(658,'disease.bulk_upload.number_of_updated_diseases','${number} disease(s) have been updated.','admin_portal'),(659,'setting.disease','Diseases','admin_portal'),(660,'disease.name','Name','admin_portal'),(661,'placeholder.disease.name','Enter name','admin_portal'),(662,'disease.edit','Edit Disease','admin_portal'),(663,'error.disease.name','Please fill in the name','admin_portal'),(664,'toast_title.delete_disease','Delete Disease','admin_portal'),(665,'toast_title.upload_diseases','Upload diseases','admin_portal'),(666,'error_message.disease_upload','Diseases cannot be uploaded. Field \'name\' is required at row ${number}','admin_portal'),(667,'success_message.disease_upload','Diseases uploaded successfully','admin_portal'),(668,'error.over_default_limit_patient','The treatment limit can not set more than default treatment limit of the therapist','admin_portal'),(669,'term.of.service','Terms of Services','admin_portal'),(670,'term.of.service.agree','I agree to Terms of Service.','admin_portal'),(671,'term.of.service.detail.link','View Hi humanity & inclusion Terms of Services','admin_portal'),(672,'privacy.policy.agree','I agree to Privacy Policy.','admin_portal'),(673,'privacy.policy.detail.link','View Hi humanity & inclusion Privacy Policy','admin_portal'),(674,'term.of.service.accept','Accept','admin_portal'),(675,'success_message.file_upload','File uploaded successfully','admin_portal'),(676,'error_message.file_upload','File upload failed','admin_portal'),(677,'login.error_message.invalid_user','Incorrect E-mail or Password. Please try again.','admin_portal'),(678,'login.error_message.time_out','Your login attempt timed out. Login will start from the beginning.','admin_portal'),(679,'organization.edit','Edit organization','admin_portal'),(680,'organization.new','New organization','admin_portal'),(681,'organization.admin_email','Admin email','admin_portal'),(682,'organization.platform','Platform','admin_portal'),(683,'organization.name','Name','admin_portal'),(684,'placeholder.organization.name','Enter organization','admin_portal'),(685,'organization.type','Type','admin_portal'),(686,'organization.non_hi','Non hi organization','admin_portal'),(687,'organization.hi','Hi organization','admin_portal'),(688,'success_message.organization.update','Organization updated successfully','admin_portal'),(689,'success_message.organization_delete','Organization deleted successfully','admin_portal'),(690,'success_message.organization_add','Organization created successfully','admin_portal'),(691,'toast_title.new_organization','New organization','admin_portal'),(692,'toast_title.edit_organization','Edit organization','admin_portal'),(693,'toast_title.delete_organization','Delete organization','admin_portal'),(694,'organization.delete_confirmation_title','Delete organization','admin_portal'),(695,'error_message.organization_add','Organization cannot created','admin_portal'),(696,'setting.organization','Organization','admin_portal'),(697,'error.organization.name','Please enter organization name','admin_portal'),(698,'organization.sub_domain_name','Sub domain name','admin_portal'),(699,'placeholder.organization.sub_domain_name','Please enter sub domain name','admin_portal'),(700,'error.organization.sub_domain_name','Please fill the sub domain name','admin_portal'),(701,'error_message.organization_exists','Organization already exist','admin_portal'),(702,'organization.max_number_of_therapist','Max number of therapist','admin_portal'),(703,'organization.max_ongoing_treatment_plan','Max ongoing treatment plan','admin_portal'),(704,'placeholder.organization.max_number_of_therapist','Enter number of therapist','admin_portal'),(705,'error.organization.max_number_of_therapist','Please fill the number of therapist','admin_portal'),(706,'placeholder.organization.max_ongoing_treatment_plan','Enter number of ongoing treatment plan','admin_portal'),(707,'error.organization.max_ongoing_treatment_plan','Please fill the number of ongoing treatment plan','admin_portal'),(708,'error.country.therapist_limit.more_than.org_therapist_limit','The therapist limit can not set more than total therapist limit of organization','admin_portal'),(709,'error_message.organization_sub_domain_exists','Organization sub domain name already exist','admin_portal'),(710,'common.success','Success','admin_portal'),(711,'common.ongoing','Ongoing','admin_portal'),(712,'common.pending','Pending','admin_portal'),(713,'common.failed','Failed','admin_portal'),(714,'setting.color_scheme','Color scheme','admin_portal'),(715,'common.primary_color','Primary color','admin_portal'),(716,'common.secondary_color','Secondary color','admin_portal'),(717,'common.primary_text_color','Primary text color','admin_portal'),(718,'common.secondary_text_color','Secondary text color','admin_portal'),(719,'success_message.color_scheme.save','Color scheme saved successfully','admin_portal'),(720,'toast_title.add_color_scheme','Color scheme','admin_portal'),(721,'common.welcome','Welcome','therapist_portal'),(722,'common.cancel','Cancel','therapist_portal'),(723,'common.create','Create','therapist_portal'),(724,'common.email','Email','therapist_portal'),(725,'common.first_name','First Name','therapist_portal'),(726,'common.last_name','Last Name','therapist_portal'),(727,'common.label_country','Country:','therapist_portal'),(728,'common.country','Country','therapist_portal'),(729,'common.clinic','Clinic','therapist_portal'),(730,'common.edit_info','Edit info','therapist_portal'),(731,'common.deactivate','Deactivate','therapist_portal'),(732,'common.delete','Delete','therapist_portal'),(733,'common.action','Actions','therapist_portal'),(734,'common.save','Save','therapist_portal'),(735,'common.filters','Filters','therapist_portal'),(736,'common.columns','Columns','therapist_portal'),(737,'common.search.placeholder','Search','therapist_portal'),(738,'common.back','Back','therapist_portal'),(739,'common.edit','Edit','therapist_portal'),(740,'common.copy','Copy','therapist_portal'),(741,'common.view','View','therapist_portal'),(742,'common.gender','Gender','therapist_portal'),(743,'common.dateOfBirth','Date of Birth','therapist_portal'),(744,'common.note','Note','therapist_portal'),(745,'common.label_age','Age:','therapist_portal'),(746,'common.phone','Mobile Number','therapist_portal'),(747,'common.name','Name','therapist_portal'),(748,'common.description','Description','therapist_portal'),(749,'common.start_date','Start date','therapist_portal'),(750,'common.end_date','End date','therapist_portal'),(751,'common.assign','Assign','therapist_portal'),(752,'common.week','Week','therapist_portal'),(753,'common.weeks','Weeks','therapist_portal'),(754,'common.day','Day','therapist_portal'),(755,'common.exercises','Exercises','therapist_portal'),(756,'common.duration','Duration','therapist_portal'),(757,'common.education_materials','Education Materials','therapist_portal'),(758,'common.questionnaire','Questionnaire','therapist_portal'),(759,'common.delete_confirmation_message','Are you sure want to delete this record?','therapist_portal'),(760,'toast_title.delete_patient_account','Delete account','therapist_portal'),(761,'common.yes','Yes','therapist_portal'),(762,'common.no','No','therapist_portal'),(763,'common.finished','Finished','therapist_portal'),(764,'common.on_going','On-going','therapist_portal'),(765,'common.planned','Planned','therapist_portal'),(766,'common.all','All','therapist_portal'),(767,'common.label_id','ID:','therapist_portal'),(768,'common.mobile_number','Mobile Number','therapist_portal'),(769,'common.dob','DOB:','therapist_portal'),(770,'common.old','old','therapist_portal'),(771,'common.id','ID','therapist_portal'),(772,'common.date_of_birth','Date Of Birth','therapist_portal'),(773,'common.age','Age','therapist_portal'),(774,'common.ongoing_treatment_status','Status','therapist_portal'),(775,'common.ongoing_treatment_plan','Diagnostic','therapist_portal'),(776,'common.next_appointment','Next Appointment','therapist_portal'),(777,'common.total_number_of_patient','Total Number Of Patient:','therapist_portal'),(778,'common.on_going_treatment_limit','On-going Treatment Limit:','therapist_portal'),(779,'common.patient_detail','Patient File','therapist_portal'),(780,'common.treatment_name','Treatment Name','therapist_portal'),(781,'treatment_plan.back_to_list','Back To Treatment History','therapist_portal'),(782,'patient.back_to_list','Back To Patient List','therapist_portal'),(783,'treatment_plan.back_to_preset_list','Back To Preset Treatments','therapist_portal'),(784,'common.status','Status','therapist_portal'),(785,'common.category','Category','therapist_portal'),(786,'common.category_item','Category Item','therapist_portal'),(787,'common.timerange.placeholder','Select date range','therapist_portal'),(788,'common.apply','Apply','therapist_portal'),(789,'common.clear','Clear','therapist_portal'),(790,'common.language','Languages','therapist_portal'),(791,'common.paginate.per_page','per page','therapist_portal'),(792,'common.paginate.show_number_of_records','Show ${recordStart} to ${recordEnd} of ${totalCount} items','therapist_portal'),(793,'common.no_data','No Data','therapist_portal'),(794,'common.default','default','therapist_portal'),(795,'common.type.media','Media','therapist_portal'),(796,'common.type.pdf','PDF','therapist_portal'),(797,'common.type.archive','Archive','therapist_portal'),(798,'common.type.text','Text','therapist_portal'),(799,'common.type.image','Image','therapist_portal'),(800,'common.type.document','Document','therapist_portal'),(801,'common.type.spreadsheet','Spreadsheet','therapist_portal'),(802,'common.type.presentation','Presentation','therapist_portal'),(803,'common.type.unknown','Unknown','therapist_portal'),(804,'common.pain_level','Pain level','therapist_portal'),(805,'common.time_range','Time range','therapist_portal'),(806,'common.completed','Completed','therapist_portal'),(807,'common.reps','reps','therapist_portal'),(808,'common.sets','sets','therapist_portal'),(809,'common.close','Close','therapist_portal'),(810,'common.add','Add','therapist_portal'),(811,'common.attach_file','Attach file','therapist_portal'),(812,'common.approve','Approve','therapist_portal'),(813,'common.accept','Accept','therapist_portal'),(814,'common.reject','Reject','therapist_portal'),(815,'common.send','Send','therapist_portal'),(816,'common.secondary_therapist','Secondary therapists','therapist_portal'),(817,'common.secondary_primary_therapist','Primary/Secondary Therapist','therapist_portal'),(818,'common.secondary_therapist.label','Secondary','therapist_portal'),(819,'common.primary_therapist.label','Primary','therapist_portal'),(820,'common.notification','Notification','therapist_portal'),(821,'common.guidance.next','Next','therapist_portal'),(822,'common.guidance.prev','Previous','therapist_portal'),(823,'common.guidance.hide','Doesn\'t show guidance','therapist_portal'),(824,'toast_title.translate_exercise','Translate Exercise','therapist_portal'),(825,'success_message.exercise_suggest','Translation suggested successfully','therapist_portal'),(826,'error_message.exercise_suggest','Translation cannot be suggested','therapist_portal'),(827,'portal.name','Therapist Portal','therapist_portal'),(828,'home','Home','therapist_portal'),(829,'login','Login','therapist_portal'),(830,'dashboard','Dashboard','therapist_portal'),(831,'patient','Patients','therapist_portal'),(832,'not_found_page','404 page','therapist_portal'),(833,'category','Categories','therapist_portal'),(834,'service_setup','Services Setup','therapist_portal'),(835,'therapist','Therapists','therapist_portal'),(836,'global_admin','Global Admin','therapist_portal'),(837,'country_admin','Country Admin','therapist_portal'),(838,'clinic_admin','Clinic Admin','therapist_portal'),(839,'therapist.management','Therapist Management','therapist_portal'),(840,'therapist.new','New Therapist','therapist_portal'),(841,'exercise.translate','Translate Exercise','therapist_portal'),(842,'education_material.translate','Translate Education Material','therapist_portal'),(843,'questionnaire.translate','Translate Questionnaire','therapist_portal'),(844,'appointment','Appointment','therapist_portal'),(845,'appointment.number_of_appointments','${numberOfAppointments} appointments','therapist_portal'),(846,'appointment.appointment_list','Appointment List','therapist_portal'),(847,'appointment.request_for_appointment','Request For Appointment','therapist_portal'),(848,'appointment.cancellation','Cancellation','therapist_portal'),(849,'appointment.appointment_with_name','Appointment with ${name}','therapist_portal'),(850,'appointment.add_appointment','Add Appointment','therapist_portal'),(851,'appointment.clear','Clear','therapist_portal'),(852,'appointment.new','New Appointment','therapist_portal'),(853,'appointment.edit','Edit Appointment','therapist_portal'),(854,'success_message.appointment_delete','Appointment deleted successfully','therapist_portal'),(855,'success_message.deleted_account','Account deleted successfully','therapist_portal'),(856,'success_message.appointment_request_delete','Appointment request deleted successfully','therapist_portal'),(857,'success_message.appointment_accept_cancel','Appointment\'s cancellation accepted successfully','therapist_portal'),(858,'error_message.appointment_delete','Accept appointment\'s cancellation failed','therapist_portal'),(859,'appointment.patient','Patient','therapist_portal'),(860,'appointment.date','Date','therapist_portal'),(861,'appointment.from','From','therapist_portal'),(862,'appointment.to','To','therapist_portal'),(863,'appointment.note','Note','therapist_portal'),(864,'appointment.note.placeholder','Enter Note','therapist_portal'),(865,'appointment.cancel','Remove cancellation request','therapist_portal'),(866,'appointment.delete.title','Delete appointment','therapist_portal'),(867,'appointment.accept.title','Accept appointment','therapist_portal'),(868,'appointment.reject.title','Reject appointment','therapist_portal'),(869,'toast_title.accept_appointment','Accept appointment','therapist_portal'),(870,'toast_title.reject_appointment','Reject appointment','therapist_portal'),(871,'appointment.delete.content','Are you sure you want to delete this appointment?','therapist_portal'),(872,'appointment.accept.content','Are you sure you want to accept this appointment?','therapist_portal'),(873,'appointment.reject.content','Are you sure you want to reject this appointment?','therapist_portal'),(874,'appointment.accept.cancel.title','Accept appointment\'s cancellation','therapist_portal'),(875,'appointment.accept.cancel.content','Are you sure you want to accept this appointment\'s cancellation?','therapist_portal'),(876,'appointment.cancel.message','Are you sure you want to cancel this request?','therapist_portal'),(877,'appointment.delete.appointment.request','Are you sure you want to delete this appointment request?','therapist_portal'),(878,'appointment.delete.request.title','Delete appointment request','therapist_portal'),(879,'toast_title.edit_appointment','Edit appointment','therapist_portal'),(880,'toast_title.delete_appointment','Delete appointment','therapist_portal'),(881,'success_message.appointment_cancellation_request_delete','Appointment\'s cancellation rejected successfully','therapist_portal'),(882,'toast_title.delete_exercise','Delete exercise','therapist_portal'),(883,'success_message.exercise_delete','Exercise deleted successfully','therapist_portal'),(884,'admin','Admins','therapist_portal'),(885,'admin.management','Admin Management','therapist_portal'),(886,'admin.new','New Admin','therapist_portal'),(887,'admin.edit','Edit Admin','therapist_portal'),(888,'admin.hint_message_global_admin','Global admins can manage Global Admins/ Country Admin, create and upload the content (exercises and questionnaires).','therapist_portal'),(889,'admin.hint_message_country_admin','Country admins manage therapist of a country.','therapist_portal'),(890,'admin.hint_message_clinic_admin','Clinic admins manage therapist of a clinics.','therapist_portal'),(891,'profile.setting','Settings Privacy','therapist_portal'),(892,'patient.management','Patient Management','therapist_portal'),(893,'patient.new','New Patient','therapist_portal'),(894,'patient.edit','Edit Patient','therapist_portal'),(895,'profile','Profile','therapist_portal'),(896,'profile.personal','Personal','therapist_portal'),(897,'profile.information','Profile Information','therapist_portal'),(898,'profile.change_password','Change password','therapist_portal'),(899,'profile.password','Password','therapist_portal'),(900,'profile.current_password','Current Password','therapist_portal'),(901,'profile.new_password','New Password','therapist_portal'),(902,'profile.confirm_new_password','Confirm New Password','therapist_portal'),(903,'logout','Logout','therapist_portal'),(904,'logout.confirmation','Logout Confirmation','therapist_portal'),(905,'logout.message','Are you sure to logout?','therapist_portal'),(906,'logout.cancel','No','therapist_portal'),(907,'logout.confirm','Yes','therapist_portal'),(908,'treatment_plan.treatment_information','TREATMENT INFORMATION','therapist_portal'),(909,'treatment_plan.treatment_planning','Treatment Planning','therapist_portal'),(910,'treatment_plan.preset','Preset Treatment','therapist_portal'),(911,'treatment_plan.preset.name','Preset name','therapist_portal'),(912,'treatment_plan.preset.assign','Preset Treatment Assignment','therapist_portal'),(913,'treatment_plan.general_information','GENERAL INFORMATION','therapist_portal'),(914,'treatment_plan.assign_to_patient','ASSIGNMENT TO PATIENT','therapist_portal'),(915,'treatment_plan.patient_detail','Patient File / Treatment Plan','therapist_portal'),(916,'treatment_plan.treatment_goal_for_patient','TREATMENT GOAL FOR PATIENT','therapist_portal'),(917,'treatment_plan.treatment_goal_for_patient_max_number','(Maximum: 4 goals)','therapist_portal'),(918,'treatment_plan.choose_a_patient','Choose a patient','therapist_portal'),(919,'treatment_plan.patient','Patient Name','therapist_portal'),(920,'treatment_plan.international_classification','International Classification of Diseases','therapist_portal'),(921,'treatment_plan.description','Additional information','therapist_portal'),(922,'treatment_plan.save_as_preset','Save As Preset','therapist_portal'),(923,'treatment_plan.delete_confirmation_title','Week deletion','therapist_portal'),(924,'treatment_plan.treatment_history','Treatment History','therapist_portal'),(925,'treatment_plan.edit_treatment_info','Edit Treatment Info','therapist_portal'),(926,'treatment_plan.view_treatment_detail','View Treatment Detail','therapist_portal'),(927,'treatment_plan.edit','Edit Treatment Plan','therapist_portal'),(928,'treatment_plan.detail','Treatment Plan Detail','therapist_portal'),(929,'treatment_plan.edit.info','Edit Treatment Info','therapist_portal'),(930,'treatment_plan.create','Treatment Create','therapist_portal'),(931,'treatment_plan.name','Diagnostic','therapist_portal'),(932,'treatment_plan.activities_tab','Activities','therapist_portal'),(933,'treatment_plan.questionnaires_tab','Questionnaires','therapist_portal'),(934,'treatment_plan.adherence_tab','Adherence','therapist_portal'),(935,'treatment_plan.goal_tracking_tab','Goals Tracking','therapist_portal'),(936,'treatment_plan.goal.number','Goal ${number}','therapist_portal'),(937,'treatment_plan.goal.extreme_satisfaction','Extreme satisfaction','therapist_portal'),(938,'treatment_plan.goal.no_satisfaction','No satisfaction','therapist_portal'),(939,'treatment_plan.goal.add','Add More Goal','therapist_portal'),(940,'treatment_plan.goal.new','New Treatment Goal','therapist_portal'),(941,'treatment_plan.goal.edit','Edit Treatment Goal','therapist_portal'),(942,'treatment_plan.goal.frequency','Frequency','therapist_portal'),(943,'treatment_plan.goal.frequency.placeholder','Please select a frequency','therapist_portal'),(944,'treatment_plan.goal.frequency.error','Please choose frequency','therapist_portal'),(945,'treatment_plan.goal.frequency.option.daily','Daily','therapist_portal'),(946,'treatment_plan.goal.frequency.option.weekly','Weekly','therapist_portal'),(947,'treatment_plan.goal.title','Title','therapist_portal'),(948,'treatment_plan.goal.title.placeholder','Enter title','therapist_portal'),(949,'treatment_plan.goal.title.error','Please fill title','therapist_portal'),(950,'treatment_plan.goal.no_goals','No Goals','therapist_portal'),(951,'treatment_plan.goal.delete_confirmation_title','Goal deletion','therapist_portal'),(952,'treatment_plan.preset.delete_confirmation_title','Preset treatment deletion','therapist_portal'),(953,'placeholder.last_name','Enter last name','therapist_portal'),(954,'placeholder.first_name','Enter first name','therapist_portal'),(955,'placeholder.language','Please select a language','therapist_portal'),(956,'placeholder.disease','Please select a disease','therapist_portal'),(957,'placeholder.clinic','Please select a clinic','therapist_portal'),(958,'placeholder.country','Please select a country','therapist_portal'),(959,'placeholder.email','Enter email','therapist_portal'),(960,'placeholder.treatment_plan.name','Enter diagnostic','therapist_portal'),(961,'error.treatment_plan.name','Please fill in diagnostic','therapist_portal'),(962,'placeholder.limit_patient','Enter Limit Patient','therapist_portal'),(963,'placeholder.birth_date','Enter birth date','therapist_portal'),(964,'placeholder.institution','Enter Institution','therapist_portal'),(965,'placeholder.gender','Please select a gender','therapist_portal'),(966,'placeholder.phone','Enter mobile number','therapist_portal'),(967,'placeholder.note','Enter note','therapist_portal'),(968,'placeholder.date_of_birth','Enter date of birth','therapist_portal'),(969,'placeholder.name','Enter name','therapist_portal'),(970,'placeholder.description','Enter description','therapist_portal'),(971,'placeholder.start_date','Please select start date','therapist_portal'),(972,'placeholder.patient','Please select a patient','therapist_portal'),(973,'placeholder.date','Please select date','therapist_portal'),(974,'placeholder.time','Please select time','therapist_portal'),(975,'placeholder.therapist','Please select a therapist','therapist_portal'),(976,'error.phone','Please fill mobile number','therapist_portal'),(977,'error.first_name','Please fill first name','therapist_portal'),(978,'error.gender','Please fill gender','therapist_portal'),(979,'error.last_name','Please fill last name','therapist_portal'),(980,'error.email','Please fill in the email','therapist_portal'),(981,'error.country','Please select a country','therapist_portal'),(982,'error.clinic','Please select a clinic','therapist_portal'),(983,'error.limit_patient','Please Limit Patient','therapist_portal'),(984,'error.current_password','Please fill in the current password','therapist_portal'),(985,'error.new_password','Please fill in the new password','therapist_portal'),(986,'error.confirm_password','Please fill in the confirm new password','therapist_portal'),(987,'error.new_password_validation','Passwords must be at least ${passwordLength} characters long, contains both uppercase and lowercase letters, at least one number and one symbol.','therapist_portal'),(988,'error.new_password_validation_exist','The new password can not be the same as the current password','therapist_portal'),(989,'error.confirm_password_not_match','Password does not match','therapist_portal'),(990,'error.name','Please fill in name','therapist_portal'),(991,'error.description','Please fill in description','therapist_portal'),(992,'error.start_date','Please select start date','therapist_portal'),(993,'error.invalid_date','Please select valid date','therapist_portal'),(994,'error_message.email_exists','Email already exists','therapist_portal'),(995,'error_message.wrong_password','Old password is not valid.','therapist_portal'),(996,'error_message.cannot_change_password','Password is unable to change','therapist_portal'),(997,'error_message.treatment_plan_add_as_preset','Treatment Plan cannot be added as a preset.','therapist_portal'),(998,'error_message.treatment_plan_add_as_preset.full_limit','Items cannot go over the allocated therapist limit.','therapist_portal'),(999,'error_message.treatment_plan_assign_to_patient_overlap_schedule','The patient already has a schedule between selected dates.','therapist_portal'),(1000,'error_message.treatment_plan_assign_to_patient','Treatment Plan cannot be assigned to the patient.','therapist_portal'),(1001,'error_message.treatment_plan_patient_required','Please choose patient','therapist_portal'),(1002,'error_message.appointment_patient_required','Please choose a patient','therapist_portal'),(1003,'error_message.appointment_date','Please select date','therapist_portal'),(1004,'error_message.appointment_from','Please select time','therapist_portal'),(1005,'error_message.appointment_to','Please select time','therapist_portal'),(1006,'error_message.phone_exists','Phone number already exists','therapist_portal'),(1007,'error_message.chat_nonactivated','This account is not activated.','therapist_portal'),(1008,'success_message.user_add','User created successfully','therapist_portal'),(1009,'success_message.user_update','User updated successfully','therapist_portal'),(1010,'success_message.update_profile_success','Profile updated successfully','therapist_portal'),(1011,'success_message.change_password_success','Password updated successfully','therapist_portal'),(1012,'success_message.treatment_plan_add_as_preset','Treatment Plan added as a preset successfully','therapist_portal'),(1013,'success_message.treatment_plan_assign_to_patient','Treatment Plan assigned to the patient successfully','therapist_portal'),(1014,'success_message.treatment_plan_update','Treatment Plan updated successfully','therapist_portal'),(1015,'success_message.treatment_plan_delete','Treatment Plan deleted successfully','therapist_portal'),(1016,'success_message.appointment_add','Appointment created successfully','therapist_portal'),(1017,'success_message.appointment_update','Appointment updated successfully','therapist_portal'),(1018,'success_message.appointment_accept','Appointment accepted successfully','therapist_portal'),(1019,'success_message.appointment_reject','Appointment rejected successfully','therapist_portal'),(1020,'toast_title.new_admin_account','New admin account','therapist_portal'),(1021,'toast_title.edit_admin_account','Edit admin account','therapist_portal'),(1022,'toast_title.update_profile','Edit profile','therapist_portal'),(1023,'toast_title.change_password','Edit password','therapist_portal'),(1024,'toast_title.error_message','Error message','therapist_portal'),(1025,'toast_title.edit_patient_account','Edit patient account','therapist_portal'),(1026,'toast_title.new_patient_account','New patient account','therapist_portal'),(1027,'toast_title.new_treatment_plan','New Treatment Plan','therapist_portal'),(1028,'toast_title.update_treatment_plan','Edit Treatment Plan','therapist_portal'),(1029,'toast_title.delete_treatment_plan','Delete Treatment Plan','therapist_portal'),(1030,'toast_title.new_appointment','New Appointment','therapist_portal'),(1031,'toast_title.update_appointment','Edit Appointment','therapist_portal'),(1032,'patient.edit_info','Edit Patient Info','therapist_portal'),(1033,'patient.create_treatment','Create Treatment Plan','therapist_portal'),(1034,'patient.deactivate_account','Deactivate Account','therapist_portal'),(1035,'patient.delete_confirmation_message','Are you sure you want to delete this account?','therapist_portal'),(1036,'patient.delete_account','Delete Account','therapist_portal'),(1037,'patient.detail','Patient Detail','therapist_portal'),(1038,'age.single_year','year','therapist_portal'),(1039,'age.single_month','month','therapist_portal'),(1040,'age.single_day','day','therapist_portal'),(1041,'age.plural_year','years','therapist_portal'),(1042,'age.plural_month','months','therapist_portal'),(1043,'age.plural_day','days','therapist_portal'),(1044,'exercise.search','Search exercises','therapist_portal'),(1045,'education_material.search','Search materials','therapist_portal'),(1046,'questionnaire.search','Search questionnaires','therapist_portal'),(1047,'questionnaire.title','Title','therapist_portal'),(1048,'questionnaire.description','Description','therapist_portal'),(1049,'questionnaire.number_of_question','No. of Questions','therapist_portal'),(1050,'questionnaire.submitted_date','Submitted Date','therapist_portal'),(1051,'questionnaire.question_number','Question ${number}','therapist_portal'),(1052,'questionnaire.update_used_questionnaire_confirmation_title','Questionnaire update','therapist_portal'),(1053,'questionnaire.update_used_questionnaire_confirmation_message','Attention, any update will apply to questionnaires currently and previously shared with patients. Are you still want to update ?','therapist_portal'),(1054,'activity.select_activities_to_add','Select Activities to Add','therapist_portal'),(1055,'activity.exercises','Exercises','therapist_portal'),(1056,'activity.education_materials','Education Materials','therapist_portal'),(1057,'education.delete_confirmation_title','Education material deletion','therapist_portal'),(1058,'activity.questionnaires','Questionnaires','therapist_portal'),(1059,'questionnaire.delete_confirmation_title','Questionnaire deletion','therapist_portal'),(1060,'activity.add_to_day','Add to day','therapist_portal'),(1061,'activity.material','EDUCATION Material','therapist_portal'),(1062,'activity.questionnaire','Questionnaire','therapist_portal'),(1063,'activity.questionnaire.questions','questions','therapist_portal'),(1064,'library','Library','therapist_portal'),(1065,'library.exercises','Exercises','therapist_portal'),(1066,'library.education_materials','Education Materials','therapist_portal'),(1067,'library.questionnaires','Questionnaires','therapist_portal'),(1068,'library.preset_treatments','Preset Treatments','therapist_portal'),(1069,'library.show_favorites_only','Show favorites only','therapist_portal'),(1070,'library.show_my_contents_only','Show my contents only','therapist_portal'),(1071,'library.content_upload_reach_limit','You have reached the maximum number (${number}) of additional content uploaded in the library','therapist_portal'),(1072,'common.new_content','New Content','therapist_portal'),(1073,'exercise.create','Add new Exercise','therapist_portal'),(1074,'education_material.create','Add new education material','therapist_portal'),(1075,'questionnaire.create','Add new questionnaire','therapist_portal'),(1076,'questionnaire.edit','Edit questionnaire','therapist_portal'),(1077,'questionnaire.copy','Copy questionnaire','therapist_portal'),(1078,'exercise.single_upload','Upload single exercise','therapist_portal'),(1079,'exercise.bulk_upload','Upload bulk exercises','therapist_portal'),(1080,'exercise.media','MEDIA','therapist_portal'),(1081,'exercise.information','INFORMATION','therapist_portal'),(1082,'common.show_language.version','Showing language version','therapist_portal'),(1083,'exercise.title','Title','therapist_portal'),(1084,'exercise.title.placeholder','Enter title','therapist_portal'),(1085,'exercise.title.required','Please fill in the title','therapist_portal'),(1086,'exercise.set_efault_exercise_sets_and_reps','Set default exercise sets and reps','therapist_portal'),(1087,'exercise.sets','Sets','therapist_portal'),(1088,'exercise.sets.placeholder','Enter number of Sets','therapist_portal'),(1089,'exercise.sets.required','Please fill in the correct number of Sets','therapist_portal'),(1090,'exercise.reps','Reps','therapist_portal'),(1091,'exercise.reps.placeholder','Enter number of Reps','therapist_portal'),(1092,'exercise.reps.required','Please fill in the correct number of Reps','therapist_portal'),(1093,'exercise.number_of_sets_and_reps','${sets} sets - ${reps} reps','therapist_portal'),(1094,'exercise.include_collecting_feedback','Collect  number of sets and reps completed','therapist_portal'),(1095,'exercise.get_pain_level_feedback','Get pain level feedback','therapist_portal'),(1096,'exercise.delete_confirmation_title','Exercise deletion','therapist_portal'),(1097,'exercise.additional_information','Additional Information','therapist_portal'),(1098,'exercise.additional_information.placeholder','Enter additional information','therapist_portal'),(1099,'user.switchStatus_confirmation_title','Switch user status','therapist_portal'),(1100,'toast_title.update_exercise','Edit exercise','therapist_portal'),(1101,'toast_title.new_exercise','New exercise','therapist_portal'),(1102,'success_message.exercise_update','Exercise updated successfully','therapist_portal'),(1103,'success_message.questionnaire_update','Questionnaire updated successfully','therapist_portal'),(1104,'toast_title.update_questionnaire','Edit questionnaire','therapist_portal'),(1105,'success_message.exercise_create','Exercise created successfully','therapist_portal'),(1106,'error_message.exercise_create','Exercise cannot be created','therapist_portal'),(1107,'error_message.exercise_update','Exercise cannot be updated','therapist_portal'),(1108,'error_message.content_create.full_limit','Items cannot go over the allocated therapist limit.','therapist_portal'),(1109,'error_message.treatment_plan_update','Treatment Plan cannot be updated','therapist_portal'),(1110,'error_message.treatment_plan_delete','Treatment Plan cannot be deleted','therapist_portal'),(1111,'exercise.media_upload.required','Please upload the image','therapist_portal'),(1112,'exercise.media_upload.max_size','Please upload the media smaller than ${size} MB','therapist_portal'),(1113,'exercise.media_upload','Upload image','therapist_portal'),(1114,'exercise.additional_field.add_more_field','Add more field','therapist_portal'),(1115,'exercise.additional_field.label','Label','therapist_portal'),(1116,'exercise.additional_field.value','Value','therapist_portal'),(1117,'exercise.additional_field.label.required','Please fill in the label','therapist_portal'),(1118,'exercise.additional_field.value.required','Please fill in the value','therapist_portal'),(1119,'exercise.additional_field.placeholder.label','Enter label','therapist_portal'),(1120,'exercise.additional_field.placeholder.value','Enter value','therapist_portal'),(1121,'exercise.additional_field.placeholder.description','Enter description','therapist_portal'),(1122,'exercise.edit','Edit Exercise','therapist_portal'),(1123,'exercise.copy','Copy Exercise','therapist_portal'),(1124,'category.selected','selected','therapist_portal'),(1125,'common.remove','Remove','therapist_portal'),(1126,'common.ICD','ICD','therapist_portal'),(1127,'education_material.title','Title','therapist_portal'),(1128,'education_material.title.placeholder','Enter title','therapist_portal'),(1129,'education_material.title.required','Please fill in the title','therapist_portal'),(1130,'education_material.upload_file','Upload file','therapist_portal'),(1131,'education_material.upload_file.placeholder','Browse a file','therapist_portal'),(1132,'education_material.upload_file.required','Please select a file','therapist_portal'),(1133,'education_material.upload_file.max_size','Please select a file smaller than ${size} MB','therapist_portal'),(1134,'education_material.edit','Edit Education Material','therapist_portal'),(1135,'education_material.copy','Copy Education Material','therapist_portal'),(1136,'toast_title.new_education_material','New education material','therapist_portal'),(1137,'toast_title.update_education_material','Edit education material','therapist_portal'),(1138,'toast_title.delete_education_material','Delete education material','therapist_portal'),(1139,'success_message.education_material_create','Education material created successfully','therapist_portal'),(1140,'success_message.education_material_delete','Education material deleted successfully','therapist_portal'),(1141,'success_message.education_material_update','Education material updated successfully','therapist_portal'),(1142,'common.favorite','Flag favorite','therapist_portal'),(1143,'common.nonFavorite','Unflag favorite','therapist_portal'),(1144,'questionnaire.title.placeholder','Enter title','therapist_portal'),(1145,'questionnaire.title.required','Please fill in the title','therapist_portal'),(1146,'questionnaire.description.placeholder','Enter Description','therapist_portal'),(1147,'questionnaire.new.question','New Question','therapist_portal'),(1148,'question.add.more.answer','Add more answer','therapist_portal'),(1149,'question.type.checkbox','Checkboxes','therapist_portal'),(1150,'question.type.multiple_choice','Multiple choice','therapist_portal'),(1151,'question.type.open_ended_free_text','Open-ended free text','therapist_portal'),(1152,'question.type.open_ended_numbers_only','Open-ended numbers only','therapist_portal'),(1153,'question.title.required','Please fill in the title','therapist_portal'),(1154,'question.answer.description.placeholder','Enter description','therapist_portal'),(1155,'question.answer.description.required','Please fill in the description','therapist_portal'),(1156,'question.media_upload','Upload image','therapist_portal'),(1157,'toast_title.new_questionnaire','New questionnaire','therapist_portal'),(1158,'toast_title.delete_questionnaire','Delete questionnaire','therapist_portal'),(1159,'success_message.questionnaire_create','Questionnaire created successfully','therapist_portal'),(1160,'success_message.questionnaire_delete','Questionnaire deleted successfully','therapist_portal'),(1161,'error_message.questionnaire_delete','Questionnaire cannot be deleted','therapist_portal'),(1162,'error_message.questionnaire_create','Questionnaire cannot be created','therapist_portal'),(1163,'error_message.appointment_overlap','There is already an appointment between selected datetime.','therapist_portal'),(1164,'chat_or_call','Chat/Call','therapist_portal'),(1165,'chat','Chat','therapist_portal'),(1166,'chat_message.please_select_patient','Please select a patient to chat or make a call.','therapist_portal'),(1167,'chat_message.server_down','Chat server is temporary down. Please contact your administrator.','therapist_portal'),(1168,'chat_message.patient_is_not_online','Your patient can\'t reply instantly now. Will get back to you soon.','therapist_portal'),(1169,'chat_message.therapist_in_not_active','This patient is not active. You can\'t send message or make a call right now.','therapist_portal'),(1170,'chat_attachment.title','Send attachment file','therapist_portal'),(1171,'chat_attachment.caption','Caption','therapist_portal'),(1172,'placeholder.type.message','Type message','therapist_portal'),(1173,'placeholder.disabled.chat','You can\'t send message or make a call right now because this patient is not active.','therapist_portal'),(1174,'common.error_message_invalid_file_size','Please select a file less than or equal to ${size} MB','therapist_portal'),(1175,'common.toggle_fullscreen','Toggle fullscreen','therapist_portal'),(1176,'common.download','Download','therapist_portal'),(1177,'common.zoom','Zoom','therapist_portal'),(1178,'common.total_patient','Total number of patients','therapist_portal'),(1179,'common.ongoing_treatment','Ongoing Treatment Plan','therapist_portal'),(1180,'dashboard.total_patient_by_gender','Total number of patients by gender','therapist_portal'),(1181,'dashboard.total_patient_by_age','Total number of patients by age','therapist_portal'),(1182,'dashboard.total_ongoing_treatment_by_age','Total number of on-going treatment plan by age','therapist_portal'),(1183,'dashboard.total_ongoing_treatment_by_gender','Total number of on-going treatment plan by gender','therapist_portal'),(1184,'common.male','Male','therapist_portal'),(1185,'common.female','Female','therapist_portal'),(1186,'common.other','Other','therapist_portal'),(1187,'common.year','years','therapist_portal'),(1188,'common.no_file_translate','No file translated','therapist_portal'),(1189,'error_message.ongoing_treatment_create.full_limit','You have more than ${number} overlapping treatment plans. Please check the dates so that you do not exceed your possible on-going treatment plan limit.','therapist_portal'),(1190,'common.clear_all','Clear All','therapist_portal'),(1191,'common.copy_all','Copy All','therapist_portal'),(1192,'common.copy_to','Copy to','therapist_portal'),(1193,'common.of','of','therapist_portal'),(1194,'common.paste','Paste','therapist_portal'),(1195,'activity.copy_all_content_and_paste_to','Copy All Content And Paste To','therapist_portal'),(1196,'activity.copy.day.error','Please select day','therapist_portal'),(1197,'activity.copy.week.error','Please select week','therapist_portal'),(1198,'activity.copy.week_and_day.error','Please select week and day','therapist_portal'),(1199,'video_call_starting','Calling...','therapist_portal'),(1200,'video_call_started','Video call started.','therapist_portal'),(1201,'video_call_ended','Video call ended.','therapist_portal'),(1202,'video_call_missed','Missed video call.','therapist_portal'),(1203,'jitsi_call_audio_started','Call started.','therapist_portal'),(1204,'jitsi_call_video_started','Video call started.','therapist_portal'),(1205,'jitsi_call_audio_missed','Missed call.','therapist_portal'),(1206,'jitsi_call_video_missed','Missed video call.','therapist_portal'),(1207,'jitsi_call_audio_ended','Call ended.','therapist_portal'),(1208,'jitsi_call_video_ended','Video call ended.','therapist_portal'),(1209,'jitsi_call_accepted','Call accepted.','therapist_portal'),(1210,'jitsi_call_busy','Call busy.','therapist_portal'),(1211,'patient.activate_account','Activate Account','therapist_portal'),(1212,'patient.activate_deactivate_confirmation_title','Patient Activate/Deactivate Account','therapist_portal'),(1213,'patient.activate','activate','therapist_portal'),(1214,'patient.deactivate','deactivate','therapist_portal'),(1215,'patient.activate_deactivate_confirmation_message','Are you sure want to ${status} this patient account ?','therapist_portal'),(1216,'patient.new_patient_assigned_notification','You are added as a secondary therapist of patient ${name}.','therapist_portal'),(1217,'success_message.activate_deactivate_account','This patient account ${status}d successfully','therapist_portal'),(1218,'toast_title.activate_deactivate_patient_account','Activate/Deactivate account','therapist_portal'),(1219,'common.profession','Profession','therapist_portal'),(1220,'placeholder.profession','Please select a profession','therapist_portal'),(1221,'treatment_plan.save_as_preset_title','Save Treatment As Preset','therapist_portal'),(1222,'activity.preset_treatment','Preset Treatments','therapist_portal'),(1223,'treatment_plan.add_preset_to_treatment_plan','Add Preset Treatment to Treatment Plan','therapist_portal'),(1224,'common.add_preset_to_treatment_plan_message_without_selected_activity','Do you want to add the activities of this preset template to your treatment plan?','therapist_portal'),(1225,'common.add_preset_to_treatment_plan_message_with_selected_activity','You have ${number} activities in your selection drawer. Adding the activities of this preset template to your treatment plan will remove the selected activities. Do you want to continue?','therapist_portal'),(1226,'profile.faq','FAQ','therapist_portal'),(1227,'profile.tc','Term and Condition','therapist_portal'),(1228,'profile.pp','Privacy Policy','therapist_portal'),(1229,'error_message.treatment_plan_disease_required','Please choose disease','therapist_portal'),(1230,'appointment.status.accept','Accepted','therapist_portal'),(1231,'appointment.status.pending','Pending acceptation','therapist_portal'),(1232,'appointment.status.cancel','Cancelled','therapist_portal'),(1233,'error_message.organization_not_found','Organization not found','therapist_portal'),(1234,'common.welcome','Welcome','patient_app'),(1235,'common.back','Back','patient_app'),(1236,'common.close','Close','patient_app'),(1237,'common.cancel','Cancel','patient_app'),(1238,'common.next','Next','patient_app'),(1239,'common.yes','Yes','patient_app'),(1240,'common.no','No','patient_app'),(1241,'common.ok','OK','patient_app'),(1242,'common.send','Send','patient_app'),(1243,'common.edit','Edit','patient_app'),(1244,'common.submit','Submit','patient_app'),(1245,'common.submitted','Submitted','patient_app'),(1246,'common.confirm','Confirm','patient_app'),(1247,'common.download','Download','patient_app'),(1248,'common.login','Login','patient_app'),(1249,'common.login.fail','Login Failed','patient_app'),(1250,'common.logout','Logout','patient_app'),(1251,'common.language','Language','patient_app'),(1252,'common.gender','Gender','patient_app'),(1253,'common.name','Name','patient_app'),(1254,'common.register','Register','patient_app'),(1255,'common.save','Save','patient_app'),(1256,'common.loading','Loading','patient_app'),(1257,'common.hi','Hi','patient_app'),(1258,'common.completed','Completed','patient_app'),(1259,'common.of_total_number','of ${number}','patient_app'),(1260,'common.today','Today','patient_app'),(1261,'common.country','Country','patient_app'),(1262,'common.phone','Phone Number','patient_app'),(1263,'common.email','Email','patient_app'),(1264,'common.search','Search','patient_app'),(1265,'common.type.media','Media','patient_app'),(1266,'common.type.pdf','PDF','patient_app'),(1267,'common.type.archive','Archive','patient_app'),(1268,'common.type.text','Text','patient_app'),(1269,'common.type.image','Image','patient_app'),(1270,'common.type.document','Document','patient_app'),(1271,'common.type.spreadsheet','Spreadsheet','patient_app'),(1272,'common.type.presentation','Presentation','patient_app'),(1273,'common.type.unknown','Unknown','patient_app'),(1274,'common.powered_by','Powered by','patient_app'),(1275,'common.supported_by','Supported by','patient_app'),(1276,'common.week','Week','patient_app'),(1277,'common.day','Day','patient_app'),(1278,'common.delete','Delete','patient_app'),(1279,'common.downloading','Downloading...','patient_app'),(1280,'common.install','Install','patient_app'),(1281,'common.theme.kid','Kid Theme','patient_app'),(1282,'common.start','Start','patient_app'),(1283,'common.tasks_done','tasks done','patient_app'),(1284,'common.activity','Activity','patient_app'),(1285,'common.activities','Activity(s)','patient_app'),(1286,'preferences','Preferences','patient_app'),(1287,'tab.home','Home','patient_app'),(1288,'tab.activities','Activities','patient_app'),(1289,'tab.goals','Goals','patient_app'),(1290,'tab.appointments','Appointments','patient_app'),(1291,'request.appointment','Request appointment','patient_app'),(1292,'tab.messages','Messages','patient_app'),(1293,'menu.user.profile','User Profile','patient_app'),(1294,'menu.privacy','Privacy Policy','patient_app'),(1295,'menu.about.app','About the App','patient_app'),(1296,'user.download_my_data','Download My Data','patient_app'),(1297,'user.delete','Delete User','patient_app'),(1298,'user.request_to_delete','User Deletion','patient_app'),(1299,'user.are_you_sure_to_delete','Are you sure to delete user?','patient_app'),(1300,'user.delete.success','User has been deleted successfully','patient_app'),(1301,'user.delete.failed','User cannot be deleted','patient_app'),(1302,'user.session','Session','patient_app'),(1303,'user.session_expired','Session has been expired.','patient_app'),(1304,'phone.number','Mobile number','patient_app'),(1305,'phone.number.header','Mobile Number','patient_app'),(1306,'phone.enter.number','Enter your mobile number','patient_app'),(1307,'phone.verify','Verify Phone','patient_app'),(1308,'phone.send.to','Send to','patient_app'),(1309,'phone.dont.receive.code','I didn\'t receive a code!','patient_app'),(1310,'phone.resend.code','Resend Code','patient_app'),(1311,'phone.send.verification.code','Send me verification code','patient_app'),(1312,'phone.login.other.number','Login with other number','patient_app'),(1313,'phone.current.number','Current number','patient_app'),(1314,'phone.new.number','Enter new number','patient_app'),(1315,'phone.change.description','A verification code will be sent to this number.','patient_app'),(1316,'home.activities.today','Activities today','patient_app'),(1317,'home.no.activity.for.today','No activity for today.','patient_app'),(1318,'gender.male','Male','patient_app'),(1319,'gender.female','Female','patient_app'),(1320,'gender.other','Other','patient_app'),(1321,'date.of.birth','Date of Birth','patient_app'),(1322,'edit.profile.title','Edit Profile','patient_app'),(1323,'pin.change','Change PIN','patient_app'),(1324,'pin.confirmation','PIN Confirmation','patient_app'),(1325,'pin.setup.number','Set up PIN number','patient_app'),(1326,'pin.enter.number','Enter PIN number','patient_app'),(1327,'pin.new.number','New PIN number','patient_app'),(1328,'pin.confirm.number','Confirm new PIN number','patient_app'),(1329,'pin.forget','I forgot my PIN','patient_app'),(1330,'welcome.user','Hi, ${name}!','patient_app'),(1331,'activity.none','No activity for today.','patient_app'),(1332,'activity.today','Activities today','patient_app'),(1333,'activity.activity_number','Activity ${number}','patient_app'),(1334,'activity.complete_task_number','Complete Task ${number}','patient_app'),(1335,'activity.completed_task_number','Completed Task ${number}','patient_app'),(1336,'activity.task_detail','Task Details','patient_app'),(1337,'activity.results','Results','patient_app'),(1338,'activity.pain_level.question','How did it feel?','patient_app'),(1339,'activity.pain_level.no_paint','No Pain','patient_app'),(1340,'activity.pain_level.worst_paint','Worst Pain','patient_app'),(1341,'activity.sets_reps.completed_label','I completed','patient_app'),(1342,'activity.sets','Sets','patient_app'),(1343,'activity.reps','Reps','patient_app'),(1344,'activity.number_of_sets','${number} sets','patient_app'),(1345,'activity.number_of_reps','${number} reps','patient_app'),(1346,'activity.number_of_sets_and_reps','${sets} sets - ${reps} reps','patient_app'),(1347,'activity.completed','Completed','patient_app'),(1348,'activity.no.task.for.this.day','No task for this day.','patient_app'),(1349,'activity.to_do','To-do','patient_app'),(1350,'activity.material','EDUCATION MATERIAL','patient_app'),(1351,'activity.questionnaire','QUESTIONNAIRE','patient_app'),(1352,'activity.question','Question','patient_app'),(1353,'activity.questions','questions','patient_app'),(1354,'activity.goal.satisfaction','SATISFACTION','patient_app'),(1355,'activity.goal.detail.title','Satisfaction','patient_app'),(1356,'activity.goal.daily','Daily','patient_app'),(1357,'activity.goal.weekly','Weekly','patient_app'),(1358,'activity.goal.detail.question','Are you satisfied with reaching your goal?','patient_app'),(1359,'activity.satisfaction_level.no_satisfaction','No satisfaction','patient_app'),(1360,'activity.satisfaction_level.extreme_satisfaction','Extreme satisfaction','patient_app'),(1361,'activity.continue','Continue','patient_app'),(1362,'activity.previous','Previous','patient_app'),(1363,'activity.enter_your_answer','Enter your answer','patient_app'),(1364,'activity.file_attachment','File attachment','patient_app'),(1365,'activity.file_has_been_downloaded_successfully','File has been downloaded successfully.','patient_app'),(1366,'activity.additional_information','Additional Information','patient_app'),(1367,'activity.daily_reminder','You have','patient_app'),(1368,'appointment','Appointment','patient_app'),(1369,'appointments','Appointments','patient_app'),(1370,'appointment.request_appointment','Request appointment','patient_app'),(1371,'appointment.request_new_appointment','Request new appointment','patient_app'),(1372,'appointment.edit_appointment','Edit appointment','patient_app'),(1373,'appointment.appointment_with','Appointment with','patient_app'),(1374,'appointment.invitation.accept','Accept','patient_app'),(1375,'appointment.invitation.reject','Reject','patient_app'),(1376,'appointment.show_more','Show more (${number})','patient_app'),(1377,'appointment.no_appointment','No appointment','patient_app'),(1378,'appointment.invitation.accept_title','Accept Appointment','patient_app'),(1379,'appointment.are_you_sure_to_accept_invitation','Are you sure to accept appointment?','patient_app'),(1380,'appointment.invitation.reject_title','Reject Appointment','patient_app'),(1381,'appointment.are_you_sure_to_reject_invitation','Are you sure to reject appointment?','patient_app'),(1382,'appointment.pending_request_for_cancellation','Pending request for cancellation','patient_app'),(1383,'appointment.request_has_been_submitted_successfully','Request has been submitted successfully.','patient_app'),(1384,'appointment.choose_therapist','Choose therapist','patient_app'),(1385,'appointment.placeholder.date','Please select date','patient_app'),(1386,'appointment.placeholder.start','Please select start time','patient_app'),(1387,'appointment.placeholder.end','Please select end time','patient_app'),(1388,'appointment.placeholder.note','Enter note','patient_app'),(1389,'appointment.label.date','Date','patient_app'),(1390,'appointment.label.from','From','patient_app'),(1391,'appointment.label.to','To','patient_app'),(1392,'appointment.label.note','Note','patient_app'),(1393,'appointment.alert.title','Delete appointment','patient_app'),(1394,'appointment.alert.content','Are you sure you want to delete this appointment?','patient_app'),(1395,'appointment.invitation_appointment_with','Invitation: Appointment with','patient_app'),(1396,'appointment.updated_appointment_with','Updated: Appointment with','patient_app'),(1397,'appointment.deleted_appointment_with','Deleted: Appointment with','patient_app'),(1398,'term.of.service','Terms of Services','patient_app'),(1399,'term.of.service.agree','I agree to Terms of Service.','patient_app'),(1400,'term.of.service.detail','Terms of Services Detail','patient_app'),(1401,'term.of.service.detail.link','View Hi humanity & inclusion Terms of Services','patient_app'),(1402,'term.of.service.not_found','There is no Terms of Services defined yet.','patient_app'),(1403,'success.message.phone.changed','Your new mobile phone number is updated successfully.','patient_app'),(1404,'success.message.pin.setup','Your PIN number is set up successfully.','patient_app'),(1405,'success.message.edit.profile','Your profile updated successfully.','patient_app'),(1406,'error.message.phone.created','This number is not created account. Please contact your therapist to create an account for you.','patient_app'),(1407,'error.message.phone.changed','Your new mobile phone number is not updated successfully.','patient_app'),(1408,'error.message.pin.changed','Your PIN number is not set up successfully.','patient_app'),(1409,'error.message.edit.profile','Error while processing.','patient_app'),(1410,'error.message.pin.confirmed','PIN number is not correct.','patient_app'),(1411,'error.message.pin.setup.not.match','PIN number does not match.','patient_app'),(1412,'error.message.internal.server','Internal server error.','patient_app'),(1413,'error.message.incorrect.code','Incorrect code','patient_app'),(1414,'error.message.therapist','Please select therapist','patient_app'),(1415,'error_message.appointment_overlap','There is already an appointment between selected datetime.','patient_app'),(1416,'error.message.last.name','Please fill in the last name','patient_app'),(1417,'error.message.first.name','Please fill in the first name','patient_app'),(1418,'error.message.choose.therapist','Please choose a therapist','patient_app'),(1419,'error.message.select.date','Please select date','patient_app'),(1420,'error.message.select.time','Please select time','patient_app'),(1421,'prompt.enter.code','Please enter the correct code or resend a new code.','patient_app'),(1422,'wrong.pin','Incorrect PIN or Account. Please try again.','patient_app'),(1423,'placeholder.phone','Enter phone number','patient_app'),(1424,'placeholder.email','Enter email','patient_app'),(1425,'error.message.email','Please fill in the correct email','patient_app'),(1426,'first.name','First Name','patient_app'),(1427,'last.name','Last Name','patient_app'),(1428,'app.version','App version','patient_app'),(1429,'placeholder.type.message','Type message','patient_app'),(1430,'chat_message.server_down','Chat server is temporary down. Please contact your administrator.','patient_app'),(1431,'chat_message.therapist_is_not_online','Your therapist can\'t reply instantly now. Will get back to you soon.','patient_app'),(1432,'chat_message.therapist_in_not_active','This therapist is not active. You can\'t send message right now.','patient_app'),(1433,'chat_message.history','User Chat/Video Call History','patient_app'),(1434,'chat_attachment.title','Send attachment file','patient_app'),(1435,'chat_message.daily_reminder','You have','patient_app'),(1436,'chat_message.unread_message','Unread messages','patient_app'),(1437,'edit.profile.discard.message','Do you want to discard your changes?','patient_app'),(1438,'common.error_message_invalid_file_size','Please select a file less than or equal to ${size} MB','patient_app'),(1439,'add_a_caption','Add a caption','patient_app'),(1440,'all_photos','All photos','patient_app'),(1441,'all_videos','All videos','patient_app'),(1442,'no_photo','No photo','patient_app'),(1443,'video_on','Video on','patient_app'),(1444,'video_off','Video off','patient_app'),(1445,'speaker_on','Speaker on','patient_app'),(1446,'speaker_off','Speaker off','patient_app'),(1447,'mute','Mute','patient_app'),(1448,'unmute','Unmute','patient_app'),(1449,'accept_call','Accept','patient_app'),(1450,'decline_call','Decline','patient_app'),(1451,'video_call_starting','Calling...','patient_app'),(1452,'video_call_started','Video call started.','patient_app'),(1453,'video_call_ended','Video call ended.','patient_app'),(1454,'video_call_missed','Missed video call.','patient_app'),(1455,'jitsi_call_audio_started','Call started.','patient_app'),(1456,'jitsi_call_video_started','Video call started.','patient_app'),(1457,'jitsi_call_audio_missed','Missed call.','patient_app'),(1458,'jitsi_call_video_missed','Missed video call.','patient_app'),(1459,'jitsi_call_audio_ended','Call ended.','patient_app'),(1460,'jitsi_call_video_ended','Video call ended.','patient_app'),(1461,'jitsi_call_busy','Call busy.','patient_app'),(1462,'age.single_year','Year','patient_app'),(1463,'age.plural_year','Years','patient_app'),(1464,'age.single_month','Month','patient_app'),(1465,'age.plural_month','Months','patient_app'),(1466,'age.single_day','Day','patient_app'),(1467,'age.plural_day','Days','patient_app'),(1468,'common.offline','You are working offline!','patient_app'),(1469,'pin.setup.title','Enter your new PIN and verify to confirm PIN change','patient_app'),(1470,'pin.confirmation.title','Enter your current PIN to confirm','patient_app'),(1471,'privacy.policy.agree','I agree to Privacy Policy.','patient_app'),(1472,'privacy.policy.detail','Privacy Policy Detail','patient_app'),(1473,'privacy.policy.detail.link','View Hi humanity & inclusion Privacy Policy','patient_app'),(1474,'privacy.policy.not_found','There is no Privacy Policy defined yet.','patient_app'),(1475,'menu.faq','FAQ','patient_app'),(1476,'menu.tc','Term and Condition','patient_app'),(1477,'menu.pp','Privacy Policy','patient_app'),(1478,'tts_message.no_engine_installed','Your device does not have text to speech engine installed.','patient_app'),(1479,'tts_message.no_voice_supported','Your device does not support your preferred language for text to speech. It will fallback to use English.','patient_app'),(1480,'tts.question.selected','You selected','patient_app'),(1481,'tts.question.answered','You answered','patient_app'),(1482,'appointment.status.accept','Accepted','patient_app'),(1483,'appointment.status.pending','Pending acceptation','patient_app'),(1484,'appointment.status.cancel','Cancelled','patient_app'),(1485,'appointment.daily_reminder','You have','patient_app'),(1486,'register.phone.label','Enter phone number','patient_app'),(1487,'register.language.label','Choose language','patient_app'),(1488,'register.placeholder.phone','xx-xxx-xxx','patient_app'),(1489,'register.intro_text','Choose language which you feels comfortable with to start our mobile application','patient_app'),(1490,'phone.verify_description','Pincode has been sent to ${phone}, please enter the code recieved from SMS.','patient_app'),(1491,'home.activity.completed','You have done ${number} tasks today','patient_app'),(1492,'achievement.tasks.bronze.title','[Bronze] Daily tasks','patient_app'),(1493,'achievement.tasks.silver.title','[Silver] Daily tasks','patient_app'),(1494,'achievement.tasks.gold.title','[Gold] Daily tasks','patient_app'),(1495,'achievement.tasks.diamond.title','[Diamond] Daily tasks','patient_app'),(1496,'achievement.tasks.bronze.subtitle','Finish tasks 5 days streak','patient_app'),(1497,'achievement.tasks.silver.subtitle','Finish tasks 15 days streak','patient_app'),(1498,'achievement.tasks.gold.subtitle','Finish tasks 25 days streak','patient_app'),(1499,'achievement.tasks.diamond.subtitle','Finish tasks 35 days streak','patient_app'),(1500,'achievement.logins.bronze.title','[Bronze] Daily logins','patient_app'),(1501,'achievement.logins.silver.title','[Silver] Daily logins','patient_app'),(1502,'achievement.logins.gold.title','[Gold] Daily logins','patient_app'),(1503,'achievement.logins.diamond.title','[Diamond] Daily logins','patient_app'),(1504,'achievement.logins.bronze.subtitle','Login 4 days streak','patient_app'),(1505,'achievement.logins.silver.subtitle','Login 8 days streak','patient_app'),(1506,'achievement.logins.gold.subtitle','Login 12 days streak','patient_app'),(1507,'achievement.logins.diamond.subtitle','Login 16 days streak','patient_app'),(1508,'achievement.answers.bronze.title','[Bronze] Answer like genius','patient_app'),(1509,'achievement.answers.silver.title','[Silver] Answer like genius','patient_app'),(1510,'achievement.answers.gold.title','[Gold] Answer like genius','patient_app'),(1511,'achievement.answers.diamond.title','[Diamond] Answer like genius','patient_app'),(1512,'achievement.answers.bronze.subtitle','Complete 2 questionnaires','patient_app'),(1513,'achievement.answers.silver.subtitle','Complete 5 questionnaires','patient_app'),(1514,'achievement.answers.gold.subtitle','Complete 8 questionnaires','patient_app'),(1515,'achievement.answers.diamond.subtitle','Complete 11 questionnaires','patient_app'),(1516,'activity.step','Step ${step}','patient_app'),(1517,'activity.pain_level.description','Rate your painfulness after you did the activity from scale of 1 to 10','patient_app'),(1518,'activity.sets_reps.completed_description','Number of sets and reps you have done.','patient_app'),(1519,'activity.sets_reps.recommend','Recommend ${number}','patient_app'),(1520,'activity.completed.title','You have completed the task!','patient_app'),(1521,'activity.completed.description','Just a few more tasks, you can do it.','patient_app'),(1522,'activity.completed.button_title','Got that','patient_app'),(1523,'activity.completed.kid_title','Yay! You have completed the task!','patient_app'),(1524,'activity.completed.kid_description','Just a few more tasks, you will earn badges as the reward.','patient_app'),(1525,'activity.completed.kid_button_title','Got that','patient_app');
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
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `first_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `last_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `country_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `clinic_id` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `enabled` tinyint(1) NOT NULL DEFAULT '0',
  `gender` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `language_id` int DEFAULT NULL,
  `last_login` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (26,'super-admin@we.co',NULL,NULL,NULL,'2022-10-19 11:09:24','2022-10-19 11:12:32','Super','Admin','super_admin',NULL,NULL,1,NULL,NULL,'2022-10-19 11:12:32'),(27,'organization-admin@we.co',NULL,NULL,NULL,'2022-10-20 00:59:17','2022-10-20 01:41:43','HI-Admin','HI-Admin','organization_admin',NULL,NULL,1,NULL,NULL,'2022-10-20 01:41:43'),(28,'country-admin@we.co',NULL,NULL,NULL,'2022-10-20 02:07:21','2022-10-20 02:09:46','Country','Admin','country_admin','1',NULL,1,NULL,NULL,'2022-10-20 02:09:46'),(29,'country-vn-admin@we.co',NULL,NULL,NULL,'2022-10-20 02:07:55','2022-10-20 02:08:10','Admin','Country VN','country_admin','2',NULL,1,NULL,NULL,NULL),(30,'clinic-admin@we.co',NULL,NULL,NULL,'2022-10-20 02:19:38','2022-10-20 02:21:13','Clinic','Admin','clinic_admin','1','1',1,NULL,NULL,'2022-10-20 02:21:13');
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

-- Dump completed on 2022-10-20  6:19:43
