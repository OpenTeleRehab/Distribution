-- MySQL dump 10.13  Distrib 8.0.29, for Linux (x86_64)
--
-- Host: localhost    Database: keycloak
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
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

DROP TABLE IF EXISTS `ADMIN_EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ADMIN_EVENT_TIME` bigint DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_PATH` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `REPRESENTATION` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ADMIN_EVENT_ENTITY`
--

LOCK TABLES `ADMIN_EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ADMIN_EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ASSOCIATED_POLICY`
--

DROP TABLE IF EXISTS `ASSOCIATED_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`),
  CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSOCIATED_POLICY`
--

LOCK TABLES `ASSOCIATED_POLICY` WRITE;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `ASSOCIATED_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

DROP TABLE IF EXISTS `AUTHENTICATION_EXECUTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUIREMENT` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`),
  CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_EXECUTION`
--

LOCK TABLES `AUTHENTICATION_EXECUTION` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_EXECUTION` VALUES ('0070b0f7-5f94-4bd8-a39d-82b2ef3e60bb',NULL,'reset-credentials-choose-user','hi-library','86d53555-aa8c-4450-b9b4-689ef6b89237',0,10,_binary '\0',NULL,NULL),('00dc3eb3-445a-4da9-8066-f587cb113b9e',NULL,'idp-username-password-form','hi-library','04b9ee68-1431-46da-9270-562bc0ea65a0',0,10,_binary '\0',NULL,NULL),('01088b20-c04e-4370-a6ef-f8766f6a8166',NULL,'client-secret-jwt','hi-library','771a017f-b3b2-42cc-bd96-5efb4194b4f3',2,30,_binary '\0',NULL,NULL),('0366d2a0-98d0-4c33-a9ed-aacb78f169ae',NULL,'basic-auth-otp','hi-therapist','71d715ae-8c07-48e0-8ffa-720ca11769dd',3,20,_binary '\0',NULL,NULL),('042295cd-66a8-4c21-b070-c6de60c6ad15',NULL,'http-basic-authenticator','hi-therapist','154d7176-6361-4860-b35a-e2810e063949',0,10,_binary '\0',NULL,NULL),('0442d773-34f5-4a44-a0fd-3e1934465a44',NULL,NULL,'hi','303203d5-c1bc-416b-a867-b7068c50dd6b',0,20,_binary '','ff916a77-3b7d-4c99-90f1-eb2743de4556',NULL),('04966a10-d4c7-4899-b9da-f6ecea3c6731',NULL,NULL,'hi-library','b098feb5-cefa-4703-b4b2-3bb8251b23bb',0,20,_binary '','8b82f6f2-5d80-4c54-8e32-97793ed2820c',NULL),('04f03c41-146c-4bed-9993-cd5edead7910',NULL,'auth-otp-form','hi-therapist','ce67fa0a-8154-4517-96ff-80865d4a33eb',0,20,_binary '\0',NULL,NULL),('05b6807c-5b76-4286-a79b-80522bba46b3',NULL,'conditional-user-configured','master','cc88f872-abf7-4adf-a2cf-a6753fe97f23',0,10,_binary '\0',NULL,NULL),('05d385a8-2928-4ca7-a9e3-57e54eb6b4b6',NULL,'direct-grant-validate-username','hi-therapist','c20c2475-99eb-40e6-bae2-a8f5540087f8',0,10,_binary '\0',NULL,NULL),('05e2b281-128c-4e6d-9313-7666ac88647e',NULL,'conditional-user-configured','hi-library','b1963215-6900-4985-9900-81fc8d52c558',0,10,_binary '\0',NULL,NULL),('0a0a8a67-343c-492d-82f2-5871e9cad678',NULL,'conditional-user-configured','master','fdc23882-4b2f-4be7-be4d-66d4aacb93ba',0,10,_binary '\0',NULL,NULL),('0b81b189-a380-4eb0-9f79-aefa9a027747',NULL,'conditional-user-configured','hi','d1e7816f-3d2e-4827-88f9-f13791372f96',0,10,_binary '\0',NULL,NULL),('0c1b9f04-e162-4bf7-aadf-52c35ea5737d',NULL,'registration-page-form','hi-therapist','b23d3bf9-6083-41cd-b142-f6f0f2933503',0,10,_binary '','44542ee4-adec-4b17-a698-88a5fc0161e5',NULL),('0c36db14-a30d-4f07-83c2-b21d66dadc11',NULL,'reset-password','hi-library','86d53555-aa8c-4450-b9b4-689ef6b89237',0,30,_binary '\0',NULL,NULL),('0ff0f941-c59d-42ab-bc22-4f8f87c44e06',NULL,'docker-http-basic-authenticator','hi-therapist','f0ba7e18-930e-4784-962d-1d5a99b9a30f',0,10,_binary '\0',NULL,NULL),('10b43038-06ba-4e49-9603-59429164ba74',NULL,'conditional-user-configured','master','189397a6-560e-4f8f-a1e8-081196ea3454',0,10,_binary '\0',NULL,NULL),('119c57ed-860b-4b02-8148-43e3336302cc',NULL,'client-x509','master','d4ae44af-6da9-417e-be64-94ae459a46cd',2,40,_binary '\0',NULL,NULL),('1259de47-582c-4f42-9f76-067194896584',NULL,'direct-grant-validate-otp','master','cd454593-1127-49ea-a307-811b6357614e',0,20,_binary '\0',NULL,NULL),('14b20744-363b-429c-8390-dc253138a505',NULL,'identity-provider-redirector','master','409ff595-7f9b-40bb-8844-ae4ec74e24ef',2,25,_binary '\0',NULL,NULL),('152cb24a-f573-4f54-bd5b-76b57b805c78',NULL,'reset-credential-email','hi-library','86d53555-aa8c-4450-b9b4-689ef6b89237',0,20,_binary '\0',NULL,NULL),('162a1fc1-d38d-4637-81cd-6271b053668d',NULL,'idp-email-verification','hi-therapist','bb820aac-5aed-4cc1-ba22-066178f172b9',2,10,_binary '\0',NULL,NULL),('171ecff2-9f01-4573-899d-1cd800447c75',NULL,'auth-otp-form','hi','d1e7816f-3d2e-4827-88f9-f13791372f96',0,20,_binary '\0',NULL,NULL),('17a818c6-0b85-4a51-95a3-44cee6dfd9a7',NULL,'auth-cookie','hi-therapist','10d3d303-a637-49d9-a0d2-18e9d85eec96',2,10,_binary '\0',NULL,NULL),('1a1244d2-0646-4749-a535-37542882616a',NULL,'client-secret','master','d4ae44af-6da9-417e-be64-94ae459a46cd',2,10,_binary '\0',NULL,NULL),('1ac49bec-580a-4049-b7d0-91e010dd2c8b',NULL,NULL,'hi','6af89e7f-9873-400c-a6c3-e2dd7d474e26',2,30,_binary '','1f5d23a5-92c1-48cd-8274-561d76718347',NULL),('1d2af78b-603c-4e68-9e88-aae36454a5c3',NULL,'registration-user-creation','hi-therapist','44542ee4-adec-4b17-a698-88a5fc0161e5',0,20,_binary '\0',NULL,NULL),('1e29f4b1-19e2-4040-95cc-beac80922b94',NULL,'registration-profile-action','master','5475d611-08c0-483f-9eb1-cb16f32b8de1',0,40,_binary '\0',NULL,NULL),('1e2a1ff6-2902-4912-aa9e-ceeee2e9e729',NULL,'client-jwt','hi','b236e1ef-ac1b-442f-a7e8-814031aabdc6',2,20,_binary '\0',NULL,NULL),('1e7770b2-8d6f-45d9-a658-4b32d47b0d1f',NULL,'registration-profile-action','hi-therapist','44542ee4-adec-4b17-a698-88a5fc0161e5',0,40,_binary '\0',NULL,NULL),('1f2d2f0f-9f42-4c48-8e7f-133a2091ea33',NULL,'conditional-user-configured','master','cd454593-1127-49ea-a307-811b6357614e',0,10,_binary '\0',NULL,NULL),('1f4b4b3c-5220-48e2-b236-ab7c5b5b91d9',NULL,'basic-auth','hi-therapist','71d715ae-8c07-48e0-8ffa-720ca11769dd',0,10,_binary '\0',NULL,NULL),('21d5c0d0-6c3e-4ebd-a080-579048ba282a',NULL,'auth-otp-form','master','189397a6-560e-4f8f-a1e8-081196ea3454',0,20,_binary '\0',NULL,NULL),('2251a790-735f-4923-a54f-f6cab8d5febc',NULL,'no-cookie-redirect','hi-therapist','8822a9b7-f051-4879-8a15-44a5dfb29f53',0,10,_binary '\0',NULL,NULL),('2aad27a6-0bd2-4b68-8ecc-2dc6f05139bc',NULL,NULL,'hi-library','f82fe0eb-3847-49e2-91e4-c850cce954ad',2,20,_binary '','04b9ee68-1431-46da-9270-562bc0ea65a0',NULL),('2e3fef15-498f-4dfe-ab45-e3cdcc58c5c2',NULL,'basic-auth','hi','803d6da2-472d-4b8e-8c9c-8bb61b47bac3',0,10,_binary '\0',NULL,NULL),('3303ce8b-ce3e-44ff-a51a-a0677fb023cc',NULL,'idp-email-verification','hi','86fcfd67-d7ad-491f-b88f-a59359caa6a3',2,10,_binary '\0',NULL,NULL),('34aacf58-2ef5-4e2e-ad10-76510157d3b0',NULL,'registration-user-creation','master','5475d611-08c0-483f-9eb1-cb16f32b8de1',0,20,_binary '\0',NULL,NULL),('34cac1aa-ad98-49ba-a06d-b9eefefdafaa',NULL,NULL,'master','409ff595-7f9b-40bb-8844-ae4ec74e24ef',2,30,_binary '','7935b686-21bc-4f79-b519-e3cf911fc969',NULL),('352e7c86-9b30-4218-8061-c4891ef2f003',NULL,'idp-confirm-link','master','b063915c-4522-4b14-a103-dcf8d6da58c1',0,10,_binary '\0',NULL,NULL),('38c4b14b-70d1-4f35-8059-3f1749c61e3b',NULL,NULL,'master','7935b686-21bc-4f79-b519-e3cf911fc969',1,20,_binary '','189397a6-560e-4f8f-a1e8-081196ea3454',NULL),('390f262c-ffd4-43e5-9332-67e2edfc8856',NULL,'conditional-user-configured','hi-therapist','b7c5d1bd-3abf-43d3-937b-2c61982ad707',0,10,_binary '\0',NULL,NULL),('39acfdeb-3484-460d-816d-61032c7cff33',NULL,NULL,'hi-therapist','3035bfb3-6876-4a72-90fb-a94a1aa2eb69',2,20,_binary '','2bb04c4e-fca4-4cfd-a71b-76d86b4211ec',NULL),('3a47562c-1d92-4265-921c-8a00cb065cd6',NULL,'direct-grant-validate-username','hi','9814995c-54b2-4b8d-a29b-7c23042a5841',0,10,_binary '\0',NULL,NULL),('3f8c6d94-cd46-4f99-aef5-3deb9988189b',NULL,NULL,'hi','1cbd4ec1-8936-4b72-a7da-0aae27b2d91b',0,20,_binary '','803d6da2-472d-4b8e-8c9c-8bb61b47bac3',NULL),('4086d24c-6a02-41df-adc9-7dc32cee2f6d',NULL,'idp-confirm-link','hi-library','f31a779e-6d42-42b8-a3c7-deaf3409763a',0,10,_binary '\0',NULL,NULL),('41a73d32-1b5f-4d7c-ae57-894b7c93bbc0',NULL,'docker-http-basic-authenticator','hi','3f622d53-72a4-4f89-b928-fb3bdb38d30c',0,10,_binary '\0',NULL,NULL),('4227b069-7d03-48bd-ab87-f32974729ece',NULL,NULL,'master','ae98e9f5-b8ff-4db8-87ec-4bc4468f399f',1,40,_binary '','fdc23882-4b2f-4be7-be4d-66d4aacb93ba',NULL),('4372b84f-f4ff-4be2-921e-297e62517e79',NULL,'client-secret','hi-therapist','47659d6f-ddbc-4590-8e49-d3d846d0c73b',2,10,_binary '\0',NULL,NULL),('4428cfa9-1625-40c3-abbd-d77334f29ca1',NULL,NULL,'hi-library','f31a779e-6d42-42b8-a3c7-deaf3409763a',0,20,_binary '','f82fe0eb-3847-49e2-91e4-c850cce954ad',NULL),('451e85c9-6d2a-4511-8a54-5c208bf89eb5',NULL,'direct-grant-validate-username','hi-library','9f8a2c39-2385-4f6e-abe9-040233498045',0,10,_binary '\0',NULL,NULL),('453bb2d6-8780-4b4c-9ac1-61c2a82f2866',NULL,'http-basic-authenticator','hi','ccb1d903-a00d-407d-a11c-fcf98fcc1cb1',0,10,_binary '\0',NULL,NULL),('46515de0-214d-4102-89d6-6d7bc8a7e943',NULL,NULL,'master','1c03e310-bca6-4dc1-9263-324eb1a76a5d',1,20,_binary '','cc88f872-abf7-4adf-a2cf-a6753fe97f23',NULL),('476a0174-18db-4127-9948-8932f4e3f1fc',NULL,'registration-profile-action','hi','5ce57dd0-c070-4ad2-b7f3-80385854d494',0,40,_binary '\0',NULL,NULL),('4a655410-6e26-4c29-8a6e-4e3a6aa014b8',NULL,NULL,'master','31bf0da3-ebb0-46de-b6e7-45571ced2ef8',1,30,_binary '','cd454593-1127-49ea-a307-811b6357614e',NULL),('4a709d33-598f-4518-856e-934899e2a8ab',NULL,'auth-otp-form','hi-therapist','825f4dda-59d5-433f-accc-cdfa3e77ad3d',0,20,_binary '\0',NULL,NULL),('4bf546f7-fce0-4a4e-a42e-d7a5997fcc1f',NULL,'auth-otp-form','hi-library','5d8f0a36-1d62-4589-b105-56d64c03498c',0,20,_binary '\0',NULL,NULL),('4bf7dc7d-92d4-45de-bf48-9a7f0faa1839',NULL,'auth-spnego','hi-library','585f05eb-75b5-47fa-a893-f66cb810c5e7',3,20,_binary '\0',NULL,NULL),('4d582e02-f7cc-4f77-a494-17ba890f2173',NULL,'client-secret','hi-library','771a017f-b3b2-42cc-bd96-5efb4194b4f3',2,10,_binary '\0',NULL,NULL),('4e213202-61d8-41c7-8ba6-7c3e7c1c8e01',NULL,'reset-otp','hi-therapist','0e87f4df-76d0-44af-8245-0e077585a3bc',0,20,_binary '\0',NULL,NULL),('4e59ab5f-ec7e-4d8d-ac95-9c73a199537b',NULL,'registration-user-creation','hi','5ce57dd0-c070-4ad2-b7f3-80385854d494',0,20,_binary '\0',NULL,NULL),('4e6f2559-c17e-4a96-8e20-ab1937c7539d',NULL,'registration-recaptcha-action','hi-therapist','44542ee4-adec-4b17-a698-88a5fc0161e5',3,60,_binary '\0',NULL,NULL),('51350260-5860-4319-9abd-5a06e3e1875c',NULL,'auth-username-password-form','hi-therapist','4deb154d-9bcb-4612-b096-e6f3fc058ad5',0,10,_binary '\0',NULL,NULL),('51f986d3-5d99-454c-8397-91c98a3f9f93',NULL,'direct-grant-validate-otp','hi-therapist','b7c5d1bd-3abf-43d3-937b-2c61982ad707',0,20,_binary '\0',NULL,NULL),('5325ceb7-d1d0-4d82-9716-29ca77715f7e',NULL,'direct-grant-validate-otp','hi','f355f952-6275-4445-b5f3-9a74c835ccd9',0,20,_binary '\0',NULL,NULL),('5392ff84-8a04-4aa0-a9fc-537260b68ebe',NULL,'idp-review-profile','hi-library','933a3282-7d5a-4de0-bcd5-abd8903798dc',0,10,_binary '\0',NULL,'8543f0c5-a19c-4e11-ac7a-642c45e80e12'),('5406f88a-323d-4235-9f0d-92aae31d4893',NULL,'conditional-user-configured','hi-therapist','ce67fa0a-8154-4517-96ff-80865d4a33eb',0,10,_binary '\0',NULL,NULL),('542e49c8-90d2-4b83-b4f6-8150cf719b4d',NULL,'reset-credentials-choose-user','hi-therapist','e8efe948-5fc8-45a0-96c1-fa0f213831ab',0,10,_binary '\0',NULL,NULL),('55944fbb-1e85-4d05-973e-6d3768b4db01',NULL,'client-secret-jwt','master','d4ae44af-6da9-417e-be64-94ae459a46cd',2,30,_binary '\0',NULL,NULL),('55fb6c1d-7bd4-4545-b4bd-0914dbc6d82b',NULL,'conditional-user-configured','hi-therapist','825f4dda-59d5-433f-accc-cdfa3e77ad3d',0,10,_binary '\0',NULL,NULL),('5640ef1e-3d07-4eaa-87cf-7b6f705a6e16',NULL,NULL,'master','c0215fc0-d3b4-4633-8376-208e33f13707',2,20,_binary '','b063915c-4522-4b14-a103-dcf8d6da58c1',NULL),('57ed2caa-4df7-4bec-b2e1-fa8c03f0de14',NULL,'basic-auth','master','169503b0-a37f-42ef-a118-d18a1e567be7',0,10,_binary '\0',NULL,NULL),('5a3980e9-9cf6-4627-b843-461026a37e94',NULL,'idp-username-password-form','hi','5d0a6d6a-132b-439f-a43e-8b075bbb3c5a',0,10,_binary '\0',NULL,NULL),('5bbeffd2-f713-480b-b523-9cbee861af8c',NULL,'idp-create-user-if-unique','hi-library','4ece9989-d7a7-492a-8766-ebc8db40b3e0',2,10,_binary '\0',NULL,'f60f49b4-a623-4cec-b1c1-ad8b9900d121'),('5e171236-da97-4e3c-8d09-9c6a7d8e2177',NULL,'auth-spnego','hi-library','8b82f6f2-5d80-4c54-8e32-97793ed2820c',3,30,_binary '\0',NULL,NULL),('5f297cd1-4ea4-4654-a5ff-d3eceaaa6a8d',NULL,'no-cookie-redirect','hi','1cbd4ec1-8936-4b72-a7da-0aae27b2d91b',0,10,_binary '\0',NULL,NULL),('5ff8cb5c-103f-46b5-b783-9f13d2e29381',NULL,'conditional-user-configured','hi-library','7481304a-61a5-47d8-86a9-8070e418cbbc',0,10,_binary '\0',NULL,NULL),('6083aa5d-88e2-4fa4-b458-7189032dbbdf',NULL,'idp-review-profile','hi-therapist','da5d4cb9-cf3c-4b61-b539-a89e28de8a2f',0,10,_binary '\0',NULL,'74f033c7-47fb-4030-b23a-d1e659654bb1'),('617f1439-3c3c-45fe-84df-667f9e080436',NULL,'auth-spnego','hi','6af89e7f-9873-400c-a6c3-e2dd7d474e26',3,20,_binary '\0',NULL,NULL),('62dec792-32d1-4f94-8074-e77e3f713312',NULL,'identity-provider-redirector','hi-library','585f05eb-75b5-47fa-a893-f66cb810c5e7',2,25,_binary '\0',NULL,NULL),('6563c29b-dff1-4a39-9b43-535b8d0ec1e1',NULL,'direct-grant-validate-password','master','31bf0da3-ebb0-46de-b6e7-45571ced2ef8',0,20,_binary '\0',NULL,NULL),('65b566a2-4aae-429b-8e84-3bd0461edbb5',NULL,NULL,'hi-therapist','a3246479-15bf-4ea4-ac68-7e4e22816e26',1,20,_binary '','825f4dda-59d5-433f-accc-cdfa3e77ad3d',NULL),('65d0d02c-7861-4eba-a1a8-b7bb8960bf75',NULL,NULL,'hi-library','04b9ee68-1431-46da-9270-562bc0ea65a0',1,20,_binary '','b1963215-6900-4985-9900-81fc8d52c558',NULL),('661a160d-072e-40ad-a79c-98db077bc0dd',NULL,'auth-spnego','master','409ff595-7f9b-40bb-8844-ae4ec74e24ef',3,20,_binary '\0',NULL,NULL),('6689511e-99f3-4d0a-908d-c6807bdd1833',NULL,NULL,'hi-therapist','8822a9b7-f051-4879-8a15-44a5dfb29f53',0,20,_binary '','71d715ae-8c07-48e0-8ffa-720ca11769dd',NULL),('66e73a27-6148-4618-9dc2-6445f113847c',NULL,'auth-spnego','master','169503b0-a37f-42ef-a118-d18a1e567be7',3,30,_binary '\0',NULL,NULL),('6990c0af-80f4-4b1d-9e57-0d82bb069cfd',NULL,NULL,'hi-therapist','4deb154d-9bcb-4612-b096-e6f3fc058ad5',1,20,_binary '','ce67fa0a-8154-4517-96ff-80865d4a33eb',NULL),('6a132211-ef1c-4394-ae3b-600420521337',NULL,NULL,'hi-therapist','c20c2475-99eb-40e6-bae2-a8f5540087f8',1,30,_binary '','b7c5d1bd-3abf-43d3-937b-2c61982ad707',NULL),('6c35a51b-571e-4e89-8ef4-d02faf61c5da',NULL,'conditional-user-configured','hi','f355f952-6275-4445-b5f3-9a74c835ccd9',0,10,_binary '\0',NULL,NULL),('6f6d3e51-92bf-4745-887c-62b93402d289',NULL,'basic-auth-otp','hi','803d6da2-472d-4b8e-8c9c-8bb61b47bac3',3,20,_binary '\0',NULL,NULL),('73933201-8b4d-4912-a317-30a49d575881',NULL,'conditional-user-configured','hi-library','5d8f0a36-1d62-4589-b105-56d64c03498c',0,10,_binary '\0',NULL,NULL),('73d5a8b1-7aa4-4f0f-b2f9-e71490b22eca',NULL,'idp-confirm-link','hi-therapist','2bb04c4e-fca4-4cfd-a71b-76d86b4211ec',0,10,_binary '\0',NULL,NULL),('787fa4a6-850e-4a41-802a-d60f1027e9a6',NULL,'auth-otp-form','hi-library','b1963215-6900-4985-9900-81fc8d52c558',0,20,_binary '\0',NULL,NULL),('789483ba-7b04-4afd-b577-078833e6a7f0',NULL,'reset-credentials-choose-user','master','ae98e9f5-b8ff-4db8-87ec-4bc4468f399f',0,10,_binary '\0',NULL,NULL),('7a3cf4d0-afa7-47b4-ac71-3e291f7c3759',NULL,NULL,'hi','13e66f72-1319-4946-9991-4207daad9b35',1,40,_binary '','25c65a0f-9e30-4c21-bbc3-4a86884d8b81',NULL),('7bac99c6-b994-4116-a19f-1901a1722f90',NULL,'client-secret-jwt','hi-therapist','47659d6f-ddbc-4590-8e49-d3d846d0c73b',2,30,_binary '\0',NULL,NULL),('7da6e9b5-4c33-45f3-923d-950ba8cf2c1f',NULL,NULL,'hi-library','9f8a2c39-2385-4f6e-abe9-040233498045',1,30,_binary '','345a879e-5ce2-401d-a956-d612b68107b4',NULL),('7ffcf9b2-acc3-484a-92b9-ce8dcebc1edd',NULL,'registration-recaptcha-action','hi','5ce57dd0-c070-4ad2-b7f3-80385854d494',3,60,_binary '\0',NULL,NULL),('837b9abb-a568-4fdc-9af0-7a1e1c999227',NULL,'reset-otp','hi','25c65a0f-9e30-4c21-bbc3-4a86884d8b81',0,20,_binary '\0',NULL,NULL),('854e40df-4285-4b07-9a6a-d5c4681feaf4',NULL,'conditional-user-configured','hi','44f5ba8e-ed91-41ff-845e-9f4ff6d984e4',0,10,_binary '\0',NULL,NULL),('87f7b138-912c-488d-b6f5-611a5daba996',NULL,'basic-auth-otp','master','169503b0-a37f-42ef-a118-d18a1e567be7',3,20,_binary '\0',NULL,NULL),('8ab93517-a15b-496b-a6ae-afa9b1d77534',NULL,'idp-confirm-link','hi','3d254895-ba78-4190-bf93-35575b81cd5d',0,10,_binary '\0',NULL,NULL),('8e5a540b-a0b7-4ffa-865d-c0a2c442ef5c',NULL,NULL,'hi','9814995c-54b2-4b8d-a29b-7c23042a5841',1,30,_binary '','f355f952-6275-4445-b5f3-9a74c835ccd9',NULL),('922b1fff-27e0-4e2f-b13b-2cdc00f70f2e',NULL,NULL,'hi-library','933a3282-7d5a-4de0-bcd5-abd8903798dc',0,20,_binary '','4ece9989-d7a7-492a-8766-ebc8db40b3e0',NULL),('92c6de9c-ca69-41dd-94b3-fdb3d7bced96',NULL,'client-jwt','hi-library','771a017f-b3b2-42cc-bd96-5efb4194b4f3',2,20,_binary '\0',NULL,NULL),('949d7f01-d8ce-474f-b68e-31a9ee889c44',NULL,'reset-credential-email','master','ae98e9f5-b8ff-4db8-87ec-4bc4468f399f',0,20,_binary '\0',NULL,NULL),('96bd9aa3-cf67-4a63-961c-4823028acb8b',NULL,'idp-email-verification','hi-library','f82fe0eb-3847-49e2-91e4-c850cce954ad',2,10,_binary '\0',NULL,NULL),('9b3c55f9-1293-4154-89b7-78ffc5ea1214',NULL,NULL,'hi-therapist','e8efe948-5fc8-45a0-96c1-fa0f213831ab',1,40,_binary '','0e87f4df-76d0-44af-8245-0e077585a3bc',NULL),('9bd08e2c-372d-4516-9fa3-91fe49fe2dbb',NULL,'reset-password','hi','13e66f72-1319-4946-9991-4207daad9b35',0,30,_binary '\0',NULL,NULL),('9ca162cf-8a78-47e6-8959-3e0ddfab5e8b',NULL,'auth-username-password-form','hi-library','83828641-1b6b-48f1-b873-551506898b70',0,10,_binary '\0',NULL,NULL),('a001b4f9-065f-405a-a78d-3397fb35a595',NULL,NULL,'master','30faa0ec-2358-49c8-a487-efcc4ccf5cbb',0,20,_binary '','169503b0-a37f-42ef-a118-d18a1e567be7',NULL),('a019201d-3e35-4243-99a1-5c5560270962',NULL,'idp-review-profile','hi','303203d5-c1bc-416b-a867-b7068c50dd6b',0,10,_binary '\0',NULL,'f2428f95-6c5c-4642-8dd0-acca1b4317dd'),('a3035f99-095d-440c-bdd6-c93a4fea4348',NULL,'auth-spnego','hi-therapist','71d715ae-8c07-48e0-8ffa-720ca11769dd',3,30,_binary '\0',NULL,NULL),('a3bc5fe1-9df4-4ce0-beb5-0160db925ac9',NULL,'registration-password-action','hi-therapist','44542ee4-adec-4b17-a698-88a5fc0161e5',0,50,_binary '\0',NULL,NULL),('a5a44634-e3c1-4040-814b-b7d88ab63ae4',NULL,'client-x509','hi-library','771a017f-b3b2-42cc-bd96-5efb4194b4f3',2,40,_binary '\0',NULL,NULL),('a6041a42-186f-4392-a70b-9050dadf1679',NULL,'registration-password-action','hi','5ce57dd0-c070-4ad2-b7f3-80385854d494',0,50,_binary '\0',NULL,NULL),('a987df44-7ede-4271-b843-75fbfe77c70f',NULL,'conditional-user-configured','hi','25c65a0f-9e30-4c21-bbc3-4a86884d8b81',0,10,_binary '\0',NULL,NULL),('ab33a7a9-637b-4d3d-baff-df0b9c050042',NULL,'reset-password','hi-therapist','e8efe948-5fc8-45a0-96c1-fa0f213831ab',0,30,_binary '\0',NULL,NULL),('ab9237ec-ba7f-4df1-8709-fcfbc545ac55',NULL,NULL,'hi-therapist','2bb04c4e-fca4-4cfd-a71b-76d86b4211ec',0,20,_binary '','bb820aac-5aed-4cc1-ba22-066178f172b9',NULL),('ad61925f-e25c-4cc6-bd79-66ca160aea2a',NULL,'docker-http-basic-authenticator','master','4db51364-aa84-4543-a6da-a9ec2f8795c8',0,10,_binary '\0',NULL,NULL),('ae6d3f5c-d194-41de-a8f3-78dd82706313',NULL,'direct-grant-validate-password','hi-therapist','c20c2475-99eb-40e6-bae2-a8f5540087f8',0,20,_binary '\0',NULL,NULL),('aea339dd-bbcb-4fb5-b5ca-d0e6bc964466',NULL,'no-cookie-redirect','master','30faa0ec-2358-49c8-a487-efcc4ccf5cbb',0,10,_binary '\0',NULL,NULL),('b1b24c0d-6fda-4e1f-ad95-e5984839005d',NULL,'auth-cookie','hi-library','585f05eb-75b5-47fa-a893-f66cb810c5e7',2,10,_binary '\0',NULL,NULL),('b3797630-9020-4d11-9689-ab3662b948cd',NULL,'direct-grant-validate-otp','hi-library','345a879e-5ce2-401d-a956-d612b68107b4',0,20,_binary '\0',NULL,NULL),('b5523cd9-8baf-4919-a804-90d422a2af4d',NULL,'conditional-user-configured','hi-therapist','0e87f4df-76d0-44af-8245-0e077585a3bc',0,10,_binary '\0',NULL,NULL),('b8024063-0a67-40b9-8a10-048bbb35e64d',NULL,'auth-spnego','hi-therapist','10d3d303-a637-49d9-a0d2-18e9d85eec96',3,20,_binary '\0',NULL,NULL),('b8ae3093-1cf8-4b32-99a8-0243c5f2a717',NULL,'docker-http-basic-authenticator','hi-library','26d6d8a6-24a4-48a9-856d-787e7a73a432',0,10,_binary '\0',NULL,NULL),('b95e8646-2cf4-4ba2-9060-b6e01d4065e0',NULL,'client-x509','hi-therapist','47659d6f-ddbc-4590-8e49-d3d846d0c73b',2,40,_binary '\0',NULL,NULL),('bac38f8e-7f35-4445-b56a-95fa671103cb',NULL,'client-x509','hi','b236e1ef-ac1b-442f-a7e8-814031aabdc6',2,40,_binary '\0',NULL,NULL),('bb0dee93-c54a-4776-b8c0-547b819d2911',NULL,'auth-otp-form','hi','44f5ba8e-ed91-41ff-845e-9f4ff6d984e4',0,20,_binary '\0',NULL,NULL),('bf086379-f2fd-4252-a6b3-65d9cdf0d21b',NULL,NULL,'hi-therapist','bb820aac-5aed-4cc1-ba22-066178f172b9',2,20,_binary '','a3246479-15bf-4ea4-ac68-7e4e22816e26',NULL),('bfb5ef77-b5de-40a4-8680-d0a591550bc5',NULL,NULL,'hi-library','83828641-1b6b-48f1-b873-551506898b70',1,20,_binary '','5d8f0a36-1d62-4589-b105-56d64c03498c',NULL),('c02251df-bb61-4921-ae42-04fdee9d19eb',NULL,'client-secret','hi','b236e1ef-ac1b-442f-a7e8-814031aabdc6',2,10,_binary '\0',NULL,NULL),('c0b667e8-8907-48eb-af50-95a93ff228e3',NULL,'registration-recaptcha-action','master','5475d611-08c0-483f-9eb1-cb16f32b8de1',3,60,_binary '\0',NULL,NULL),('c27dc358-d163-4675-8142-084bc45cbd75',NULL,NULL,'hi','1f5d23a5-92c1-48cd-8274-561d76718347',1,20,_binary '','d1e7816f-3d2e-4827-88f9-f13791372f96',NULL),('c32be0ad-a409-4d19-af69-5bd8b2585118',NULL,'reset-credentials-choose-user','hi','13e66f72-1319-4946-9991-4207daad9b35',0,10,_binary '\0',NULL,NULL),('c33c2789-9b64-4c5b-b20b-e2b1c2cb9ec5',NULL,'auth-otp-form','master','cc88f872-abf7-4adf-a2cf-a6753fe97f23',0,20,_binary '\0',NULL,NULL),('c5068d2b-c700-4ab7-b9fa-1cab1c97a16d',NULL,'idp-username-password-form','master','1c03e310-bca6-4dc1-9263-324eb1a76a5d',0,10,_binary '\0',NULL,NULL),('c5bfcaf6-34fb-4618-9503-bb528c57bc4c',NULL,'auth-username-password-form','hi','1f5d23a5-92c1-48cd-8274-561d76718347',0,10,_binary '\0',NULL,NULL),('c5d4bbc6-3d5b-41b5-8c6f-770a4b6cab2b',NULL,NULL,'hi-therapist','da5d4cb9-cf3c-4b61-b539-a89e28de8a2f',0,20,_binary '','3035bfb3-6876-4a72-90fb-a94a1aa2eb69',NULL),('c6036e87-50e4-4c00-af5a-b2b978fb94e5',NULL,NULL,'hi','ff916a77-3b7d-4c99-90f1-eb2743de4556',2,20,_binary '','3d254895-ba78-4190-bf93-35575b81cd5d',NULL),('c6801859-3ac4-4b26-a2f8-ae0b6acda6a1',NULL,'client-jwt','master','d4ae44af-6da9-417e-be64-94ae459a46cd',2,20,_binary '\0',NULL,NULL),('c977c5e6-0b33-4842-b37a-0de494b7d8a5',NULL,'auth-spnego','hi','803d6da2-472d-4b8e-8c9c-8bb61b47bac3',3,30,_binary '\0',NULL,NULL),('c987ab68-d13c-4822-94a9-2b7dc57c2063',NULL,'registration-page-form','master','e3c67d7a-39af-497b-aa8e-5bf39bc8b25c',0,10,_binary '','5475d611-08c0-483f-9eb1-cb16f32b8de1',NULL),('ca8c7c7d-855d-4089-bae0-473ddb9653d5',NULL,'auth-cookie','hi','6af89e7f-9873-400c-a6c3-e2dd7d474e26',2,10,_binary '\0',NULL,NULL),('ce9b7185-d33a-439b-aab7-c85b3ccfbee9',NULL,'idp-create-user-if-unique','hi','ff916a77-3b7d-4c99-90f1-eb2743de4556',2,10,_binary '\0',NULL,'556adfd6-6483-47ac-84a4-f1a7c0c9ebb7'),('cef43cdb-6a78-48e6-ba9c-3c5ebe48c053',NULL,'idp-review-profile','master','61c71a19-9d27-4ad6-ae4b-c5d3e3cdfae4',0,10,_binary '\0',NULL,'4ec03ff2-4c30-4ebd-a44b-da4e277dad60'),('cfe06578-9818-4134-a311-f48bd900c596',NULL,'idp-email-verification','master','aed73c1e-89ce-4c74-9909-c7c6d6750b50',2,10,_binary '\0',NULL,NULL),('d00b1b54-537f-4616-a352-b13f65a89b50',NULL,'reset-password','master','ae98e9f5-b8ff-4db8-87ec-4bc4468f399f',0,30,_binary '\0',NULL,NULL),('d0671607-7655-43ec-b0a5-ee112e4e65cb',NULL,'no-cookie-redirect','hi-library','b098feb5-cefa-4703-b4b2-3bb8251b23bb',0,10,_binary '\0',NULL,NULL),('d13981a8-4b6c-4ca4-a5ca-dc46a69e6c7d',NULL,'idp-create-user-if-unique','master','c0215fc0-d3b4-4633-8376-208e33f13707',2,10,_binary '\0',NULL,'72af53f6-1240-4b20-a2ce-581c1086c87f'),('d34d9508-9908-4368-a462-6127d700e0e4',NULL,'http-basic-authenticator','master','899cdcd1-1aed-4a90-b015-1931a25f24e5',0,10,_binary '\0',NULL,NULL),('d4c9f006-a4e6-4c47-b139-50c7bbd20636',NULL,'reset-otp','master','fdc23882-4b2f-4be7-be4d-66d4aacb93ba',0,20,_binary '\0',NULL,NULL),('d5c72644-d9ea-4600-b232-a324a9ecb503',NULL,'identity-provider-redirector','hi','6af89e7f-9873-400c-a6c3-e2dd7d474e26',2,25,_binary '\0',NULL,NULL),('d620ef61-0807-4576-a16d-b6feddf5dbf9',NULL,'reset-credential-email','hi-therapist','e8efe948-5fc8-45a0-96c1-fa0f213831ab',0,20,_binary '\0',NULL,NULL),('d69eefab-4435-4cd9-868a-6b3af2ea421a',NULL,'conditional-user-configured','hi-library','345a879e-5ce2-401d-a956-d612b68107b4',0,10,_binary '\0',NULL,NULL),('d6f6d31c-ace3-4cad-8269-e37e538cdb35',NULL,'direct-grant-validate-username','master','31bf0da3-ebb0-46de-b6e7-45571ced2ef8',0,10,_binary '\0',NULL,NULL),('d7129684-9a4f-4bf4-bbbd-84b9cba43ea7',NULL,'reset-otp','hi-library','7481304a-61a5-47d8-86a9-8070e418cbbc',0,20,_binary '\0',NULL,NULL),('d76adef2-9490-4453-97fa-cda82f88e845',NULL,'registration-page-form','hi','9304b278-1ded-4951-9dc0-fbb578c6da2f',0,10,_binary '','5ce57dd0-c070-4ad2-b7f3-80385854d494',NULL),('d951b473-6207-43fb-bd53-fbfb694c73bc',NULL,NULL,'hi-library','585f05eb-75b5-47fa-a893-f66cb810c5e7',2,30,_binary '','83828641-1b6b-48f1-b873-551506898b70',NULL),('dad8411a-44ad-4271-8715-7b0afc013c8f',NULL,'registration-user-creation','hi-library','1225e8e8-79c5-4898-b2d6-d944cd6a931b',0,20,_binary '\0',NULL,NULL),('dc3d7858-3d46-4743-98b4-46c14101e0f3',NULL,'basic-auth','hi-library','8b82f6f2-5d80-4c54-8e32-97793ed2820c',0,10,_binary '\0',NULL,NULL),('dce8c401-0a06-4694-bfd1-9479d076429a',NULL,NULL,'hi-therapist','10d3d303-a637-49d9-a0d2-18e9d85eec96',2,30,_binary '','4deb154d-9bcb-4612-b096-e6f3fc058ad5',NULL),('de1d397a-dfe5-49ff-8277-6d6529757976',NULL,NULL,'hi','5d0a6d6a-132b-439f-a43e-8b075bbb3c5a',1,20,_binary '','44f5ba8e-ed91-41ff-845e-9f4ff6d984e4',NULL),('e011f026-22a7-435c-81e9-1cc2cb76449a',NULL,'client-jwt','hi-therapist','47659d6f-ddbc-4590-8e49-d3d846d0c73b',2,20,_binary '\0',NULL,NULL),('e081cc11-885b-4f89-bc23-021bd50ffa01',NULL,'registration-password-action','hi-library','1225e8e8-79c5-4898-b2d6-d944cd6a931b',0,50,_binary '\0',NULL,NULL),('e1dffc16-703f-454e-ac01-645117b5ef33',NULL,'reset-credential-email','hi','13e66f72-1319-4946-9991-4207daad9b35',0,20,_binary '\0',NULL,NULL),('e346e9e2-ac3f-40d7-b7e1-4c897f996180',NULL,'basic-auth-otp','hi-library','8b82f6f2-5d80-4c54-8e32-97793ed2820c',3,20,_binary '\0',NULL,NULL),('e36ae765-e7c4-438e-9fa4-99dfb7bb0d9d',NULL,'auth-username-password-form','master','7935b686-21bc-4f79-b519-e3cf911fc969',0,10,_binary '\0',NULL,NULL),('e592d30e-1411-4401-bb9d-4ee53df42c8b',NULL,'registration-password-action','master','5475d611-08c0-483f-9eb1-cb16f32b8de1',0,50,_binary '\0',NULL,NULL),('e701b877-de30-44ba-955e-e3b81636597d',NULL,'registration-page-form','hi-library','c6135fa7-b58a-46ee-b566-adf6959b1785',0,10,_binary '','1225e8e8-79c5-4898-b2d6-d944cd6a931b',NULL),('e8720940-a658-470c-8e25-a0f8ce787a96',NULL,NULL,'master','b063915c-4522-4b14-a103-dcf8d6da58c1',0,20,_binary '','aed73c1e-89ce-4c74-9909-c7c6d6750b50',NULL),('e8e681cd-e6d6-4a38-80e9-faea2d232475',NULL,'identity-provider-redirector','hi-therapist','10d3d303-a637-49d9-a0d2-18e9d85eec96',2,25,_binary '\0',NULL,NULL),('e9bfec69-14a2-4ee5-91f7-ab4d56a0ac7a',NULL,NULL,'hi-library','4ece9989-d7a7-492a-8766-ebc8db40b3e0',2,20,_binary '','f31a779e-6d42-42b8-a3c7-deaf3409763a',NULL),('e9ed43b4-86e9-4528-bc99-120a2469bb4e',NULL,'auth-cookie','master','409ff595-7f9b-40bb-8844-ae4ec74e24ef',2,10,_binary '\0',NULL,NULL),('ee0cf157-87a0-4991-ac58-43a3dd52fff8',NULL,'idp-username-password-form','hi-therapist','a3246479-15bf-4ea4-ac68-7e4e22816e26',0,10,_binary '\0',NULL,NULL),('eecd91e0-82ed-4376-b52a-eda3f20ee2d2',NULL,NULL,'master','61c71a19-9d27-4ad6-ae4b-c5d3e3cdfae4',0,20,_binary '','c0215fc0-d3b4-4633-8376-208e33f13707',NULL),('f14cf382-0b0b-4a3e-b5eb-200dba3b846a',NULL,'direct-grant-validate-password','hi-library','9f8a2c39-2385-4f6e-abe9-040233498045',0,20,_binary '\0',NULL,NULL),('f2780080-2097-4e7a-bf23-4d2a55b39011',NULL,'registration-profile-action','hi-library','1225e8e8-79c5-4898-b2d6-d944cd6a931b',0,40,_binary '\0',NULL,NULL),('f4d68944-d4fa-4851-a413-0e2f81550e9c',NULL,NULL,'hi-library','86d53555-aa8c-4450-b9b4-689ef6b89237',1,40,_binary '','7481304a-61a5-47d8-86a9-8070e418cbbc',NULL),('f51e8aa9-b27c-4d7a-be7b-5d7b1972b755',NULL,'idp-create-user-if-unique','hi-therapist','3035bfb3-6876-4a72-90fb-a94a1aa2eb69',2,10,_binary '\0',NULL,'3ce7b8f2-c907-41d2-852c-dde29647522a'),('f6ba5522-59e6-4597-a2d6-4ae32be4ba3d',NULL,'http-basic-authenticator','hi-library','f4adc535-d62d-46cf-92a3-84a9fe9007c7',0,10,_binary '\0',NULL,NULL),('f70067b3-7ca8-4e2d-b489-c26898fb3042',NULL,'direct-grant-validate-password','hi','9814995c-54b2-4b8d-a29b-7c23042a5841',0,20,_binary '\0',NULL,NULL),('f77a3aa6-de70-487b-9fdb-1aabfd2fe231',NULL,'registration-recaptcha-action','hi-library','1225e8e8-79c5-4898-b2d6-d944cd6a931b',3,60,_binary '\0',NULL,NULL),('f81ff174-5bd7-4bf2-ab9e-32a963c8b781',NULL,NULL,'hi','3d254895-ba78-4190-bf93-35575b81cd5d',0,20,_binary '','86fcfd67-d7ad-491f-b88f-a59359caa6a3',NULL),('f8bcef72-4a7e-4fb6-b1b0-5f2f1178f220',NULL,NULL,'master','aed73c1e-89ce-4c74-9909-c7c6d6750b50',2,20,_binary '','1c03e310-bca6-4dc1-9263-324eb1a76a5d',NULL),('fbc31ee2-7a01-4cd8-8e08-0925fbbf87c7',NULL,NULL,'hi','86fcfd67-d7ad-491f-b88f-a59359caa6a3',2,20,_binary '','5d0a6d6a-132b-439f-a43e-8b075bbb3c5a',NULL),('fbea4788-baa2-417c-9df5-defb6a323b02',NULL,'client-secret-jwt','hi','b236e1ef-ac1b-442f-a7e8-814031aabdc6',2,30,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `AUTHENTICATION_EXECUTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

DROP TABLE IF EXISTS `AUTHENTICATION_FLOW`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATION_FLOW`
--

LOCK TABLES `AUTHENTICATION_FLOW` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` DISABLE KEYS */;
INSERT INTO `AUTHENTICATION_FLOW` VALUES ('04b9ee68-1431-46da-9270-562bc0ea65a0','Verify Existing Account by Re-authentication','Reauthentication of existing account','hi-library','basic-flow',_binary '\0',_binary ''),('0e87f4df-76d0-44af-8245-0e077585a3bc','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','hi-therapist','basic-flow',_binary '\0',_binary ''),('10d3d303-a637-49d9-a0d2-18e9d85eec96','browser','browser based authentication','hi-therapist','basic-flow',_binary '',_binary ''),('1225e8e8-79c5-4898-b2d6-d944cd6a931b','registration form','registration form','hi-library','form-flow',_binary '\0',_binary ''),('13e66f72-1319-4946-9991-4207daad9b35','reset credentials','Reset credentials for a user if they forgot their password or something','hi','basic-flow',_binary '',_binary ''),('154d7176-6361-4860-b35a-e2810e063949','saml ecp','SAML ECP Profile Authentication Flow','hi-therapist','basic-flow',_binary '',_binary ''),('169503b0-a37f-42ef-a118-d18a1e567be7','Authentication Options','Authentication options.','master','basic-flow',_binary '\0',_binary ''),('189397a6-560e-4f8f-a1e8-081196ea3454','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('1c03e310-bca6-4dc1-9263-324eb1a76a5d','Verify Existing Account by Re-authentication','Reauthentication of existing account','master','basic-flow',_binary '\0',_binary ''),('1cbd4ec1-8936-4b72-a7da-0aae27b2d91b','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','hi','basic-flow',_binary '',_binary ''),('1f5d23a5-92c1-48cd-8274-561d76718347','forms','Username, password, otp and other auth forms.','hi','basic-flow',_binary '\0',_binary ''),('25c65a0f-9e30-4c21-bbc3-4a86884d8b81','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','hi','basic-flow',_binary '\0',_binary ''),('26d6d8a6-24a4-48a9-856d-787e7a73a432','docker auth','Used by Docker clients to authenticate against the IDP','hi-library','basic-flow',_binary '',_binary ''),('2bb04c4e-fca4-4cfd-a71b-76d86b4211ec','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','hi-therapist','basic-flow',_binary '\0',_binary ''),('303203d5-c1bc-416b-a867-b7068c50dd6b','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','hi','basic-flow',_binary '',_binary ''),('3035bfb3-6876-4a72-90fb-a94a1aa2eb69','User creation or linking','Flow for the existing/non-existing user alternatives','hi-therapist','basic-flow',_binary '\0',_binary ''),('30faa0ec-2358-49c8-a487-efcc4ccf5cbb','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','master','basic-flow',_binary '',_binary ''),('31bf0da3-ebb0-46de-b6e7-45571ced2ef8','direct grant','OpenID Connect Resource Owner Grant','master','basic-flow',_binary '',_binary ''),('345a879e-5ce2-401d-a956-d612b68107b4','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi-library','basic-flow',_binary '\0',_binary ''),('3d254895-ba78-4190-bf93-35575b81cd5d','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','hi','basic-flow',_binary '\0',_binary ''),('3f622d53-72a4-4f89-b928-fb3bdb38d30c','docker auth','Used by Docker clients to authenticate against the IDP','hi','basic-flow',_binary '',_binary ''),('409ff595-7f9b-40bb-8844-ae4ec74e24ef','browser','browser based authentication','master','basic-flow',_binary '',_binary ''),('44542ee4-adec-4b17-a698-88a5fc0161e5','registration form','registration form','hi-therapist','form-flow',_binary '\0',_binary ''),('44f5ba8e-ed91-41ff-845e-9f4ff6d984e4','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi','basic-flow',_binary '\0',_binary ''),('47659d6f-ddbc-4590-8e49-d3d846d0c73b','clients','Base authentication for clients','hi-therapist','client-flow',_binary '',_binary ''),('4db51364-aa84-4543-a6da-a9ec2f8795c8','docker auth','Used by Docker clients to authenticate against the IDP','master','basic-flow',_binary '',_binary ''),('4deb154d-9bcb-4612-b096-e6f3fc058ad5','forms','Username, password, otp and other auth forms.','hi-therapist','basic-flow',_binary '\0',_binary ''),('4ece9989-d7a7-492a-8766-ebc8db40b3e0','User creation or linking','Flow for the existing/non-existing user alternatives','hi-library','basic-flow',_binary '\0',_binary ''),('5475d611-08c0-483f-9eb1-cb16f32b8de1','registration form','registration form','master','form-flow',_binary '\0',_binary ''),('585f05eb-75b5-47fa-a893-f66cb810c5e7','browser','browser based authentication','hi-library','basic-flow',_binary '',_binary ''),('5ce57dd0-c070-4ad2-b7f3-80385854d494','registration form','registration form','hi','form-flow',_binary '\0',_binary ''),('5d0a6d6a-132b-439f-a43e-8b075bbb3c5a','Verify Existing Account by Re-authentication','Reauthentication of existing account','hi','basic-flow',_binary '\0',_binary ''),('5d8f0a36-1d62-4589-b105-56d64c03498c','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi-library','basic-flow',_binary '\0',_binary ''),('61c71a19-9d27-4ad6-ae4b-c5d3e3cdfae4','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','master','basic-flow',_binary '',_binary ''),('6af89e7f-9873-400c-a6c3-e2dd7d474e26','browser','browser based authentication','hi','basic-flow',_binary '',_binary ''),('71d715ae-8c07-48e0-8ffa-720ca11769dd','Authentication Options','Authentication options.','hi-therapist','basic-flow',_binary '\0',_binary ''),('7481304a-61a5-47d8-86a9-8070e418cbbc','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','hi-library','basic-flow',_binary '\0',_binary ''),('771a017f-b3b2-42cc-bd96-5efb4194b4f3','clients','Base authentication for clients','hi-library','client-flow',_binary '',_binary ''),('7935b686-21bc-4f79-b519-e3cf911fc969','forms','Username, password, otp and other auth forms.','master','basic-flow',_binary '\0',_binary ''),('803d6da2-472d-4b8e-8c9c-8bb61b47bac3','Authentication Options','Authentication options.','hi','basic-flow',_binary '\0',_binary ''),('825f4dda-59d5-433f-accc-cdfa3e77ad3d','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi-therapist','basic-flow',_binary '\0',_binary ''),('83828641-1b6b-48f1-b873-551506898b70','forms','Username, password, otp and other auth forms.','hi-library','basic-flow',_binary '\0',_binary ''),('86d53555-aa8c-4450-b9b4-689ef6b89237','reset credentials','Reset credentials for a user if they forgot their password or something','hi-library','basic-flow',_binary '',_binary ''),('86fcfd67-d7ad-491f-b88f-a59359caa6a3','Account verification options','Method with which to verity the existing account','hi','basic-flow',_binary '\0',_binary ''),('8822a9b7-f051-4879-8a15-44a5dfb29f53','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','hi-therapist','basic-flow',_binary '',_binary ''),('899cdcd1-1aed-4a90-b015-1931a25f24e5','saml ecp','SAML ECP Profile Authentication Flow','master','basic-flow',_binary '',_binary ''),('8b82f6f2-5d80-4c54-8e32-97793ed2820c','Authentication Options','Authentication options.','hi-library','basic-flow',_binary '\0',_binary ''),('9304b278-1ded-4951-9dc0-fbb578c6da2f','registration','registration flow','hi','basic-flow',_binary '',_binary ''),('933a3282-7d5a-4de0-bcd5-abd8903798dc','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','hi-library','basic-flow',_binary '',_binary ''),('9814995c-54b2-4b8d-a29b-7c23042a5841','direct grant','OpenID Connect Resource Owner Grant','hi','basic-flow',_binary '',_binary ''),('9f8a2c39-2385-4f6e-abe9-040233498045','direct grant','OpenID Connect Resource Owner Grant','hi-library','basic-flow',_binary '',_binary ''),('a3246479-15bf-4ea4-ac68-7e4e22816e26','Verify Existing Account by Re-authentication','Reauthentication of existing account','hi-therapist','basic-flow',_binary '\0',_binary ''),('ae98e9f5-b8ff-4db8-87ec-4bc4468f399f','reset credentials','Reset credentials for a user if they forgot their password or something','master','basic-flow',_binary '',_binary ''),('aed73c1e-89ce-4c74-9909-c7c6d6750b50','Account verification options','Method with which to verity the existing account','master','basic-flow',_binary '\0',_binary ''),('b063915c-4522-4b14-a103-dcf8d6da58c1','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','master','basic-flow',_binary '\0',_binary ''),('b098feb5-cefa-4703-b4b2-3bb8251b23bb','http challenge','An authentication flow based on challenge-response HTTP Authentication Schemes','hi-library','basic-flow',_binary '',_binary ''),('b1963215-6900-4985-9900-81fc8d52c558','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi-library','basic-flow',_binary '\0',_binary ''),('b236e1ef-ac1b-442f-a7e8-814031aabdc6','clients','Base authentication for clients','hi','client-flow',_binary '',_binary ''),('b23d3bf9-6083-41cd-b142-f6f0f2933503','registration','registration flow','hi-therapist','basic-flow',_binary '',_binary ''),('b7c5d1bd-3abf-43d3-937b-2c61982ad707','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi-therapist','basic-flow',_binary '\0',_binary ''),('bb820aac-5aed-4cc1-ba22-066178f172b9','Account verification options','Method with which to verity the existing account','hi-therapist','basic-flow',_binary '\0',_binary ''),('c0215fc0-d3b4-4633-8376-208e33f13707','User creation or linking','Flow for the existing/non-existing user alternatives','master','basic-flow',_binary '\0',_binary ''),('c20c2475-99eb-40e6-bae2-a8f5540087f8','direct grant','OpenID Connect Resource Owner Grant','hi-therapist','basic-flow',_binary '',_binary ''),('c6135fa7-b58a-46ee-b566-adf6959b1785','registration','registration flow','hi-library','basic-flow',_binary '',_binary ''),('cc88f872-abf7-4adf-a2cf-a6753fe97f23','First broker login - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('ccb1d903-a00d-407d-a11c-fcf98fcc1cb1','saml ecp','SAML ECP Profile Authentication Flow','hi','basic-flow',_binary '',_binary ''),('cd454593-1127-49ea-a307-811b6357614e','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','master','basic-flow',_binary '\0',_binary ''),('ce67fa0a-8154-4517-96ff-80865d4a33eb','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi-therapist','basic-flow',_binary '\0',_binary ''),('d1e7816f-3d2e-4827-88f9-f13791372f96','Browser - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi','basic-flow',_binary '\0',_binary ''),('d4ae44af-6da9-417e-be64-94ae459a46cd','clients','Base authentication for clients','master','client-flow',_binary '',_binary ''),('da5d4cb9-cf3c-4b61-b539-a89e28de8a2f','first broker login','Actions taken after first broker login with identity provider account, which is not yet linked to any Keycloak account','hi-therapist','basic-flow',_binary '',_binary ''),('e3c67d7a-39af-497b-aa8e-5bf39bc8b25c','registration','registration flow','master','basic-flow',_binary '',_binary ''),('e8efe948-5fc8-45a0-96c1-fa0f213831ab','reset credentials','Reset credentials for a user if they forgot their password or something','hi-therapist','basic-flow',_binary '',_binary ''),('f0ba7e18-930e-4784-962d-1d5a99b9a30f','docker auth','Used by Docker clients to authenticate against the IDP','hi-therapist','basic-flow',_binary '',_binary ''),('f31a779e-6d42-42b8-a3c7-deaf3409763a','Handle Existing Account','Handle what to do if there is existing account with same email/username like authenticated identity provider','hi-library','basic-flow',_binary '\0',_binary ''),('f355f952-6275-4445-b5f3-9a74c835ccd9','Direct Grant - Conditional OTP','Flow to determine if the OTP is required for the authentication','hi','basic-flow',_binary '\0',_binary ''),('f4adc535-d62d-46cf-92a3-84a9fe9007c7','saml ecp','SAML ECP Profile Authentication Flow','hi-library','basic-flow',_binary '',_binary ''),('f82fe0eb-3847-49e2-91e4-c850cce954ad','Account verification options','Method with which to verity the existing account','hi-library','basic-flow',_binary '\0',_binary ''),('fdc23882-4b2f-4be7-be4d-66d4aacb93ba','Reset - Conditional OTP','Flow to determine if the OTP should be reset or not. Set to REQUIRED to force.','master','basic-flow',_binary '\0',_binary ''),('ff916a77-3b7d-4c99-90f1-eb2743de4556','User creation or linking','Flow for the existing/non-existing user alternatives','hi','basic-flow',_binary '\0',_binary '');
/*!40000 ALTER TABLE `AUTHENTICATION_FLOW` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`),
  CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG`
--

LOCK TABLES `AUTHENTICATOR_CONFIG` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG` VALUES ('3ce7b8f2-c907-41d2-852c-dde29647522a','create unique user config','hi-therapist'),('4ec03ff2-4c30-4ebd-a44b-da4e277dad60','review profile config','master'),('556adfd6-6483-47ac-84a4-f1a7c0c9ebb7','create unique user config','hi'),('72af53f6-1240-4b20-a2ce-581c1086c87f','create unique user config','master'),('74f033c7-47fb-4030-b23a-d1e659654bb1','review profile config','hi-therapist'),('8543f0c5-a19c-4e11-ac7a-642c45e80e12','review profile config','hi-library'),('f2428f95-6c5c-4642-8dd0-acca1b4317dd','review profile config','hi'),('f60f49b4-a623-4cec-b1c1-ad8b9900d121','create unique user config','hi-library');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

DROP TABLE IF EXISTS `AUTHENTICATOR_CONFIG_ENTRY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AUTHENTICATOR_CONFIG_ENTRY`
--

LOCK TABLES `AUTHENTICATOR_CONFIG_ENTRY` WRITE;
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` DISABLE KEYS */;
INSERT INTO `AUTHENTICATOR_CONFIG_ENTRY` VALUES ('3ce7b8f2-c907-41d2-852c-dde29647522a','false','require.password.update.after.registration'),('4ec03ff2-4c30-4ebd-a44b-da4e277dad60','missing','update.profile.on.first.login'),('556adfd6-6483-47ac-84a4-f1a7c0c9ebb7','false','require.password.update.after.registration'),('72af53f6-1240-4b20-a2ce-581c1086c87f','false','require.password.update.after.registration'),('74f033c7-47fb-4030-b23a-d1e659654bb1','missing','update.profile.on.first.login'),('8543f0c5-a19c-4e11-ac7a-642c45e80e12','missing','update.profile.on.first.login'),('f2428f95-6c5c-4642-8dd0-acca1b4317dd','missing','update.profile.on.first.login'),('f60f49b4-a623-4cec-b1c1-ad8b9900d121','false','require.password.update.after.registration');
/*!40000 ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BROKER_LINK`
--

DROP TABLE IF EXISTS `BROKER_LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `BROKER_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BROKER_LINK`
--

LOCK TABLES `BROKER_LINK` WRITE;
/*!40000 ALTER TABLE `BROKER_LINK` DISABLE KEYS */;
/*!40000 ALTER TABLE `BROKER_LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT`
--

DROP TABLE IF EXISTS `CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BASE_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int DEFAULT '0',
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ROOT_URL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ALWAYS_DISPLAY_IN_CONSOLE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`),
  KEY `IDX_CLIENT_ID` (`CLIENT_ID`),
  CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT`
--

LOCK TABLES `CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT` VALUES ('0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '',_binary '\0','realm-management',0,_binary '\0','**********',NULL,_binary '',NULL,_binary '\0','hi-library','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '',_binary '\0','account',0,_binary '\0','8e19a110-2d9c-4bc2-80b4-fadc3e459466','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('1472daaa-5420-4b1f-bfb2-f184f16a8320',_binary '',_binary '','hi_backend',0,_binary '\0','b47f6845-ccfc-430d-942a-0ec25ca4d935','https://local-hi-therapist.wehost.asia/',_binary '\0','https://local-hi-therapist.wehost.asia/auth',_binary '\0','hi-therapist','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('188df32b-7999-4ebb-9c06-f0087380f68d',_binary '',_binary '\0','admin-cli',0,_binary '','**********',NULL,_binary '\0',NULL,_binary '\0','hi-library','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255',_binary '',_binary '\0','account-console',0,_binary '','**********','/realms/hi-library/account/',_binary '\0',NULL,_binary '\0','hi-library','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('30febc11-32fa-4349-a4db-a46a33775ab2',_binary '',_binary '','hi_frontend',0,_binary '','**********','https://local-hi-therapist.wehost.asia/',_binary '\0','https://local-hi-therapist.wehost.asia/auth',_binary '\0','hi-therapist','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '',_binary '',_binary '\0'),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb',_binary '',_binary '\0','broker',0,_binary '\0','93d32550-f7b7-4041-8607-9b8c1c9b5093',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe',_binary '',_binary '\0','admin-cli',0,_binary '','**********',NULL,_binary '\0',NULL,_binary '\0','hi','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('558bc5ae-068f-4e0b-b70a-170b730aa137',_binary '',_binary '','hi_frontend',0,_binary '','**********','https://local-hi-admin.wehost.asia/',_binary '\0','https://local-hi-admin.wehost.asia/auth',_binary '\0','hi','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '',_binary '',_binary '\0'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '',_binary '\0','account',0,_binary '\0','**********','/realms/hi/account/',_binary '\0',NULL,_binary '\0','hi','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0',_binary '',_binary '\0','security-admin-console',0,_binary '','**********','/admin/hi-library/console/',_binary '\0',NULL,_binary '\0','hi-library','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3',_binary '',_binary '\0','admin-cli',0,_binary '','**********',NULL,_binary '\0',NULL,_binary '\0','hi-therapist','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('620c09d1-5d44-4bda-959f-82ff964b0f98',_binary '',_binary '','hi_frontend',0,_binary '','**********','https://local-hi-library.wehost.asia/',_binary '\0','https://local-hi-library.wehost.asia/auth',_binary '\0','hi-library','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4',_binary '',_binary '\0','account-console',0,_binary '','**********','/realms/Hi/account/',_binary '\0',NULL,_binary '\0','hi-therapist','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53',_binary '',_binary '\0','account-console',0,_binary '','38ffffbd-ae9e-43c1-a82d-7485447a279a','/realms/master/account/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('78044321-1410-42bf-9489-f89303e77e5a',_binary '',_binary '\0','broker',0,_binary '\0','**********',NULL,_binary '\0',NULL,_binary '\0','hi-therapist','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '',_binary '\0','account',0,_binary '\0','**********','/realms/hi-therapist/account/',_binary '\0',NULL,_binary '\0','hi-therapist','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '',_binary '','hi-realm',0,_binary '\0','c393ad2d-30f4-4bb1-86a6-93b0d7462ce2',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','hi Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '',_binary '','master-realm',0,_binary '\0','d909edea-a893-4463-a302-8cf507f75b5a',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','master Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '',_binary '','hi-therapist-realm',0,_binary '\0','70330e4e-99a7-4947-851b-97d11a071488',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','hi-therapist Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5',_binary '',_binary '\0','broker',0,_binary '\0','**********',NULL,_binary '\0',NULL,_binary '\0','hi','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('af07419a-9fdd-48f8-bb86-98deababeb5d',_binary '',_binary '\0','account-console',0,_binary '','**********','/realms/hi/account/',_binary '\0',NULL,_binary '\0','hi','openid-connect',0,_binary '\0',_binary '\0','${client_account-console}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b3fea689-45c7-4c2b-96ef-b389a0355159',_binary '',_binary '\0','broker',0,_binary '\0','**********',NULL,_binary '\0',NULL,_binary '\0','hi-library','openid-connect',0,_binary '\0',_binary '\0','${client_broker}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('b53a1923-71b3-4fbf-be97-b1573d596e47',_binary '',_binary '\0','security-admin-console',0,_binary '','5e433989-8ed0-4fe4-826a-f0dbc6e42ad2','/admin/master/console/',_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('cb884845-e614-4c6e-9508-6fd6ae87fd60',_binary '',_binary '\0','security-admin-console',0,_binary '','**********','/admin/hi-therapist/console/',_binary '\0',NULL,_binary '\0','hi-therapist','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2',_binary '',_binary '\0','security-admin-console',0,_binary '','**********','/admin/hi/console/',_binary '\0',NULL,_binary '\0','hi','openid-connect',0,_binary '\0',_binary '\0','${client_security-admin-console}',_binary '\0','client-secret','${authAdminUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8',_binary '',_binary '','hi_backend',0,_binary '\0','46efd2b1-add0-4e9b-89f2-4f9e1f36a457','https://local-hi-admin.wehost.asia',_binary '\0','https://local-hi-admin.wehost.asia/auth',_binary '\0','hi','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret','',NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '',_binary '\0','account',0,_binary '\0','**********','/realms/hi-library/account/',_binary '\0',NULL,_binary '\0','hi-library','openid-connect',0,_binary '\0',_binary '\0','${client_account}',_binary '\0','client-secret','${authBaseUrl}',NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('e233b1cf-3455-4e60-9488-ec12dfa884d2',_binary '',_binary '','hi_backend',0,_binary '\0','14a3a4ec-175b-4ea4-a351-f047f173124c','https://local-hi-library.wehost.asia/',_binary '\0','https://local-hi-library.wehost.asia/auth',_binary '\0','hi-library','openid-connect',-1,_binary '\0',_binary '\0',NULL,_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '',_binary '\0'),('e4a28241-1c05-44ae-b925-60ec5611edfe',_binary '',_binary '\0','admin-cli',0,_binary '','a53ad47c-3cfc-44dd-b2bc-857a06691ad6',NULL,_binary '\0',NULL,_binary '\0','master','openid-connect',0,_binary '\0',_binary '\0','${client_admin-cli}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0'),('ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '',_binary '\0','realm-management',0,_binary '\0','**********',NULL,_binary '',NULL,_binary '\0','hi-therapist','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '',_binary '','hi-library-realm',0,_binary '\0','5277343b-8336-4503-8cbc-1ad354eece56',NULL,_binary '',NULL,_binary '\0','master',NULL,0,_binary '\0',_binary '\0','hi-library Realm',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0'),('eec28897-b54a-4d82-9488-f454e28d01ea',_binary '',_binary '\0','realm-management',0,_binary '\0','**********',NULL,_binary '',NULL,_binary '\0','hi','openid-connect',0,_binary '\0',_binary '\0','${client_realm-management}',_binary '\0','client-secret',NULL,NULL,NULL,_binary '',_binary '\0',_binary '\0',_binary '\0');
/*!40000 ALTER TABLE `CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_ATTRIBUTES`
--

LOCK TABLES `CLIENT_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_ATTRIBUTES` VALUES ('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','display.on.consent.screen'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','exclude.session.state.from.auth.response'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml_force_name_id_format'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.assertion.signature'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.authnstatement'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.client.signature'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.encrypt'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.force.post.binding'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.multivalued.roles'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.onetimeuse.condition'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.server.signature'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','saml.server.signature.keyinfo.ext'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','false','tls.client.certificate.bound.access.tokens'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','S256','pkce.code.challenge.method'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','display.on.consent.screen'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','exclude.session.state.from.auth.response'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml_force_name_id_format'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.assertion.signature'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.authnstatement'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.client.signature'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.encrypt'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.force.post.binding'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.multivalued.roles'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.onetimeuse.condition'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.server.signature'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','saml.server.signature.keyinfo.ext'),('30febc11-32fa-4349-a4db-a46a33775ab2','false','tls.client.certificate.bound.access.tokens'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','display.on.consent.screen'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','exclude.session.state.from.auth.response'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml_force_name_id_format'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.assertion.signature'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.authnstatement'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.client.signature'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.encrypt'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.force.post.binding'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.multivalued.roles'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.onetimeuse.condition'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.server.signature'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','saml.server.signature.keyinfo.ext'),('558bc5ae-068f-4e0b-b70a-170b730aa137','false','tls.client.certificate.bound.access.tokens'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','display.on.consent.screen'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','exclude.session.state.from.auth.response'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml_force_name_id_format'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.assertion.signature'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.authnstatement'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.client.signature'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.encrypt'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.force.post.binding'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.multivalued.roles'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.onetimeuse.condition'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.server.signature'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','saml.server.signature.keyinfo.ext'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','false','tls.client.certificate.bound.access.tokens'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','S256','pkce.code.challenge.method'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','display.on.consent.screen'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','exclude.session.state.from.auth.response'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml_force_name_id_format'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.assertion.signature'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.authnstatement'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.client.signature'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.encrypt'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.force.post.binding'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.multivalued.roles'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.onetimeuse.condition'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.server.signature'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','saml.server.signature.keyinfo.ext'),('620c09d1-5d44-4bda-959f-82ff964b0f98','false','tls.client.certificate.bound.access.tokens'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','display.on.consent.screen'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','exclude.session.state.from.auth.response'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','S256','pkce.code.challenge.method'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml_force_name_id_format'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.assertion.signature'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.authnstatement'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.client.signature'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.encrypt'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.force.post.binding'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.multivalued.roles'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.onetimeuse.condition'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.server.signature'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','saml.server.signature.keyinfo.ext'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','false','tls.client.certificate.bound.access.tokens'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','S256','pkce.code.challenge.method'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','display.on.consent.screen'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','exclude.session.state.from.auth.response'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml_force_name_id_format'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.assertion.signature'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.authnstatement'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.client.signature'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.encrypt'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.force.post.binding'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.multivalued.roles'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.onetimeuse.condition'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.server.signature'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','saml.server.signature.keyinfo.ext'),('89d22c6b-7a3a-406a-8635-049ea85abb55','false','tls.client.certificate.bound.access.tokens'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','display.on.consent.screen'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','exclude.session.state.from.auth.response'),('af07419a-9fdd-48f8-bb86-98deababeb5d','S256','pkce.code.challenge.method'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml_force_name_id_format'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.assertion.signature'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.authnstatement'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.client.signature'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.encrypt'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.force.post.binding'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.multivalued.roles'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.onetimeuse.condition'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.server.signature'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','saml.server.signature.keyinfo.ext'),('af07419a-9fdd-48f8-bb86-98deababeb5d','false','tls.client.certificate.bound.access.tokens'),('b53a1923-71b3-4fbf-be97-b1573d596e47','S256','pkce.code.challenge.method'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','S256','pkce.code.challenge.method'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','S256','pkce.code.challenge.method'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','display.on.consent.screen'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','exclude.session.state.from.auth.response'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml_force_name_id_format'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.assertion.signature'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.authnstatement'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.client.signature'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.encrypt'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.force.post.binding'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.multivalued.roles'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.onetimeuse.condition'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.server.signature'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','saml.server.signature.keyinfo.ext'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','false','tls.client.certificate.bound.access.tokens'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','display.on.consent.screen'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','exclude.session.state.from.auth.response'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml_force_name_id_format'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.assertion.signature'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.authnstatement'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.client.signature'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.encrypt'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.force.post.binding'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.multivalued.roles'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.onetimeuse.condition'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.server.signature'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','saml.server.signature.keyinfo.ext'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','false','tls.client.certificate.bound.access.tokens');
/*!40000 ALTER TABLE `CLIENT_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

DROP TABLE IF EXISTS `CLIENT_AUTH_FLOW_BINDINGS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BINDING_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_AUTH_FLOW_BINDINGS`
--

LOCK TABLES `CLIENT_AUTH_FLOW_BINDINGS` WRITE;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `CLIENT_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_DEFAULT_ROLES`
--

LOCK TABLES `CLIENT_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `CLIENT_DEFAULT_ROLES` VALUES ('89d22c6b-7a3a-406a-8635-049ea85abb55','22ffa567-5b11-4982-afc8-f3116f592f31'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','4a38d073-c8b2-4d2f-a41b-309828b871c8'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','8d4c4127-a801-4654-83a1-4ac23c6da4b3'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','a9a48d94-076e-4dd8-902b-fa5b4cc92561'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','c2db71d6-b098-4688-a383-12e79f5bcc7d'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','eac704fd-d0a7-4137-9e18-2c54d6a861f0');
/*!40000 ALTER TABLE `CLIENT_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

DROP TABLE IF EXISTS `CLIENT_INITIAL_ACCESS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `EXPIRATION` int DEFAULT NULL,
  `COUNT` int DEFAULT NULL,
  `REMAINING_COUNT` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`),
  CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_INITIAL_ACCESS`
--

LOCK TABLES `CLIENT_INITIAL_ACCESS` WRITE;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_INITIAL_ACCESS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

DROP TABLE IF EXISTS `CLIENT_NODE_REGISTRATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` int DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`NAME`),
  CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_NODE_REGISTRATIONS`
--

LOCK TABLES `CLIENT_NODE_REGISTRATIONS` WRITE;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_NODE_REGISTRATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  KEY `IDX_REALM_CLSCOPE` (`REALM_ID`),
  CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE`
--

LOCK TABLES `CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE` VALUES ('04f47a6c-8d2b-415f-be78-80d855e614a8','address','hi','OpenID Connect built-in scope: address','openid-connect'),('0a0dc4b2-5723-473a-97ee-ebb0050602c7','roles','master','OpenID Connect scope for add user roles to the access token','openid-connect'),('0d783cca-c3a4-4d95-ab32-82551105367e','roles','hi-therapist','OpenID Connect scope for add user roles to the access token','openid-connect'),('176332ca-d883-4329-a9d4-68884a7c275e','web-origins','hi','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('2a8bc487-583c-43dc-8d29-1ad0950d438b','profile','hi-library','OpenID Connect built-in scope: profile','openid-connect'),('30fc52ff-ab28-4569-92e2-26fe8f73626c','web-origins','master','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('356d3968-262b-4bee-8d44-0d93e880b01a','web-origins','hi-library','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('3617b695-9239-4d20-9271-32aa00a4825a','profile','hi','OpenID Connect built-in scope: profile','openid-connect'),('4072c001-f7e7-4fa4-9f9f-0f099a308dfe','phone','hi-library','OpenID Connect built-in scope: phone','openid-connect'),('41cca0ba-533b-45a7-99c1-8b4ecf149f06','roles','hi-library','OpenID Connect scope for add user roles to the access token','openid-connect'),('433a8036-5c4d-4675-a59e-2ac046db7713','web-origins','hi-therapist','OpenID Connect scope for add allowed web origins to the access token','openid-connect'),('467375c3-0f8a-490f-b105-0bb44c15a518','address','hi-therapist','OpenID Connect built-in scope: address','openid-connect'),('4d7db1a2-1bb6-4104-801b-ea18bd31d25e','address','hi-library','OpenID Connect built-in scope: address','openid-connect'),('5610c6b0-c1a2-4482-a1b8-d337404da618','phone','master','OpenID Connect built-in scope: phone','openid-connect'),('5753f684-aa1d-4cc0-88aa-98a2f0cab3af','email','hi','OpenID Connect built-in scope: email','openid-connect'),('5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1','address','master','OpenID Connect built-in scope: address','openid-connect'),('63210a8a-0008-4908-a26e-c374667cf2ea','profile','hi-therapist','OpenID Connect built-in scope: profile','openid-connect'),('76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0','role_list','hi','SAML role list','saml'),('77249e04-e2d2-4031-9667-8786a866947c','email','hi-library','OpenID Connect built-in scope: email','openid-connect'),('7f8eb3f6-36a3-4334-926c-7e7a067a96ad','offline_access','hi-therapist','OpenID Connect built-in scope: offline_access','openid-connect'),('815f7fe2-91f6-474c-ba61-a72d19605316','email','master','OpenID Connect built-in scope: email','openid-connect'),('8c3bdc03-95db-4a61-833f-d816bc6d702c','phone','hi-therapist','OpenID Connect built-in scope: phone','openid-connect'),('90332860-b400-4df0-b3a0-5ddee0d59319','phone','hi','OpenID Connect built-in scope: phone','openid-connect'),('91926bc4-0204-43c3-a034-67e94de06f80','roles','hi','OpenID Connect scope for add user roles to the access token','openid-connect'),('95552cf7-ce2a-4b2d-a8cc-6595013f1e87','microprofile-jwt','master','Microprofile - JWT built-in scope','openid-connect'),('b010f421-6272-47b6-9e2a-2e4368ef8869','offline_access','master','OpenID Connect built-in scope: offline_access','openid-connect'),('b8ee5766-81f3-4388-a09d-ccbd286cc542','role_list','master','SAML role list','saml'),('c32f9638-55d0-4d5a-a3fb-feb682bc420c','microprofile-jwt','hi-library','Microprofile - JWT built-in scope','openid-connect'),('c81a0d08-591a-4602-9ef1-9acbd7902e86','profile','master','OpenID Connect built-in scope: profile','openid-connect'),('c860f1d3-2172-40b1-9ce2-84911e6a17a9','role_list','hi-library','SAML role list','saml'),('e7c2df73-1988-4b3e-b971-24cd27bb2a0f','offline_access','hi','OpenID Connect built-in scope: offline_access','openid-connect'),('ee7ace46-13d6-42c2-9718-1c0cbd9418a8','microprofile-jwt','hi','Microprofile - JWT built-in scope','openid-connect'),('f070e008-1bf3-4354-9566-af729276ee3e','email','hi-therapist','OpenID Connect built-in scope: email','openid-connect'),('f8b8a1e5-c804-4695-b5b1-35c66ddbabee','microprofile-jwt','hi-therapist','Microprofile - JWT built-in scope','openid-connect'),('fb50c6e7-5a41-49e1-a6d1-933d23ad0663','offline_access','hi-library','OpenID Connect built-in scope: offline_access','openid-connect'),('fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71','role_list','hi-therapist','SAML role list','saml');
/*!40000 ALTER TABLE `CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ATTRIBUTES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`NAME`),
  KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`),
  CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ATTRIBUTES`
--

LOCK TABLES `CLIENT_SCOPE_ATTRIBUTES` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ATTRIBUTES` VALUES ('04f47a6c-8d2b-415f-be78-80d855e614a8','${addressScopeConsentText}','consent.screen.text'),('04f47a6c-8d2b-415f-be78-80d855e614a8','true','display.on.consent.screen'),('04f47a6c-8d2b-415f-be78-80d855e614a8','true','include.in.token.scope'),('0a0dc4b2-5723-473a-97ee-ebb0050602c7','${rolesScopeConsentText}','consent.screen.text'),('0a0dc4b2-5723-473a-97ee-ebb0050602c7','true','display.on.consent.screen'),('0a0dc4b2-5723-473a-97ee-ebb0050602c7','false','include.in.token.scope'),('0d783cca-c3a4-4d95-ab32-82551105367e','${rolesScopeConsentText}','consent.screen.text'),('0d783cca-c3a4-4d95-ab32-82551105367e','true','display.on.consent.screen'),('0d783cca-c3a4-4d95-ab32-82551105367e','false','include.in.token.scope'),('176332ca-d883-4329-a9d4-68884a7c275e','','consent.screen.text'),('176332ca-d883-4329-a9d4-68884a7c275e','false','display.on.consent.screen'),('176332ca-d883-4329-a9d4-68884a7c275e','false','include.in.token.scope'),('2a8bc487-583c-43dc-8d29-1ad0950d438b','${profileScopeConsentText}','consent.screen.text'),('2a8bc487-583c-43dc-8d29-1ad0950d438b','true','display.on.consent.screen'),('2a8bc487-583c-43dc-8d29-1ad0950d438b','true','include.in.token.scope'),('30fc52ff-ab28-4569-92e2-26fe8f73626c','','consent.screen.text'),('30fc52ff-ab28-4569-92e2-26fe8f73626c','false','display.on.consent.screen'),('30fc52ff-ab28-4569-92e2-26fe8f73626c','false','include.in.token.scope'),('356d3968-262b-4bee-8d44-0d93e880b01a','','consent.screen.text'),('356d3968-262b-4bee-8d44-0d93e880b01a','false','display.on.consent.screen'),('356d3968-262b-4bee-8d44-0d93e880b01a','false','include.in.token.scope'),('3617b695-9239-4d20-9271-32aa00a4825a','${profileScopeConsentText}','consent.screen.text'),('3617b695-9239-4d20-9271-32aa00a4825a','true','display.on.consent.screen'),('3617b695-9239-4d20-9271-32aa00a4825a','true','include.in.token.scope'),('4072c001-f7e7-4fa4-9f9f-0f099a308dfe','${phoneScopeConsentText}','consent.screen.text'),('4072c001-f7e7-4fa4-9f9f-0f099a308dfe','true','display.on.consent.screen'),('4072c001-f7e7-4fa4-9f9f-0f099a308dfe','true','include.in.token.scope'),('41cca0ba-533b-45a7-99c1-8b4ecf149f06','${rolesScopeConsentText}','consent.screen.text'),('41cca0ba-533b-45a7-99c1-8b4ecf149f06','true','display.on.consent.screen'),('41cca0ba-533b-45a7-99c1-8b4ecf149f06','false','include.in.token.scope'),('433a8036-5c4d-4675-a59e-2ac046db7713','','consent.screen.text'),('433a8036-5c4d-4675-a59e-2ac046db7713','false','display.on.consent.screen'),('433a8036-5c4d-4675-a59e-2ac046db7713','false','include.in.token.scope'),('467375c3-0f8a-490f-b105-0bb44c15a518','${addressScopeConsentText}','consent.screen.text'),('467375c3-0f8a-490f-b105-0bb44c15a518','true','display.on.consent.screen'),('467375c3-0f8a-490f-b105-0bb44c15a518','true','include.in.token.scope'),('4d7db1a2-1bb6-4104-801b-ea18bd31d25e','${addressScopeConsentText}','consent.screen.text'),('4d7db1a2-1bb6-4104-801b-ea18bd31d25e','true','display.on.consent.screen'),('4d7db1a2-1bb6-4104-801b-ea18bd31d25e','true','include.in.token.scope'),('5610c6b0-c1a2-4482-a1b8-d337404da618','${phoneScopeConsentText}','consent.screen.text'),('5610c6b0-c1a2-4482-a1b8-d337404da618','true','display.on.consent.screen'),('5610c6b0-c1a2-4482-a1b8-d337404da618','true','include.in.token.scope'),('5753f684-aa1d-4cc0-88aa-98a2f0cab3af','${emailScopeConsentText}','consent.screen.text'),('5753f684-aa1d-4cc0-88aa-98a2f0cab3af','true','display.on.consent.screen'),('5753f684-aa1d-4cc0-88aa-98a2f0cab3af','true','include.in.token.scope'),('5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1','${addressScopeConsentText}','consent.screen.text'),('5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1','true','display.on.consent.screen'),('5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1','true','include.in.token.scope'),('63210a8a-0008-4908-a26e-c374667cf2ea','${profileScopeConsentText}','consent.screen.text'),('63210a8a-0008-4908-a26e-c374667cf2ea','true','display.on.consent.screen'),('63210a8a-0008-4908-a26e-c374667cf2ea','true','include.in.token.scope'),('76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0','${samlRoleListScopeConsentText}','consent.screen.text'),('76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0','true','display.on.consent.screen'),('77249e04-e2d2-4031-9667-8786a866947c','${emailScopeConsentText}','consent.screen.text'),('77249e04-e2d2-4031-9667-8786a866947c','true','display.on.consent.screen'),('77249e04-e2d2-4031-9667-8786a866947c','true','include.in.token.scope'),('7f8eb3f6-36a3-4334-926c-7e7a067a96ad','${offlineAccessScopeConsentText}','consent.screen.text'),('7f8eb3f6-36a3-4334-926c-7e7a067a96ad','true','display.on.consent.screen'),('815f7fe2-91f6-474c-ba61-a72d19605316','${emailScopeConsentText}','consent.screen.text'),('815f7fe2-91f6-474c-ba61-a72d19605316','true','display.on.consent.screen'),('815f7fe2-91f6-474c-ba61-a72d19605316','true','include.in.token.scope'),('8c3bdc03-95db-4a61-833f-d816bc6d702c','${phoneScopeConsentText}','consent.screen.text'),('8c3bdc03-95db-4a61-833f-d816bc6d702c','true','display.on.consent.screen'),('8c3bdc03-95db-4a61-833f-d816bc6d702c','true','include.in.token.scope'),('90332860-b400-4df0-b3a0-5ddee0d59319','${phoneScopeConsentText}','consent.screen.text'),('90332860-b400-4df0-b3a0-5ddee0d59319','true','display.on.consent.screen'),('90332860-b400-4df0-b3a0-5ddee0d59319','true','include.in.token.scope'),('91926bc4-0204-43c3-a034-67e94de06f80','${rolesScopeConsentText}','consent.screen.text'),('91926bc4-0204-43c3-a034-67e94de06f80','true','display.on.consent.screen'),('91926bc4-0204-43c3-a034-67e94de06f80','false','include.in.token.scope'),('95552cf7-ce2a-4b2d-a8cc-6595013f1e87','false','display.on.consent.screen'),('95552cf7-ce2a-4b2d-a8cc-6595013f1e87','true','include.in.token.scope'),('b010f421-6272-47b6-9e2a-2e4368ef8869','${offlineAccessScopeConsentText}','consent.screen.text'),('b010f421-6272-47b6-9e2a-2e4368ef8869','true','display.on.consent.screen'),('b8ee5766-81f3-4388-a09d-ccbd286cc542','${samlRoleListScopeConsentText}','consent.screen.text'),('b8ee5766-81f3-4388-a09d-ccbd286cc542','true','display.on.consent.screen'),('c32f9638-55d0-4d5a-a3fb-feb682bc420c','false','display.on.consent.screen'),('c32f9638-55d0-4d5a-a3fb-feb682bc420c','true','include.in.token.scope'),('c81a0d08-591a-4602-9ef1-9acbd7902e86','${profileScopeConsentText}','consent.screen.text'),('c81a0d08-591a-4602-9ef1-9acbd7902e86','true','display.on.consent.screen'),('c81a0d08-591a-4602-9ef1-9acbd7902e86','true','include.in.token.scope'),('c860f1d3-2172-40b1-9ce2-84911e6a17a9','${samlRoleListScopeConsentText}','consent.screen.text'),('c860f1d3-2172-40b1-9ce2-84911e6a17a9','true','display.on.consent.screen'),('e7c2df73-1988-4b3e-b971-24cd27bb2a0f','${offlineAccessScopeConsentText}','consent.screen.text'),('e7c2df73-1988-4b3e-b971-24cd27bb2a0f','true','display.on.consent.screen'),('ee7ace46-13d6-42c2-9718-1c0cbd9418a8','false','display.on.consent.screen'),('ee7ace46-13d6-42c2-9718-1c0cbd9418a8','true','include.in.token.scope'),('f070e008-1bf3-4354-9566-af729276ee3e','${emailScopeConsentText}','consent.screen.text'),('f070e008-1bf3-4354-9566-af729276ee3e','true','display.on.consent.screen'),('f070e008-1bf3-4354-9566-af729276ee3e','true','include.in.token.scope'),('f8b8a1e5-c804-4695-b5b1-35c66ddbabee','false','display.on.consent.screen'),('f8b8a1e5-c804-4695-b5b1-35c66ddbabee','true','include.in.token.scope'),('fb50c6e7-5a41-49e1-a6d1-933d23ad0663','${offlineAccessScopeConsentText}','consent.screen.text'),('fb50c6e7-5a41-49e1-a6d1-933d23ad0663','true','display.on.consent.screen'),('fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71','${samlRoleListScopeConsentText}','consent.screen.text'),('fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71','true','display.on.consent.screen');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_CLIENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_CLIENT`
--

LOCK TABLES `CLIENT_SCOPE_CLIENT` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_CLIENT` VALUES ('0ae8de67-23f4-49b2-8672-75bb2dedc900','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('0ae8de67-23f4-49b2-8672-75bb2dedc900','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('0ae8de67-23f4-49b2-8672-75bb2dedc900','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('0ae8de67-23f4-49b2-8672-75bb2dedc900','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('0ae8de67-23f4-49b2-8672-75bb2dedc900','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('0ae8de67-23f4-49b2-8672-75bb2dedc900','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('0ae8de67-23f4-49b2-8672-75bb2dedc900','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('0ae8de67-23f4-49b2-8672-75bb2dedc900','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('0ae8de67-23f4-49b2-8672-75bb2dedc900','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('1288ec7b-6f3d-429e-b43e-2e0b710239ba','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('1472daaa-5420-4b1f-bfb2-f184f16a8320','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('1472daaa-5420-4b1f-bfb2-f184f16a8320','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('1472daaa-5420-4b1f-bfb2-f184f16a8320','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('1472daaa-5420-4b1f-bfb2-f184f16a8320','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('1472daaa-5420-4b1f-bfb2-f184f16a8320','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('188df32b-7999-4ebb-9c06-f0087380f68d','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('188df32b-7999-4ebb-9c06-f0087380f68d','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('188df32b-7999-4ebb-9c06-f0087380f68d','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('188df32b-7999-4ebb-9c06-f0087380f68d','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('188df32b-7999-4ebb-9c06-f0087380f68d','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('188df32b-7999-4ebb-9c06-f0087380f68d','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('188df32b-7999-4ebb-9c06-f0087380f68d','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('188df32b-7999-4ebb-9c06-f0087380f68d','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('188df32b-7999-4ebb-9c06-f0087380f68d','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('30febc11-32fa-4349-a4db-a46a33775ab2','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('30febc11-32fa-4349-a4db-a46a33775ab2','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('30febc11-32fa-4349-a4db-a46a33775ab2','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('30febc11-32fa-4349-a4db-a46a33775ab2','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('30febc11-32fa-4349-a4db-a46a33775ab2','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('30febc11-32fa-4349-a4db-a46a33775ab2','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('30febc11-32fa-4349-a4db-a46a33775ab2','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('30febc11-32fa-4349-a4db-a46a33775ab2','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('30febc11-32fa-4349-a4db-a46a33775ab2','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('3d1bc1d3-98c0-4a03-abee-8057573ff7cb','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('3d7c0f55-4d00-4eb7-92fc-2ac879eba8fe','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('558bc5ae-068f-4e0b-b70a-170b730aa137','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('558bc5ae-068f-4e0b-b70a-170b730aa137','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('558bc5ae-068f-4e0b-b70a-170b730aa137','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('558bc5ae-068f-4e0b-b70a-170b730aa137','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('558bc5ae-068f-4e0b-b70a-170b730aa137','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('558bc5ae-068f-4e0b-b70a-170b730aa137','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('558bc5ae-068f-4e0b-b70a-170b730aa137','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('558bc5ae-068f-4e0b-b70a-170b730aa137','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('558bc5ae-068f-4e0b-b70a-170b730aa137','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('5cef529c-ec43-419f-a198-7ce0e7ba6eb3','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('620c09d1-5d44-4bda-959f-82ff964b0f98','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('620c09d1-5d44-4bda-959f-82ff964b0f98','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('620c09d1-5d44-4bda-959f-82ff964b0f98','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('620c09d1-5d44-4bda-959f-82ff964b0f98','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('620c09d1-5d44-4bda-959f-82ff964b0f98','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('620c09d1-5d44-4bda-959f-82ff964b0f98','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('620c09d1-5d44-4bda-959f-82ff964b0f98','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('620c09d1-5d44-4bda-959f-82ff964b0f98','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('620c09d1-5d44-4bda-959f-82ff964b0f98','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('78044321-1410-42bf-9489-f89303e77e5a','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('78044321-1410-42bf-9489-f89303e77e5a','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('78044321-1410-42bf-9489-f89303e77e5a','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('78044321-1410-42bf-9489-f89303e77e5a','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('78044321-1410-42bf-9489-f89303e77e5a','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('78044321-1410-42bf-9489-f89303e77e5a','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('78044321-1410-42bf-9489-f89303e77e5a','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('78044321-1410-42bf-9489-f89303e77e5a','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('78044321-1410-42bf-9489-f89303e77e5a','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('89d22c6b-7a3a-406a-8635-049ea85abb55','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('89d22c6b-7a3a-406a-8635-049ea85abb55','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('89d22c6b-7a3a-406a-8635-049ea85abb55','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('89d22c6b-7a3a-406a-8635-049ea85abb55','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('89d22c6b-7a3a-406a-8635-049ea85abb55','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('89d22c6b-7a3a-406a-8635-049ea85abb55','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('89d22c6b-7a3a-406a-8635-049ea85abb55','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('89d22c6b-7a3a-406a-8635-049ea85abb55','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('89d22c6b-7a3a-406a-8635-049ea85abb55','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('98f16bf2-97bb-4489-a7ae-5dc9b260bb61','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('a46e6bdc-8a4f-4501-897d-efe09b633126','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('a46e6bdc-8a4f-4501-897d-efe09b633126','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('a46e6bdc-8a4f-4501-897d-efe09b633126','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('a46e6bdc-8a4f-4501-897d-efe09b633126','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('a46e6bdc-8a4f-4501-897d-efe09b633126','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('a46e6bdc-8a4f-4501-897d-efe09b633126','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('a46e6bdc-8a4f-4501-897d-efe09b633126','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('a46e6bdc-8a4f-4501-897d-efe09b633126','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('a46e6bdc-8a4f-4501-897d-efe09b633126','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('ab0c8a29-97d3-47bb-8756-47bb4deb34ed','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('ac8a7f4f-fefc-4a43-bc0f-b42078184dc5','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('af07419a-9fdd-48f8-bb86-98deababeb5d','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('af07419a-9fdd-48f8-bb86-98deababeb5d','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('af07419a-9fdd-48f8-bb86-98deababeb5d','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('af07419a-9fdd-48f8-bb86-98deababeb5d','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('af07419a-9fdd-48f8-bb86-98deababeb5d','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('af07419a-9fdd-48f8-bb86-98deababeb5d','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('af07419a-9fdd-48f8-bb86-98deababeb5d','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('af07419a-9fdd-48f8-bb86-98deababeb5d','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('af07419a-9fdd-48f8-bb86-98deababeb5d','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('b3fea689-45c7-4c2b-96ef-b389a0355159','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('b3fea689-45c7-4c2b-96ef-b389a0355159','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('b3fea689-45c7-4c2b-96ef-b389a0355159','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('b3fea689-45c7-4c2b-96ef-b389a0355159','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('b3fea689-45c7-4c2b-96ef-b389a0355159','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('b3fea689-45c7-4c2b-96ef-b389a0355159','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('b3fea689-45c7-4c2b-96ef-b389a0355159','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('b3fea689-45c7-4c2b-96ef-b389a0355159','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('b3fea689-45c7-4c2b-96ef-b389a0355159','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('b53a1923-71b3-4fbf-be97-b1573d596e47','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('b53a1923-71b3-4fbf-be97-b1573d596e47','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('b53a1923-71b3-4fbf-be97-b1573d596e47','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('b53a1923-71b3-4fbf-be97-b1573d596e47','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('b53a1923-71b3-4fbf-be97-b1573d596e47','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('b53a1923-71b3-4fbf-be97-b1573d596e47','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('b53a1923-71b3-4fbf-be97-b1573d596e47','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('b53a1923-71b3-4fbf-be97-b1573d596e47','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('b53a1923-71b3-4fbf-be97-b1573d596e47','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('cb884845-e614-4c6e-9508-6fd6ae87fd60','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('cb884845-e614-4c6e-9508-6fd6ae87fd60','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('cb884845-e614-4c6e-9508-6fd6ae87fd60','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('cb884845-e614-4c6e-9508-6fd6ae87fd60','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('cb884845-e614-4c6e-9508-6fd6ae87fd60','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('e233b1cf-3455-4e60-9488-ec12dfa884d2','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('e233b1cf-3455-4e60-9488-ec12dfa884d2','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('e233b1cf-3455-4e60-9488-ec12dfa884d2','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('e233b1cf-3455-4e60-9488-ec12dfa884d2','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('e233b1cf-3455-4e60-9488-ec12dfa884d2','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('e4a28241-1c05-44ae-b925-60ec5611edfe','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('e4a28241-1c05-44ae-b925-60ec5611edfe','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('e4a28241-1c05-44ae-b925-60ec5611edfe','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('e4a28241-1c05-44ae-b925-60ec5611edfe','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('e4a28241-1c05-44ae-b925-60ec5611edfe','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('e4a28241-1c05-44ae-b925-60ec5611edfe','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('e4a28241-1c05-44ae-b925-60ec5611edfe','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('e4a28241-1c05-44ae-b925-60ec5611edfe','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('e4a28241-1c05-44ae-b925-60ec5611edfe','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('ead46d75-3ebd-458d-8d9a-8df75b027507','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('ead46d75-3ebd-458d-8d9a-8df75b027507','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('ead46d75-3ebd-458d-8d9a-8df75b027507','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('ead46d75-3ebd-458d-8d9a-8df75b027507','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('ead46d75-3ebd-458d-8d9a-8df75b027507','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('ead46d75-3ebd-458d-8d9a-8df75b027507','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('ead46d75-3ebd-458d-8d9a-8df75b027507','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('ead46d75-3ebd-458d-8d9a-8df75b027507','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('ead46d75-3ebd-458d-8d9a-8df75b027507','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('ed3808cd-8f8d-4896-bc6a-01a16112a3c6','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary ''),('eec28897-b54a-4d82-9488-f454e28d01ea','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('eec28897-b54a-4d82-9488-f454e28d01ea','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('eec28897-b54a-4d82-9488-f454e28d01ea','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('eec28897-b54a-4d82-9488-f454e28d01ea','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('eec28897-b54a-4d82-9488-f454e28d01ea','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('eec28897-b54a-4d82-9488-f454e28d01ea','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('eec28897-b54a-4d82-9488-f454e28d01ea','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('eec28897-b54a-4d82-9488-f454e28d01ea','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('eec28897-b54a-4d82-9488-f454e28d01ea','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0');
/*!40000 ALTER TABLE `CLIENT_SCOPE_CLIENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `CLIENT_SCOPE_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SCOPE_ROLE_MAPPING`
--

LOCK TABLES `CLIENT_SCOPE_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `CLIENT_SCOPE_ROLE_MAPPING` VALUES ('b010f421-6272-47b6-9e2a-2e4368ef8869','d0472798-0773-4a9a-9ea1-0547f4968d28'),('fb50c6e7-5a41-49e1-a6d1-933d23ad0663','44f11c4f-11de-4930-a9bb-66f1504833af');
/*!40000 ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION`
--

DROP TABLE IF EXISTS `CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REDIRECT_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STATE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `SESSION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_METHOD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`),
  CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION`
--

LOCK TABLES `CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_AUTH_STATUS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STATUS` int DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`),
  CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_AUTH_STATUS`
--

LOCK TABLES `CLIENT_SESSION_AUTH_STATUS` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_AUTH_STATUS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_NOTE`
--

LOCK TABLES `CLIENT_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_PROT_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`),
  CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_PROT_MAPPER`
--

LOCK TABLES `CLIENT_SESSION_PROT_MAPPER` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_PROT_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

DROP TABLE IF EXISTS `CLIENT_SESSION_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`),
  CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_SESSION_ROLE`
--

LOCK TABLES `CLIENT_SESSION_ROLE` WRITE;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_SESSION_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `CLIENT_USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CLIENT_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_SESSION`,`NAME`),
  CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CLIENT_USER_SESSION_NOTE`
--

LOCK TABLES `CLIENT_USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `CLIENT_USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT`
--

DROP TABLE IF EXISTS `COMPONENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PARENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SUB_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`),
  CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT`
--

LOCK TABLES `COMPONENT` WRITE;
/*!40000 ALTER TABLE `COMPONENT` DISABLE KEYS */;
INSERT INTO `COMPONENT` VALUES ('0f2de35b-7745-490e-80dd-850657436c56','Allowed Protocol Mapper Types','hi-library','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','authenticated'),('137ba95a-167d-446c-bf80-afc78ee43164','aes-generated','hi-therapist','aes-generated','org.keycloak.keys.KeyProvider','hi-therapist',NULL),('148d1e6a-42c5-47ae-b004-a9ff418c7887','Allowed Client Scopes','hi','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','anonymous'),('2638397a-3bfd-4836-b359-b9370ad2a0cd','Consent Required','hi','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','anonymous'),('2f6d4da9-637b-453e-8332-025bdf01f579','Allowed Protocol Mapper Types','hi-library','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','anonymous'),('334e8014-e4d6-4a45-99f5-73976da3ca56','Allowed Client Scopes','hi-therapist','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','anonymous'),('3cca899d-df2b-4302-9d8d-df5145f08850','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('3da0efd7-4ef0-41fc-b2ce-f3d5d35e0082','fallback-HS256','master','hmac-generated','org.keycloak.keys.KeyProvider','master',NULL),('3fd3d13d-23c7-467d-923a-56a0baa51650','Allowed Client Scopes','master','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('46ef48a2-728c-479c-b72e-8a9c11875e8e','hmac-generated','hi','hmac-generated','org.keycloak.keys.KeyProvider','hi',NULL),('4b36b440-8bc8-4bf0-9467-e06138dae9b2','Max Clients Limit','master','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('4dfdac19-0b85-4d57-9c2d-ba1fcf698252','fallback-RS256','master','rsa-generated','org.keycloak.keys.KeyProvider','master',NULL),('4f1fc2ce-324f-4e91-b0bf-ddb55d3c3a0d','Max Clients Limit','hi','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','anonymous'),('5dc8ead5-ae0f-4e17-96e5-e33bd2c445c9','Allowed Client Scopes','hi-therapist','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','authenticated'),('66d2b7d2-1518-4922-9cd3-97cda703360b','hmac-generated','hi-library','hmac-generated','org.keycloak.keys.KeyProvider','hi-library',NULL),('6822428d-2cb7-4cf4-ba70-0efaef4e4f7f','Consent Required','master','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('6c559237-b384-4b5a-94e7-acdf03cabbbe','Max Clients Limit','hi-library','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','anonymous'),('8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','Allowed Protocol Mapper Types','hi','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','anonymous'),('93cf24a0-3f73-4342-8b0f-2929111f5527','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','authenticated'),('9a0b8b92-4257-4911-a948-6d0a89644198','aes-generated','hi-library','aes-generated','org.keycloak.keys.KeyProvider','hi-library',NULL),('9c25a697-cd42-40fa-a47e-42d3a754c43a','Allowed Protocol Mapper Types','hi-therapist','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','anonymous'),('9db23f98-215c-4267-b4be-b81ba957f0a6','Allowed Client Scopes','hi-library','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','anonymous'),('a15b9aa3-6773-4a4b-8ba2-66e6d6c9cf85','Full Scope Disabled','hi-library','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','anonymous'),('a3d3811b-01c1-444c-94bd-633b12face97','Consent Required','hi-library','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','anonymous'),('a730c2af-3051-4fd2-ac3a-a87a4eaf279d','Allowed Client Scopes','hi-library','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','authenticated'),('a8a221a5-0304-4825-b9c0-f2a288b4cdac','aes-generated','hi','aes-generated','org.keycloak.keys.KeyProvider','hi',NULL),('b28cf178-dd17-406b-ba78-d3fe47126065','rsa-generated','hi-therapist','rsa-generated','org.keycloak.keys.KeyProvider','hi-therapist',NULL),('bcc79912-6111-4ad8-a5a1-50d374b97922','Allowed Client Scopes','hi','allowed-client-templates','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','authenticated'),('bf58af08-912d-4825-bb3a-b00d4acd680e','Full Scope Disabled','hi-therapist','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','anonymous'),('c0654b8e-517a-4ca4-834a-7a01b80dbf01','rsa-generated','hi-library','rsa-generated','org.keycloak.keys.KeyProvider','hi-library',NULL),('c28e3df5-03e4-4df5-81c6-bdcd22d00e56','Trusted Hosts','hi','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','anonymous'),('c5486a24-254f-4df0-9e83-5150741c9523','Full Scope Disabled','master','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ca974dea-4e17-4d0e-8c4e-da1c54396693','Allowed Protocol Mapper Types','hi-therapist','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','authenticated'),('ccafc9dc-c46d-4152-b826-ceed1fa8603b','hmac-generated','hi-therapist','hmac-generated','org.keycloak.keys.KeyProvider','hi-therapist',NULL),('d20d8481-15f9-46c4-8799-bc6b6753172f','Trusted Hosts','hi-therapist','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','anonymous'),('d3cd434b-6615-46df-9538-47542fc703e4','Max Clients Limit','hi-therapist','max-clients','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','anonymous'),('db43d4bd-adbe-4714-a852-8ff5d35d2e67','Full Scope Disabled','hi','scope','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','anonymous'),('db486354-2203-40a6-813b-892ea741a63d','Allowed Protocol Mapper Types','master','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous'),('ddf9e42a-d618-4231-938c-98d5cf7187ef','Allowed Protocol Mapper Types','hi','allowed-protocol-mappers','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi','authenticated'),('decee23a-28c9-4bbb-bcfa-64f419b386d3','rsa-generated','hi','rsa-generated','org.keycloak.keys.KeyProvider','hi',NULL),('e83e4721-7093-494e-bf3e-b5e59da89534','Consent Required','hi-therapist','consent-required','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-therapist','anonymous'),('f4c53734-0889-4684-b3e3-c1404b14ea91','Trusted Hosts','hi-library','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','hi-library','anonymous'),('f902c9fe-e62f-4905-8400-1e73df9c9b4f','Trusted Hosts','master','trusted-hosts','org.keycloak.services.clientregistration.policy.ClientRegistrationPolicy','master','anonymous');
/*!40000 ALTER TABLE `COMPONENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPONENT_CONFIG`
--

DROP TABLE IF EXISTS `COMPONENT_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `COMPONENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`),
  CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPONENT_CONFIG`
--

LOCK TABLES `COMPONENT_CONFIG` WRITE;
/*!40000 ALTER TABLE `COMPONENT_CONFIG` DISABLE KEYS */;
INSERT INTO `COMPONENT_CONFIG` VALUES ('004478e6-bfd9-4dbc-b063-adf07400e89e','ccafc9dc-c46d-4152-b826-ceed1fa8603b','algorithm','HS256'),('0088cd0c-e160-40d0-99a0-4a09062e2674','decee23a-28c9-4bbb-bcfa-64f419b386d3','privateKey','MIIEpAIBAAKCAQEArK/6sGeTqveBuL75s5fSFK+q5fplEed2JfYNtrSswSlCbLC7iHv4i0BSgDz3cFX+d1C2vaRuQIDb6PsOexFE6+E9BZsVDYWpXhjOLebHO1ULlIp9QTGbQB6PMKMRbjzfhAP056FCxNslwyaFTV5KvhkwP6yveBdCeEu/VJALpjWwYOYnf0EPgo2Q4qSMsCXrnvBKVjzzBM+MtoxSuUbr8dgjDpUA8cXqeBNn3q0CvB5/lucQw1F3KQ6P85ALrP1NHYw6eMJrc1HZmUxKr+WvOzliE9ZjgBFC1b7/RMmuhecdw+2x4ojBv2o7t/7Sj7/O9Vly8cCNUeoby6xZ35HLawIDAQABAoIBACxq42dmbOQn35T+gknAfkfV23ZmDoMpbwlanbJmDJ1umGhOmR4FDSv8MnxLsjWR2O8lsqta1QUAYBAwK0xaZ8joWYLMngCpZaQPa1EBMDPBr0XYzVjsgotekOQovX4GaFOTlPXTU9JAsBjfGqCI5V66Kd/m8gdIrE825JLCrkxkzGE1TmKjFmt8D0xUmtP12xEn1zy+TCOoY1xtOd33YwK1lrrq7euexiwswxXjOCTbH3FYWW6ktDzqoBNimJNkYLvD96Jgz5O8XXJ5NFStXMxBj9ZW7B2r0XBdtAPbdxF6L01KjxhJeZbfIaXXhaYgV93JBDx7sX7v30+rugZLQTECgYEA5AibRLq4x91sTy9gK6oPg+iXzz8vqjYmsN0Ln8/VsBmWaYgFVI6jJ4zYsjHJlHygoxsazVf+Lq2hMwEAwoe4uUnFH7uKmkHEV0GY89mUwBc6UutVdRpy9D3pgiNt2lkHhws6SjqvZfijZqPl/SvSeWNTjHG3503DmwA3R4L1d9kCgYEAwd22GA7ostK6Vy7uzN7GODlFO8SzwuhwOlAZ1fWmAegScTb1WZTsCDssJEy1DOalavESXjF6RNPzqHR4eeEkQi6c+Iiip8WATyqSRA2dd5zoBQ+Gf29S1+B7/RGSk9iJ3SotTTfaybTvzD2F/La1jdmRme/iSZyOphmTkivu9uMCgYEA0aM/622l1sivfBTX2wya+u/oMLWsQlVKOKretutBToYXi6lrDROc1w1bYmb3JTV2EL0oZMOSgKNLYTJ42l4f6ufw+31UrP/tWzKJRRUw9W/lRLnpdKD+MaCBfgzIP0Y9717ZFcjh22M8BW6ET73r34D7HFCne1Q4kdUe/PVeafECgYB6oPLhLvUUwGUsZryZDMWXpOpdTyRiQsNSr35YL+WNSS35PUlfG+tdnYhjgb34ZiD2j30N5gAwb12uDdZzSe20i2WxdERnGW/7I7OXpoEXu0GsidCK5XEiqpXjU21DZfJ22ooDUTRs6K3SpIwPecdH7frCw9GAvK4i9QS6rl2e/wKBgQCvJn1sVJAnF9lc4rwgVY36k1iFenzBi+bqkW2FiAsU4vfJ3lI9FdCqietn3Dr5UbrSgQie5HrwUVNh+poj3DAi7aE4o7bKyxiaFuK3apTEj+O2lc8n0nydgakGBQph4D338SPcACmkfADJsVT70UetlTwXO9Lr8KKecvkLTK0fAQ=='),('013e56d9-f0cd-4da6-8c57-5eafe66dc666','4dfdac19-0b85-4d57-9c2d-ba1fcf698252','algorithm','RS256'),('01e8365e-64b6-4675-a502-7d123545e3ef','decee23a-28c9-4bbb-bcfa-64f419b386d3','priority','100'),('036457f3-44e7-4a99-be4d-d61cdb47cedb','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('04bbc458-33df-434b-8699-13c1fbd9541c','f4c53734-0889-4684-b3e3-c1404b14ea91','host-sending-registration-request-must-match','true'),('0a313d45-d1f9-4daa-95ca-633ddf6c98b9','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('0cf4e24f-1c78-41e7-b32a-eeae8d1d3e75','137ba95a-167d-446c-bf80-afc78ee43164','secret','t3c9soGIzhteUeh3uFn-4g'),('0d32b7b8-4088-4c93-a548-668e3ae140f4','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('108dce6b-5f89-4d0f-84e9-1ad89efbf760','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','saml-user-property-mapper'),('12345dbf-d11a-4cda-b4aa-22ae0843bf98','ccafc9dc-c46d-4152-b826-ceed1fa8603b','secret','oGO9YVrDsnjYAWivxSFQP3NJksI_kPXWjwoYuhRQt0RWm-V-k-_UYGjWefk65DOp-6NTFt4UEWd1U1abzWsmlg'),('1386d7ca-71f2-4ad6-8ad2-e8d07d638784','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','oidc-address-mapper'),('17f247ba-e628-4441-bc2a-c6f84dbf8008','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('1c897561-7847-42ae-9427-c8bc9b0c0ef9','3da0efd7-4ef0-41fc-b2ce-f3d5d35e0082','secret','-ZC2J1vM11a89K09R_V-mVBMc1vNjbyZqzMv0cLsXrP02xQ0RGBkq-dOz1cqhLLZSRMOfUY_Pwf8HbROpBD4cA'),('223418f8-7bd2-4f83-a947-83c494e809c0','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','saml-role-list-mapper'),('26eef781-e7c5-44a0-af66-3632e80bdd45','4f1fc2ce-324f-4e91-b0bf-ddb55d3c3a0d','max-clients','200'),('27d92277-95bc-4322-b9c5-539a75830c06','46ef48a2-728c-479c-b72e-8a9c11875e8e','kid','ce0a48f7-cb22-49a6-acec-2adeb058f51b'),('28fc1972-1231-40d2-9bc7-9bfc767283bc','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','oidc-full-name-mapper'),('2fe96ba6-85b1-42b8-a2b7-d0b043c815ac','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('3113d84e-2401-4082-ba11-b6bc3caa640a','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('35ae0be7-ab93-45ab-948a-23bdd86e8c56','3da0efd7-4ef0-41fc-b2ce-f3d5d35e0082','algorithm','HS256'),('392d3f59-bb14-48d9-a3c8-824dddc7a4b3','66d2b7d2-1518-4922-9cd3-97cda703360b','algorithm','HS256'),('3c48f65f-abfc-4c05-8b1e-4d40d8d1ec88','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('3fed1347-0d9e-4958-b50a-276074296356','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('42f11598-f5bb-4f34-92de-05564732e1f3','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('45178705-0aa7-4288-8a8c-ddfa669d7a05','46ef48a2-728c-479c-b72e-8a9c11875e8e','algorithm','HS256'),('48c632aa-fe2d-443c-8c83-e95619d3d3fd','d20d8481-15f9-46c4-8799-bc6b6753172f','host-sending-registration-request-must-match','true'),('48f10398-1535-4bb5-8197-fabd0a907804','9a0b8b92-4257-4911-a948-6d0a89644198','secret','p4hUVFzDHU9lGWtESIWpzg'),('513591f7-223d-41b2-ba42-841975cf4e70','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('52ef78a2-9ca2-4d2b-a303-994c2a5aab3f','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('5469d6a2-64e6-4ea4-82a5-0969613a4884','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('56c527cc-d0b3-4d9e-b5a4-16c11ff1ab9e','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5ba20b28-37c6-4aa8-921d-5e06eb1c2214','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','saml-user-property-mapper'),('5cc2cfa6-a075-469f-bf7b-a8afc35b1f03','3da0efd7-4ef0-41fc-b2ce-f3d5d35e0082','priority','-100'),('5d6695cc-591a-4491-9281-a04d3d42587c','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','oidc-full-name-mapper'),('5e15e5ea-461f-49fc-8662-0462fbad4c58','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','oidc-address-mapper'),('5f6022af-ca23-44f5-b9bc-d83cf473b1aa','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','oidc-full-name-mapper'),('6067bf6d-6dc0-4761-bef8-605c10c2d009','137ba95a-167d-446c-bf80-afc78ee43164','priority','100'),('6124cc30-c95c-45b2-84df-1dd1acec1327','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('61543be8-8ad4-478d-8d65-1c1fd69c97d7','66d2b7d2-1518-4922-9cd3-97cda703360b','priority','100'),('621aefae-ae56-4b24-8509-5a634e8683a1','46ef48a2-728c-479c-b72e-8a9c11875e8e','priority','100'),('63195c22-4a58-47ff-9417-b408ccf5cad0','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('636ee3ff-f984-490c-aecf-230f8724fc4e','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('649c6bef-c213-4961-ad75-37ef933cb9c0','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','oidc-address-mapper'),('65f00671-e223-4bbd-b8a0-8082ed5cca66','6c559237-b384-4b5a-94e7-acdf03cabbbe','max-clients','200'),('662c354f-6c0a-455b-91a9-8109be0e8d65','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','saml-role-list-mapper'),('67ebb67f-5189-47da-9321-b4b31bfec3e1','137ba95a-167d-446c-bf80-afc78ee43164','kid','d85511ba-0602-4fe7-828b-115e0536c1e3'),('702f1279-5114-4c2d-96f0-08024118c458','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('74a533df-784c-4dbd-a935-df5ddb41b8d0','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','saml-role-list-mapper'),('7519edbb-d7be-4025-a029-00d25f591026','c0654b8e-517a-4ca4-834a-7a01b80dbf01','certificate','MIICozCCAYsCBgGD77rhETANBgkqhkiG9w0BAQsFADAVMRMwEQYDVQQDDApoaS1saWJyYXJ5MB4XDTIyMTAxOTEwMTA0NVoXDTMyMTAxOTEwMTIyNVowFTETMBEGA1UEAwwKaGktbGlicmFyeTCCASIwDQYJKoZIhvcNAQEBBQADggEPADCCAQoCggEBALXqUJeKbjfZPfcc7fh89eOfyiDI/D0jnkpS8xP5ytwPmne1nuQjANaTG6obIDp50AHCG5upOonRtS1ahPGVfvjP/S6Dfn3kAJyhmsh+DdeDM2kF/DIK93PR3ERoqNk+yS8/mZBweFDOVWfezb7F579rs4Z2y0Ybc6an3Q5Wfyjr7cet7gIuO1Pli3yJA9LDnCKa/Sk/N8ZOIZhfXsTQteTw1mVxcaGd+kJykDfHAklQMTopmJIBwkzxdQrLcDoWiQ0OJypwGjWopQBmpbifJEhC0/3yKliHCrJEr52nFh8TMxChUTGp1u3v1DlSYADmO/8VmmnxDKlyar5rsDcKJqECAwEAATANBgkqhkiG9w0BAQsFAAOCAQEAhsjfZQ6RkvTAEee2ISQsUKjtiakwCblyK6u6Nekyg8sRctgequh+FZ9CtZPrrfn/TjME2ZVztlNAI4ZTLj+7cikxBFzLYrTM0nwu4oU7BLdx2kOK5tbgt540eccbNJEI0Lka2ksO4bbre7KFTwzojBjxepnY2im2ukKj08kMvuBieIoZtaa5mZgYz9HBERpWDJZvGDWfxl3rNdPCkrKOr/NM4IVupoZihQtjkaCg5bB3VPeTk1wroZpRHC3t1KfxKVbKfuumP92NMH4SS6t1syh2qvm7K7+pPMza4yPYZGo78xsSeTRgc32eLW2XyCBPu4gzMkquIIG7vOTbVGhhKQ=='),('779f4ab7-f7c6-46bb-bf64-679d3b4d44c0','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','saml-role-list-mapper'),('78fa64be-29f7-47e7-a8bf-a9f97189dbe1','c0654b8e-517a-4ca4-834a-7a01b80dbf01','priority','100'),('7bca1dc4-b0be-4e73-b5d7-af7cef9dc3c6','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7cc9aebc-999b-4b67-a65b-a8af79f00b11','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','saml-role-list-mapper'),('7ea7ab84-1bdd-491c-bc65-3d7274b5cef4','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','saml-role-list-mapper'),('7f3d14f7-a544-4a78-b1c8-1dd0a3dd5562','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('7f4d8b79-c08d-4c25-8eb9-32f0c298621c','9db23f98-215c-4267-b4be-b81ba957f0a6','allow-default-scopes','true'),('8047357f-ea37-493d-a126-bea9faaeac89','b28cf178-dd17-406b-ba78-d3fe47126065','priority','100'),('82109a48-8897-4449-96f9-05c2a26006e8','3da0efd7-4ef0-41fc-b2ce-f3d5d35e0082','kid','95521a1b-8b66-4e80-b72a-60c284e0aef0'),('8492fc9f-122f-4c7a-8801-c1456c47b3a0','c28e3df5-03e4-4df5-81c6-bdcd22d00e56','client-uris-must-match','true'),('854480fa-589e-4be3-930d-1bf1b698ce21','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','oidc-address-mapper'),('8b476ece-2067-46b8-8152-e83faf3849e1','334e8014-e4d6-4a45-99f5-73976da3ca56','allow-default-scopes','true'),('8bc07731-f72c-4442-ae42-fabb49b78d11','f902c9fe-e62f-4905-8400-1e73df9c9b4f','host-sending-registration-request-must-match','true'),('8e36c473-68fa-460b-9391-a0f88c390071','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('92b4a736-37d0-4dbd-a635-7f6944de371d','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','oidc-full-name-mapper'),('9487397e-13f9-4636-8ca4-03fc5f35268d','a8a221a5-0304-4825-b9c0-f2a288b4cdac','priority','100'),('94ac23c9-69d2-4797-a03d-1be0d603c567','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','oidc-address-mapper'),('980b9f47-19bc-494b-adbf-998cabb9c289','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('9966875f-121f-4403-ac34-272250d234cb','b28cf178-dd17-406b-ba78-d3fe47126065','certificate','MIICpzCCAY8CBgGD77lcFjANBgkqhkiG9w0BAQsFADAXMRUwEwYDVQQDDAxoaS10aGVyYXBpc3QwHhcNMjIxMDE5MTAwOTA1WhcNMzIxMDE5MTAxMDQ1WjAXMRUwEwYDVQQDDAxoaS10aGVyYXBpc3QwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCJzCJiCn+DWtIBIezuRnRlZRtJJS8SeSPH2h35FLKF4xHztuu9wDfOzeF4Ill3cxSgbheWTmlhGbFx9jibXv8LOjCV7Gq8f843HhS5wJ5L45Jy6nCgDZoqQ+FSKECfFsEkBwcCGpB9WgXN8mYHnlKBV5vdkI6PkpSJAVPMDc2BXwIkXsfNy7X06lqqR0bI7mpdZRWfx5tAzj5pk0MCqXdPeBAmRsTlRMjO0Wz6uX/zuzsbjVszC0Mbrd30XxhR/sbcI8rbbgqjEoSkza3qdV2VDr2mhBNW8xM2arFWA+PQ9OC8Drg4XMUHen6lEi5pvvqlvPyncURnhpFgOfrqyGqHAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAAdH4hVI/oMT9OKWhtxxqdfuifDuVsNWUHwpaYKuVAXTzARzmHoKHUPiIDwdOuB+eqsGyNA7Gh01mb5lv/3GTzYXG1xwIkgCAc2VVdcmvZjXr4lfob2jCe5doZtVp1PUOHhsITqinAEIT65Nm4eOrBolEdzxvBMi3T66agw2rZ3OybYAuVlHn1V5KvWAEYf8nELfBn1XZySkT9s3lhubxFwEDVvm+LWS530SJOdbD/wnBna7F/mTb1+G9+9iDoHU8TDydZFv8LqPlvpZiEtsoG+Kz4f7ZHHVlxZfn6xoeNp/z01/Yc2XUreQOvUFphVu1dEzhthJvNvtufDrg82dDwI='),('99799766-721f-4969-a3bf-df0400bfb251','d3cd434b-6615-46df-9538-47542fc703e4','max-clients','200'),('99c849b0-dabf-4b4d-90da-fbdf0a54ecf8','d20d8481-15f9-46c4-8799-bc6b6753172f','client-uris-must-match','true'),('9c0baa5f-94f4-4bae-a33c-fc4d450c2d20','c0654b8e-517a-4ca4-834a-7a01b80dbf01','privateKey','MIIEpAIBAAKCAQEAtepQl4puN9k99xzt+Hz145/KIMj8PSOeSlLzE/nK3A+ad7We5CMA1pMbqhsgOnnQAcIbm6k6idG1LVqE8ZV++M/9LoN+feQAnKGayH4N14MzaQX8Mgr3c9HcRGio2T7JLz+ZkHB4UM5VZ97NvsXnv2uzhnbLRhtzpqfdDlZ/KOvtx63uAi47U+WLfIkD0sOcIpr9KT83xk4hmF9exNC15PDWZXFxoZ36QnKQN8cCSVAxOimYkgHCTPF1CstwOhaJDQ4nKnAaNailAGaluJ8kSELT/fIqWIcKskSvnacWHxMzEKFRManW7e/UOVJgAOY7/xWaafEMqXJqvmuwNwomoQIDAQABAoIBAHyt1ICYYwQqA3s7O6pkUs6odItV1PM+Vz3PbkRRnoSGuTK0qurnRqrJ9lr27nbFiBe8Ztmf+bv9m7Qy5w0Ajh6PxpG7k9VKkFTJueER7AC6LmEbtgbCV2js+49zP85tZsvYRjKlswCG+igPn2nSEAy1DzzobFdndzNQt4QdKlfrelDD/3Hsi3r9H/ydQQtzA+gAQxIg4X44lWNnqNQNnAShgoNGOwByIkibNxTwaGiC/1xVHH/RUgONmRa2jAScAbOm7gj/1QeJxVv1o+YuUlC8onyM9+VAeAjRyQ60Kc06yw95VV716Uq2dxXkvV0Gc2oNEcuW4ebtCrrYehBEO6UCgYEA7TbFgTwYPD3HbqkRSJfuDzQ8n3LbQsgAzWxPvQR54TTmU7F552NA+5VolBZPVCWL0zF8oE1wVZU5DFVVdhO15z/C/mR772/4iha67NO8QzrwJCUIlvaGszvFsREr+qh/rKO3AbG5eFdJwk2v2PE7xZqeFkdmcestZmIg02I7jjMCgYEAxFJt5eF7pg2SHkxIQGjPl7Vm8u6UxNJKdWHxY7WTgw3Dw1jKFfGHY3W9lhCiZqWaUV+myugefdP2jTeo+KIK/bZg3r0KaWOxjDOI99VmU8fY+wnYSXF3qaWHT3o66vEjdMRmGjhXacjD0nA/4YGe6bkA2YxQEChetj7DPX0ne9sCgYEAz9Ou0n0eFplhwxgo5lsF3Rg9DM2KQEYOPevpKIdlaOP579WMIieZZVIPX770HZsPmCbBM4jlJHYqlx2kVGEMe+AnLM5IrwyAyisD9j3DsXtPrbssfWbbuOhjWbDbwS4jPdPpoHhfMIn5O1zo9b7USVofqxE/Ngt/qTXL4Kct2nUCgYAMlyi7JHHUnWwwiz3a+53MofKfQ9PAp6fkzUo41c1HC1vxrEERlTLUmxl0hU6U/Kvf6h19R9OkyDI4rkgk4eeIi+i8gC0pwx4A2tE+662rU9bDiscXNrKw64+49iLPLHXUqD/QEKryetCsL0y5fqGdZaL7ULdVwfEJCQ9mYx9kHwKBgQDixMeLX+/fOmIJxxDmVM7Su/nLSzrZNRHjxdCOB3nxjOTVavWA1aysgmDakYLvAfjkVf4ZMgGeDaivaaQFlFmi/PZS/FXK+/X9cDNhT4OO27aY0c7Dz/yW3Y8vnWh5sBUvwCg84wycNSrF5zTYPDXuEGYnFSBdynrFORe9v77icw=='),('9c571f0a-669d-4ec9-b154-edef08320e07','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('9cd09308-a931-472f-b873-e5e26b25f447','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','oidc-address-mapper'),('9d156b7d-d6b9-4352-b9dc-89ba7136605b','66d2b7d2-1518-4922-9cd3-97cda703360b','kid','1757ba3e-58bf-459b-83bc-48e0cfb20a6e'),('9dded8fa-07c0-4160-a873-3c04cc96ca9c','4dfdac19-0b85-4d57-9c2d-ba1fcf698252','certificate','MIICmzCCAYMCBgGD77WDWDANBgkqhkiG9w0BAQsFADARMQ8wDQYDVQQDDAZtYXN0ZXIwHhcNMjIxMDE5MTAwNDUzWhcNMzIxMDE5MTAwNjMzWjARMQ8wDQYDVQQDDAZtYXN0ZXIwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCKNcq3fP1jjEe3Ab9JY7dbuDtYPlC2qHyUOzU8R3amTz7OcgNpFx5b5+25x5zNSGKjcZcmBZeMiNKWH5orH+vKu37lmflgyt39mPydyuRvrqqBsP+tc8JvEfGk87dIVacdBd6Tq8QFY2iEjqHWnjDTZ0HPhnnwkvQBpvxVWIf80/vnh3cN4X1bMwoZDmMsgobK/xOidJVe1nJWYGAOHLS2FOzmer7XqvoNlI53iAyhBU+iFqyeD1NkSYZvz6uhiSXIfg5dP3fSN9q+51svp5lZ6mNCnccsUYxfWIHSEZoc0gPJEAonNBOl16RQrrDNge8dOHLMaWD5xFbhiW4md/jvAgMBAAEwDQYJKoZIhvcNAQELBQADggEBAIb6X4QpmYcjyyN7ZSyRrsY5FdoaIGwVt4059fFiGqUfvELtHNKxBuVgmdmHpRVP2Hq2Nwr9Ueh/gdQdeL/yUGMovYaR5aqPULERTeq2hA7sk3QIZgsnqSGm+6CC7unZq/rByz5VJBoMITz1K3FUn4TjeLzbnIIyhm0120XWy6AtkbH0/Hgv4udCJS8RCFgSHw+tVgkSTkCmZhRVuv/KC5Udcy7EXPCw8sr693AhzcUuAeDhxaxfqqIZi2WQOe0fMD789cSSYNTcUXWWEhaCAgrG4sjm5oVureu/jGEPmcKd18MPV5LR34OQnR6BRWHad+jQOCGqZKl6WqZKeRQfk3Y='),('a1456f0e-cc9e-42e3-80cd-47912115f78b','4dfdac19-0b85-4d57-9c2d-ba1fcf698252','privateKey','MIIEogIBAAKCAQEAijXKt3z9Y4xHtwG/SWO3W7g7WD5Qtqh8lDs1PEd2pk8+znIDaRceW+ftuceczUhio3GXJgWXjIjSlh+aKx/ryrt+5Zn5YMrd/Zj8ncrkb66qgbD/rXPCbxHxpPO3SFWnHQXek6vEBWNohI6h1p4w02dBz4Z58JL0Aab8VViH/NP754d3DeF9WzMKGQ5jLIKGyv8TonSVXtZyVmBgDhy0thTs5nq+16r6DZSOd4gMoQVPohasng9TZEmGb8+roYklyH4OXT930jfavudbL6eZWepjQp3HLFGMX1iB0hGaHNIDyRAKJzQTpdekUK6wzYHvHThyzGlg+cRW4YluJnf47wIDAQABAoIBAAwQoA6eeZwsDcKbA3DLpKD8Fyof3nnjgWSLOp11e5UPC+OHrmaJHxxUxbrXAwgkjn/IFbK7ADzDYOa8AYBMPBAph+1RIKTjcLeHmF3J7WEWdUn3AorItStu/JIyuEg3Oexdq81mTClQQTp5HQWYL5j0xZjxG0n1+hj+0747iTt3wGAUCBJ+0ojcl700wDreLiPH1+aK4Lw1x7M72NqbtWynwF8RhfRmzl7bgfF8AwWLlZV88Hee4CqolSOpXzSfRcy4iQ4td603R138cbJ0q7H0dVq7oeM2IVKDyzfe+3hrse4pcoe70oY914ES23Kkr0iikl1B/RbxQHkexa3SWLkCgYEA5dheslw3NO9gAaj/tbWqlW8QokwJFk7HFLj73Ot3a8qilOfa311dw2Eo/me266ikHsgGAOXigj++CeOFNsFnyWPREF9niMjaqjdnckbnLzn7UdkBh5+JvGTEjr+mfsXE5JradVa4ovtw3+IHbDBOc/Gi1eJFTk9WV/9stV4jOKsCgYEAme//MPWNPY/LquE/EyW+Kv7bh2F7gOS4saZcxFtQwWiCAQ72R3lfZCbmOW5exsd9BJfnryPSb8sPrfAwX+8Za/c1ZG5nlFkENKJbRp1haLWm4GfSL5UDZGCNVr1MwLVfFVesWtBJlHXw6fqm4v9e+pi618PdtuRRS0AdlLv6yM0CgYA6SNsCqcXKI6WZ5iwp/Q5r5IU4UsW/JWzwgVRFGmTnLbR6xCzJlZiQUhQeJ1jIe7Rapeh309PTqaxcP5jpYLQb6rb6SucrVZu1rGUMIpS/chmcEMaFiNxZrMf3Vvw2i5o5Sld5h+s8UTy3WU7+jWVnm2/qgv2GNTI1EG2VtHCEDwKBgCRWQJjf/b0gamUl0mvEpwUjL9LfMfYVB3v310IKhB+DedyiGYR5pAjSHdpEsV6ezGX/LZNsE0qMVmEqp2Cd4hRYQGQ6o3yjHpkGEiGzGMFMz9185GKS/D//gp2NBccfiRhSn764GAZRaNLydd5zhYoF72TrOTTo5D+tHM51KRepAoGAFWs77KDnaPg+cPv3tWd8Jd6Vgc8Xp8ONAG88+G6+OazI6EuMlTFOqYXUCyJvlsSPwo4BqXv3xBmMv/iokRjBoNSow+Gr0qOdJ8eF04NqVFiYmFR//Ad/P02lFsYwBxX/ZtFYy9p9ReqKkgCF9+1kSbm5W2YqczSM6+ToBJiSMiA='),('a157ebff-c725-43ca-bce2-b5bb7c54428e','b28cf178-dd17-406b-ba78-d3fe47126065','privateKey','MIIEpAIBAAKCAQEAicwiYgp/g1rSASHs7kZ0ZWUbSSUvEnkjx9od+RSyheMR87brvcA3zs3heCJZd3MUoG4Xlk5pYRmxcfY4m17/CzowlexqvH/ONx4UucCeS+OScupwoA2aKkPhUihAnxbBJAcHAhqQfVoFzfJmB55SgVeb3ZCOj5KUiQFTzA3NgV8CJF7Hzcu19OpaqkdGyO5qXWUVn8ebQM4+aZNDAql3T3gQJkbE5UTIztFs+rl/87s7G41bMwtDG63d9F8YUf7G3CPK224KoxKEpM2t6nVdlQ69poQTVvMTNmqxVgPj0PTgvA64OFzFB3p+pRIuab76pbz8p3FEZ4aRYDn66shqhwIDAQABAoIBADU9Wrd4iOXObD8lxW4WaJhYZR9wr2w6w7lOq6/18DfMkL4SGakZoDZV01xgISMGopyNjK11JD/w9l8qm5pkLLRAyk7SpjaoRpuDEszmAAMgLRAbRmKAfuT/jwn4JWeSGhN6Z5nHe7YC1yVIF2WwJP52Q/FqDbqpDpyUl7TKTHFEG2+inN0eUia5P2k+9WLX/zDlaE40ba6ud0X/QBC+We9YzZ5qnNBEpzY/0l/3baR4gg6sYipNoGgIsqMpdaY+wXqTrLDHOvAG/JSFqPsvvZsJENotlFg/6tlqRAYCVAkmAghAsksDBRAHce6RoDollnvMrsHCwZGW0IFnVh1VK5ECgYEAy01/bt5xb2Ywj5qmnWmft4bd2DXD66IkOutvtlbRFMa1+faMCCBiX1UCugHYSdGWSr0x9xJD2GLKlo7cWRzE9YQ2iBpITsqbBAZO/kQVWs57hh71K9JhotVzruLNGjpYkHsFix37Nb3c8MIhrdXZaNCk6J4ItEZEJ3/g+zrZL/8CgYEArYPq+quaOEV5Mqe2G+me+R1vYLkJzccAk9ddtneCvqlJBxRhCZj7NRslOdLwLbFAoBob2amASNiu6+vF4/tM7cUa6mg4EQBFeJi6yT2GboCBM6J3mFjCDs/nHKci6Q53Zj22W68B/MUv5kowa8DHGe6KKoRvIZyrq3V8Dj/PRXkCgYEArIFIxRF4nTbPs7pc8CqkvHxylzgf0zwUk+4cL1MBPCjUVpJOBcM81Xlzw9M27IQri6V31RapfN1u20vDStXvhgg2oUvz2O9vk32q33Nzz0ZvZ8Gy9QkhkaKe82E8+alSZt4MORwqgVJmO9/t5ewT+y03EK6v4g/RWtbWVzZ6/Y8CgYEAg48T6L+XjLbQL+INJ5i4mjUBL5rcnhMWkwGl4iU3EoyT/DQtZvOA9EECtpcC2AIe98UT/LKRu6ne5q27OyJcr6LUx4oBiJJmGgvjA5YMiVgRni6+8tnJOSXVG1p2E7KOQQzlaRqGLTrtGHSDxg9CZp0AUUBcamW5m6TWTI+A/jECgYA6a7zzgq55p2nI9m8esTxfx12F54jrAX9Izo2CN9JZnTTE+zUZYBUHZ1cgr7YTBXdCRsnEpFqB0q8ho6Npm9hzBQriHaFnGlH2a6KLS6IZOnVn6DuTYeUEa8R9gygz5kaSxDnyiejPLAxiSHwkfY6anxdJfQBLVUCzx5lcg+mZHA=='),('a242b3de-81e3-4936-8c5c-8b083c7e0eba','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','saml-user-property-mapper'),('a39195c4-3368-4fcf-8ba0-9910cea63de0','0f2de35b-7745-490e-80dd-850657436c56','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('a69e2df5-0ac7-4be3-98e4-1b52ba9d05be','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','saml-user-property-mapper'),('a919c0a1-7338-450a-8fad-69eb155e3a00','a8a221a5-0304-4825-b9c0-f2a288b4cdac','kid','8f7ef3d6-22ce-4948-a520-bfbaf4b6964d'),('ad97892e-44e9-4430-912d-510c8b52b615','f4c53734-0889-4684-b3e3-c1404b14ea91','client-uris-must-match','true'),('aecfe0f2-c0bf-423d-a7f0-f56a87ca95cf','c28e3df5-03e4-4df5-81c6-bdcd22d00e56','host-sending-registration-request-must-match','true'),('b014aecc-d435-44e7-a602-178725bf6e0f','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('b2a60e25-e5b0-448c-b472-841b54677d8e','a730c2af-3051-4fd2-ac3a-a87a4eaf279d','allow-default-scopes','true'),('b2bfef96-75eb-4748-a0e0-cc4197225e02','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','saml-user-property-mapper'),('b2cfc2a7-be6d-4f92-967a-5c6197e097e6','46ef48a2-728c-479c-b72e-8a9c11875e8e','secret','V8OUlk5Ir9RkO2ybAKnMLUyhxo0c8WJ826CG6BCfwpJS9rKLcSil1xfAxLSciyKK4zu4eZOyrf9NBX-ZC3XXaA'),('bb516d72-80da-47aa-935e-822eafbc9fbf','a8a221a5-0304-4825-b9c0-f2a288b4cdac','secret','bhAAka2hr6wllZp1ubdR-g'),('bfb145e8-29ba-4d20-b9cd-a76a70081f08','f902c9fe-e62f-4905-8400-1e73df9c9b4f','client-uris-must-match','true'),('bfda6353-4fce-42eb-9a5f-b13ec3284deb','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','oidc-address-mapper'),('c2227c5f-8fe7-4079-916b-7acd3035b88c','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('c5117b0a-0e0d-4c25-8bee-dc9f14e102d0','4b36b440-8bc8-4bf0-9467-e06138dae9b2','max-clients','200'),('c6d804f6-d5e5-4de4-be90-9c4f859648ec','3cca899d-df2b-4302-9d8d-df5145f08850','allow-default-scopes','true'),('c77d65d3-9839-4d93-8f28-e621f6bae7ca','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','oidc-full-name-mapper'),('c98b4cfa-e89d-4a6d-a018-d4d7d04a723f','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','saml-user-property-mapper'),('cbb4a061-9b32-45b8-8e09-6b670ad87b1e','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('d2aa44ed-4ab6-45f5-be14-cbd8d6632f7d','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','oidc-full-name-mapper'),('d4b58c66-f7d1-49e9-b3e5-4668c1f18f77','5dc8ead5-ae0f-4e17-96e5-e33bd2c445c9','allow-default-scopes','true'),('d5ad690c-5f7a-4df9-9d4c-04143eeb48cd','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','saml-user-property-mapper'),('d646b452-30f9-4fcf-b422-e8531e6d5405','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','saml-role-list-mapper'),('d8d33941-dd13-42ae-814e-410de5602f18','9a0b8b92-4257-4911-a948-6d0a89644198','priority','100'),('dcaaf13e-85d8-4021-87e3-4b67655b200a','4dfdac19-0b85-4d57-9c2d-ba1fcf698252','priority','-100'),('dd32742a-6f9f-4e1d-b6bc-15d972df9a2f','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('dd43965c-d16a-4074-85a0-b5a2513aeb36','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('de414777-1173-458b-911c-8713b0de4e0c','3fd3d13d-23c7-467d-923a-56a0baa51650','allow-default-scopes','true'),('e0747da0-a53d-4ee3-b38d-95d139499952','9a0b8b92-4257-4911-a948-6d0a89644198','kid','882d5b8a-9126-41a0-9d39-550346870298'),('e0b34c4f-dd6d-4f19-b98a-d2e403749f5a','148d1e6a-42c5-47ae-b004-a9ff418c7887','allow-default-scopes','true'),('e16bc641-f736-46db-9d88-60af4a79b177','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','oidc-full-name-mapper'),('e2f2afca-b432-41ad-9436-2a4496eb0057','8e17d7c0-2557-4e3c-b4c0-f54fd03c9693','allowed-protocol-mapper-types','oidc-address-mapper'),('e6149682-d128-494b-97cb-72e4869d3e34','ccafc9dc-c46d-4152-b826-ceed1fa8603b','kid','1e67f508-3303-438c-8438-a50678e5a41e'),('e951b184-6b9d-4713-a314-a49a3ed3ab1c','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('e9a2fefc-fcab-44ae-a379-e709e831a18d','ca974dea-4e17-4d0e-8c4e-da1c54396693','allowed-protocol-mapper-types','oidc-sha256-pairwise-sub-mapper'),('ecb518e2-a0cd-4263-b1b7-057c1a297875','66d2b7d2-1518-4922-9cd3-97cda703360b','secret','lNFAUKjcQc_9ppuaGOKlgnfREzbLRFG-J2ZjgC-k8jHyuPRdkronFT8KRjCQAuvGwurckWvaSezt46Kx4TEMMQ'),('ecd2f35b-8edb-4fe1-a7ab-f6673a37200d','2f6d4da9-637b-453e-8332-025bdf01f579','allowed-protocol-mapper-types','saml-user-attribute-mapper'),('ee22f9c5-a413-4b49-b524-71b1927f440b','bcc79912-6111-4ad8-a5a1-50d374b97922','allow-default-scopes','true'),('ee34fdc9-6c3b-4ef5-8383-76446db8dd2e','ccafc9dc-c46d-4152-b826-ceed1fa8603b','priority','100'),('ee3e2771-ca77-4958-8bf4-de58fde0ddcc','9c25a697-cd42-40fa-a47e-42d3a754c43a','allowed-protocol-mapper-types','oidc-usermodel-property-mapper'),('f36347df-8a2c-4ea0-bf5d-5d3bbc211f9b','db486354-2203-40a6-813b-892ea741a63d','allowed-protocol-mapper-types','oidc-usermodel-attribute-mapper'),('f592093e-009a-4e06-a8a5-de3eb87f30ac','93cf24a0-3f73-4342-8b0f-2929111f5527','allowed-protocol-mapper-types','saml-user-property-mapper'),('f951a162-14ab-4b6e-acdb-ffdd83cb417a','decee23a-28c9-4bbb-bcfa-64f419b386d3','certificate','MIICkzCCAXsCBgGD77gm6jANBgkqhkiG9w0BAQsFADANMQswCQYDVQQDDAJoaTAeFw0yMjEwMTkxMDA3NDZaFw0zMjEwMTkxMDA5MjZaMA0xCzAJBgNVBAMMAmhpMIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEArK/6sGeTqveBuL75s5fSFK+q5fplEed2JfYNtrSswSlCbLC7iHv4i0BSgDz3cFX+d1C2vaRuQIDb6PsOexFE6+E9BZsVDYWpXhjOLebHO1ULlIp9QTGbQB6PMKMRbjzfhAP056FCxNslwyaFTV5KvhkwP6yveBdCeEu/VJALpjWwYOYnf0EPgo2Q4qSMsCXrnvBKVjzzBM+MtoxSuUbr8dgjDpUA8cXqeBNn3q0CvB5/lucQw1F3KQ6P85ALrP1NHYw6eMJrc1HZmUxKr+WvOzliE9ZjgBFC1b7/RMmuhecdw+2x4ojBv2o7t/7Sj7/O9Vly8cCNUeoby6xZ35HLawIDAQABMA0GCSqGSIb3DQEBCwUAA4IBAQBxcqtFV36YuF0SsXtlgN8GiAtyehqKiDvUeSAup6l47kR5ioPYHRmCPhGPHFZ8dFl1DXlXaErk68wQI7WanXyaEnpCSRvZPvLgrFKzFBjOMojBjy4jvVLbNPcOj6DrbbikLu5of4N57kDPjtrPaA3BKiZxXBae91po5GjMr5h1z3shCp3EfYIdf8EkpWyFi/h0w3IDowvqXsYD3z92wLKhsbxSTH1N03bQErN63BG9/gUtvKk3Kt4BUd48c3r7d8eu6Io+iesVsAAYC/Ls1i178l2UYqe8QIiQkjXDlQ1earyGXYOCFa05zlGvafGwam7ma00OJeKZV3KqmTxXEOwG'),('fdbc0d84-46af-4b6f-a9b7-50014f2e0d14','ddf9e42a-d618-4231-938c-98d5cf7187ef','allowed-protocol-mapper-types','saml-role-list-mapper');
/*!40000 ALTER TABLE `COMPONENT_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPOSITE_ROLE`
--

DROP TABLE IF EXISTS `COMPOSITE_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHILD_ROLE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  KEY `IDX_COMPOSITE` (`COMPOSITE`),
  KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`),
  CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPOSITE_ROLE`
--

LOCK TABLES `COMPOSITE_ROLE` WRITE;
/*!40000 ALTER TABLE `COMPOSITE_ROLE` DISABLE KEYS */;
INSERT INTO `COMPOSITE_ROLE` VALUES ('1131383e-de0d-491f-8940-f2d2ff21f361','f58d490b-4960-4ca7-bd77-55a7cf944b99'),('18ad43de-71c2-4a8b-ad73-f07085acdf31','31dd067f-5aa5-4ac2-896c-8a42efb5062e'),('242285dd-bda3-4f01-a8c5-8edf054b9c00','22443081-8011-43ff-b0db-7c73d25c8539'),('3992601b-152d-4c5e-bcff-7007b41923e3','54f3ba9c-339a-47f1-9c90-7adb0dc81720'),('3f903215-6c7d-4c4b-85b3-0059ee3d67f1','15b61531-58a3-4c8f-9bbb-30f08526ceff'),('4a38d073-c8b2-4d2f-a41b-309828b871c8','5bd24075-4f1a-4f31-9646-d152685192a8'),('561aa322-24db-4b3e-837e-95566a8010a1','22d81b87-2705-4b8a-9f17-d8c73bbb8ada'),('561aa322-24db-4b3e-837e-95566a8010a1','56fceb4c-8177-42bb-ae99-b408c919532e'),('58638617-b996-4958-8fd7-39f13662cfa9','99668381-46f5-4934-864f-922c66efa7dd'),('58638617-b996-4958-8fd7-39f13662cfa9','f1d49e6b-b815-4574-908e-0bc24d1c180a'),('677d4ca9-0212-4f5e-b061-b284152a1870','4d3a4901-714f-4f20-a9ff-690cc5319eeb'),('677d4ca9-0212-4f5e-b061-b284152a1870','b158838e-c17a-4a04-a920-b0cb24db4c09'),('6e394702-4f6a-4b94-9470-519fd14eead7','14f729d2-c548-4e43-bb0c-d974bc6af896'),('6e394702-4f6a-4b94-9470-519fd14eead7','c181012a-31a5-4a76-acf7-75d7a6e0bb59'),('74061294-979c-41ca-89f0-f188f91b6c0a','e0087938-a86d-4136-ab2e-2c6148e15279'),('7a77eaa4-ec6d-4364-9d61-113997360274','22d81b87-2705-4b8a-9f17-d8c73bbb8ada'),('7a77eaa4-ec6d-4364-9d61-113997360274','2e12ca9a-83f4-4aed-98a7-7fa6ea1ba299'),('7a77eaa4-ec6d-4364-9d61-113997360274','3992601b-152d-4c5e-bcff-7007b41923e3'),('7a77eaa4-ec6d-4364-9d61-113997360274','3cccce94-b48e-4c33-8958-4f7657fc314b'),('7a77eaa4-ec6d-4364-9d61-113997360274','48dfb461-04ca-48a5-95e3-1371514e7f0a'),('7a77eaa4-ec6d-4364-9d61-113997360274','5460ad86-a19a-467f-ba48-9c1ad3377b1c'),('7a77eaa4-ec6d-4364-9d61-113997360274','54f3ba9c-339a-47f1-9c90-7adb0dc81720'),('7a77eaa4-ec6d-4364-9d61-113997360274','561aa322-24db-4b3e-837e-95566a8010a1'),('7a77eaa4-ec6d-4364-9d61-113997360274','56fceb4c-8177-42bb-ae99-b408c919532e'),('7a77eaa4-ec6d-4364-9d61-113997360274','5ddd5c4c-e4d8-45d0-a399-d240e8a434c3'),('7a77eaa4-ec6d-4364-9d61-113997360274','5eeae865-ed74-4f5b-8901-8ef7f397fb18'),('7a77eaa4-ec6d-4364-9d61-113997360274','684b9754-6a4e-496d-887b-6c5a9e9b38b8'),('7a77eaa4-ec6d-4364-9d61-113997360274','864c5a94-0990-484f-be31-2a78ed815e00'),('7a77eaa4-ec6d-4364-9d61-113997360274','9bb9ff1d-b7b5-465b-a062-ce5008ff6cf3'),('7a77eaa4-ec6d-4364-9d61-113997360274','a101ab45-c2cd-49c1-9f29-858b1cbfcd1c'),('7a77eaa4-ec6d-4364-9d61-113997360274','a1536262-08cb-4b79-b0db-c676eb890b2e'),('7a77eaa4-ec6d-4364-9d61-113997360274','c43fba40-8523-428c-b2ce-793efe0fa6de'),('7a77eaa4-ec6d-4364-9d61-113997360274','fb46403d-6bd8-43ef-8a34-d4b177c7134d'),('909d09c1-22eb-4144-b5ec-30b8de651dd2','fb4125e3-a3e4-4078-a7d4-1e45370023c1'),('9477a00f-8934-4e15-b988-08202d1975d7','1e93736d-f776-45b2-a96b-d25eea66709b'),('9477a00f-8934-4e15-b988-08202d1975d7','402f483e-b25a-4ef6-a7b5-edd149476a66'),('9ac3098d-e17e-4f43-acd8-efcefdbe37c8','79379a0d-8564-4c5a-9281-80e6e8f9c259'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','0298bc76-a999-46cc-82b0-ad5786222d76'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','062883cd-4a6b-46f2-b8f3-2bb0a09e245b'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','1131383e-de0d-491f-8940-f2d2ff21f361'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','15b61531-58a3-4c8f-9bbb-30f08526ceff'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','1921fe4f-bc6d-4c31-8983-63ea0d3d28a3'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','1d6d918f-c1c3-48cb-81b4-e0a65fb1b92c'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','1dd8f455-fe1e-4019-b31e-66421091ddd8'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','1f793b3d-406f-43d5-b323-edecd35d7ace'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','2385fd60-9f39-4485-aa49-d06c6519316f'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','285c93ec-8189-4bc2-8d45-80868c84068a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','297cc743-3395-4613-82b9-0c9316f72255'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','2caea195-e039-4c43-8197-3afd1fa5b5da'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','2d685fb4-91d7-4004-a3bd-f687ca8a9414'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','34e066a1-a850-4ed5-9e14-f2438a9b2135'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','3f903215-6c7d-4c4b-85b3-0059ee3d67f1'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','415103ec-a3f4-401f-950a-72d6b14b6f78'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','49ece663-7023-411c-a095-abddc2b344a9'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','4ac09737-0054-4017-9be3-bef99d4f80ab'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','4c61424e-c93e-48cf-98e4-e57ba8afc85e'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','4d3a4901-714f-4f20-a9ff-690cc5319eeb'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','53607b42-ccf5-42e2-b0e7-79e183e32cfe'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','566d5ed8-f34e-4d54-af16-b22bfd2d999d'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','58638617-b996-4958-8fd7-39f13662cfa9'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','5ab04104-9ddd-43b4-bd42-4642f7bdf36e'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','5b6c12f0-0e9b-471a-babf-c11e0609fe71'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','5fea908a-8b72-45f3-a5f8-457a2ec35db0'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','677d4ca9-0212-4f5e-b061-b284152a1870'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','69106efc-b3f8-4f20-a69a-8d47b0e15ab1'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','6de77d1f-fa45-428f-84d5-6d317841c5e8'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','724a47ee-a397-4a64-aa58-eb4682607e7e'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','74061294-979c-41ca-89f0-f188f91b6c0a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','7648244f-8f6a-43d8-94b0-5d3c1694547c'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','76ac899d-029d-4ab3-b123-b33d43881931'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','76d0231e-ccd3-43f1-a147-b7b7a24aab88'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','7ab2df1b-095d-4df9-ae9a-82c9c489e8f0'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','82bdc776-a4d7-4cc0-924b-2f819c00f674'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','88cb6e2b-59b7-4623-ac7a-9a4da7f6fdde'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','8bd25600-aeab-447d-825e-ead3d7217518'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','8e6a0fb9-c145-42df-9fa2-a3b1893119b2'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','90c096ed-e262-4d33-b108-2e94efc15e5b'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','9239b389-0550-4654-bb93-4b8c97ed6da5'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','95875ed1-42bc-42ae-9c0e-4145e9ce5f63'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','96c94865-f042-4716-89c8-d28d62da716b'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','99668381-46f5-4934-864f-922c66efa7dd'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','998b3784-2126-4f2c-ae88-006aec714bb7'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','a2c3724c-6af6-4971-bc63-eef9fa25187d'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','a66c14fa-631a-4e0b-9d82-e8b7f15e189f'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','ada4a48a-3bba-4f0e-93fb-0577d5143d0a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','af47ac5e-673f-4a8e-a96f-36a84a72d4ea'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','b12b28cb-ae8c-47be-a339-584caba2f264'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','b158838e-c17a-4a04-a920-b0cb24db4c09'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','bbb1dad1-62c2-4922-b864-2a1effe10347'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','bf241da0-eba6-4f64-90b5-fe63072844db'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','c0a6b980-eb58-4f78-bace-709d78ebf49a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','c31eb90e-f12d-4516-b7df-870e1d8e351d'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','c7347789-2ff6-42f6-b66e-f174895d2838'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','ce58491c-8ecd-45eb-9386-46489869e50b'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','d19370df-9c4e-41f4-bf84-a59d49602adb'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','d42d4b1d-fd21-4278-9923-4588f6a6df23'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','d740044a-1084-4c9d-b6e1-351ac19b02a5'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','d9200ac4-0370-48ab-9339-1fa3b80cc030'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','dcd52f0b-387f-48db-82d1-b706d50e756a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','dd3f5e76-3ede-469e-b1fb-ee1ada3b0006'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','e0087938-a86d-4136-ab2e-2c6148e15279'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','e277a2d9-196e-441e-b560-f5ae4a6cdb6b'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','eeebc61d-8128-4e4c-8a8f-e27796a714d4'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','ef88978c-6262-4102-a8b9-4e2cc8a4344a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','f1d49e6b-b815-4574-908e-0bc24d1c180a'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','f58d490b-4960-4ca7-bd77-55a7cf944b99'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','f63f40a3-dd78-4321-afec-85ecb708fc2d'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','fb6e7bfd-6ce2-477c-b266-25c4d868a488'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','fe93dcf8-c4df-4d75-b7ff-dd6f9d572d87'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','ff1e6b33-140c-4b0b-bb87-06e08f2f1fcb'),('ada4a48a-3bba-4f0e-93fb-0577d5143d0a','2caea195-e039-4c43-8197-3afd1fa5b5da'),('ada4a48a-3bba-4f0e-93fb-0577d5143d0a','6de77d1f-fa45-428f-84d5-6d317841c5e8'),('aeac672f-dc8f-450e-b2e3-ab866af60ae0','68058e8a-9155-4286-8c47-2009a9e63b39'),('b30da0e7-4091-4583-8472-419ccb8f9de0','1cb16ce1-3a7f-43b9-bacf-10c1ad9a49bc'),('bf241da0-eba6-4f64-90b5-fe63072844db','5b6c12f0-0e9b-471a-babf-c11e0609fe71'),('c2db71d6-b098-4688-a383-12e79f5bcc7d','8841ef88-bcd0-402e-bd15-499fb05b954d'),('dc2548b0-a639-46fa-b100-d9e79403159a','b8d4e191-773f-4142-a859-8314a7fb5926'),('e59b9570-112d-4b45-9a21-975f40df2f2c','1d158036-ed3b-436f-ad15-c5925cdfbbc2'),('e6320424-9682-466c-bc33-131ffeb0c062','054bebcf-01e1-4372-bde4-ff06daa0d164'),('e6320424-9682-466c-bc33-131ffeb0c062','120ca44d-f527-4bb3-9583-d8161284cbde'),('e6320424-9682-466c-bc33-131ffeb0c062','14ac522d-5f9f-495c-8481-87e42bb08980'),('e6320424-9682-466c-bc33-131ffeb0c062','14f729d2-c548-4e43-bb0c-d974bc6af896'),('e6320424-9682-466c-bc33-131ffeb0c062','308a36be-0b75-42e8-8917-b711d045134d'),('e6320424-9682-466c-bc33-131ffeb0c062','44be220f-b334-4263-9cf7-f8f561e78cd8'),('e6320424-9682-466c-bc33-131ffeb0c062','49e18c09-e656-430c-b553-e6ecc1021764'),('e6320424-9682-466c-bc33-131ffeb0c062','4b6e58bc-31ce-4f87-ba54-d537ca2592cd'),('e6320424-9682-466c-bc33-131ffeb0c062','52e3937a-614a-4d35-94df-cbb332b995ec'),('e6320424-9682-466c-bc33-131ffeb0c062','6e394702-4f6a-4b94-9470-519fd14eead7'),('e6320424-9682-466c-bc33-131ffeb0c062','a43df422-48c0-4a17-bf2a-d628deb44d5f'),('e6320424-9682-466c-bc33-131ffeb0c062','afaee320-f76a-48ad-a700-b106d05813d9'),('e6320424-9682-466c-bc33-131ffeb0c062','b6f16505-bdbe-4ee0-af77-06ddb84cb62c'),('e6320424-9682-466c-bc33-131ffeb0c062','b82479b2-0770-4d20-b015-ffeb651b6fe1'),('e6320424-9682-466c-bc33-131ffeb0c062','b8d4e191-773f-4142-a859-8314a7fb5926'),('e6320424-9682-466c-bc33-131ffeb0c062','c181012a-31a5-4a76-acf7-75d7a6e0bb59'),('e6320424-9682-466c-bc33-131ffeb0c062','dc2548b0-a639-46fa-b100-d9e79403159a'),('e6320424-9682-466c-bc33-131ffeb0c062','de71c678-fba9-42bc-a16c-a0a339d0c820'),('efba8528-db6b-44f6-a982-8b9e095d3927','10726d7c-b18f-4cee-86ed-85b47f0cf37e'),('efba8528-db6b-44f6-a982-8b9e095d3927','1e93736d-f776-45b2-a96b-d25eea66709b'),('efba8528-db6b-44f6-a982-8b9e095d3927','22443081-8011-43ff-b0db-7c73d25c8539'),('efba8528-db6b-44f6-a982-8b9e095d3927','23eaffa9-c12b-4f4c-93b2-6c4ac04ada97'),('efba8528-db6b-44f6-a982-8b9e095d3927','242285dd-bda3-4f01-a8c5-8edf054b9c00'),('efba8528-db6b-44f6-a982-8b9e095d3927','2aec1f96-5ff5-4c69-8762-e27ccf92b0aa'),('efba8528-db6b-44f6-a982-8b9e095d3927','35326eab-a0bd-41ec-a152-be9086d25489'),('efba8528-db6b-44f6-a982-8b9e095d3927','402f483e-b25a-4ef6-a7b5-edd149476a66'),('efba8528-db6b-44f6-a982-8b9e095d3927','70c3353e-289e-4686-b254-6a8475f53402'),('efba8528-db6b-44f6-a982-8b9e095d3927','7fcb25fc-35c6-4ad3-8519-d4bc40635022'),('efba8528-db6b-44f6-a982-8b9e095d3927','9477a00f-8934-4e15-b988-08202d1975d7'),('efba8528-db6b-44f6-a982-8b9e095d3927','9df676e9-1d82-416a-b64e-342b628b22fd'),('efba8528-db6b-44f6-a982-8b9e095d3927','a00df050-5498-4548-89e5-a8e0d746b586'),('efba8528-db6b-44f6-a982-8b9e095d3927','a0ed7511-4e73-496b-8381-4830ea6c8a86'),('efba8528-db6b-44f6-a982-8b9e095d3927','c632a80d-e13b-4858-96a1-98211e7835a7'),('efba8528-db6b-44f6-a982-8b9e095d3927','d8978dbe-2f95-407f-bc7c-c5425b8bfaaa'),('efba8528-db6b-44f6-a982-8b9e095d3927','e6bc4d2e-62c3-4ca8-b5fe-3dd02e0b6e55'),('efba8528-db6b-44f6-a982-8b9e095d3927','ebdb7e9c-5c47-4c4e-8a34-4c1f48cbf3dd'),('f63f40a3-dd78-4321-afec-85ecb708fc2d','ce58491c-8ecd-45eb-9386-46489869e50b'),('f63f40a3-dd78-4321-afec-85ecb708fc2d','ef88978c-6262-4102-a8b9-4e2cc8a4344a');
/*!40000 ALTER TABLE `COMPOSITE_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CREDENTIAL`
--

DROP TABLE IF EXISTS `CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_CREDENTIAL` (`USER_ID`),
  CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CREDENTIAL`
--

LOCK TABLES `CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `CREDENTIAL` DISABLE KEYS */;
INSERT INTO `CREDENTIAL` VALUES ('25c12e7c-3052-4b64-b8cf-ffe7927f56c4',NULL,'password','b2ca12b7-d7bf-4373-ad11-157a0c85450b',1666231750951,NULL,'{\"value\":\"M6nRDIpUbGbCWoogkbNtFnpL1HTucXjr+UbUVprwif+VkCQRL8hQDOhezURJUR9ZlPMwd8woq6jEfA/Fu+fqPw==\",\"salt\":\"vB0sn/NO25pbcJJwEobZoA==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('3f6d6cb7-7215-4d3d-a287-a4627b4b230c',NULL,'password','125522c5-aa37-48a1-a6fe-f6828ab9f69b',1666235339203,NULL,'{\"value\":\"sDv/nqnqzOW0t5OpyB9l4Ycum9K8LlnL/kxKzLv15+JYphny08R7idLhwZdfcdG0tDGIcKPgw+I6N3dTVsqt5w==\",\"salt\":\"1i30Ua7Y6zoyamyzL1tr7Q==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('83f583e2-6122-40f8-af12-22e58d4d0a82',NULL,'password','03e1f80f-e8cb-48d2-a032-2794c89ae9ab',1666604824804,NULL,'{\"value\":\"glhbhneDvn0WPuNPGDrcmLx2m4BIrrnJHP0Up1a1SO7p+qFkUQ6m3cETIn+pr2OMwaou/hsH+W62tYqelxYWyQ==\",\"salt\":\"va6z+XsWgMtwtXKvEGX3NQ==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('aa6c0755-e8b0-42bd-bea1-2410dbf1603b',NULL,'password','9e1377bd-481e-4166-bb45-ed4fcba336dd',1666232589182,NULL,'{\"value\":\"dAz5WrKWWU7rOqv3JHud+6SH+GUZSVSo+L1e0PEV9iO5KyjBW6lrc154hPsh/NQ+ZCOzy6HpplO/WkJ8nOJ9Zw==\",\"salt\":\"d7rhbKfcmkFln0ChuHTV7Q==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('b3be8e57-2882-4242-b7de-f60b75697e97',NULL,'password','1ce9a26f-7eb7-4974-94c1-786da65692e0',1666604351197,NULL,'{\"value\":\"OB+forYrlj61FaIMEtDKo+WZmfh/9jhNNafnDITTr5KPuPsPw1FKTg+PAtbAqBEhM5RgR2LEgLSjXhqOpxW1bA==\",\"salt\":\"qKs1ybQoOh6fHUA7TiQr/g==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('b9a39ca1-0ab2-497b-8d9b-76ef6f8f5221',NULL,'password','ab020eff-64dd-4b2c-960a-5b8cf75ef25f',1666176997594,NULL,'{\"value\":\"M6aszfUisCZ0CRbk6IuSNTgkkFKHjltbXmqgMBKcik7zJWag8RJ+09nmbeo5rQGUMbeCh3OqlbM+AtuYQof4Lg==\",\"salt\":\"FbM46qcxVy6SCehnbzArZw==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('bdd25a8b-188b-40a0-9d13-da52d8abb7c2',NULL,'password','34a8a769-9ee3-4624-892b-467934fdd429',1666228928614,NULL,'{\"value\":\"HmDQXOWovlvBJR4/twVJ/KOgbSNjA1eNgIZ+Ozdx7kSISjH/1LIvTfmhG5eK0oo9rCa/pm2MWkBYvgG17MOM0Q==\",\"salt\":\"lbJUxmiIxoern4mfhfCDuA==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('d6d767d5-05d5-4b80-8de7-77736537a9f9',NULL,'password','a0f53e62-3cbb-4aa6-8248-7ad131b80de4',1666232794172,NULL,'{\"value\":\"nhAc8Y6V1vmd30/iGC0VFMNF/xHy4Qmqk7FuiDw0vj9Wi1TvYxQJpcYKqjXG9mnMa+tDSh/zaOUZyo+Y6pIs1Q==\",\"salt\":\"ZhnhE82X8DUD65vc6CR/ew==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('e83d32e9-0b17-4cfe-8075-c3bcf91a70de',NULL,'password','9788e968-d7e1-472f-b724-830ab7960b89',1666173247322,NULL,'{\"value\":\"0jOuAg5q3ilEQ19CPZWnhZZzr4X3WZip/D0JiK3G5eNr2584rONTAle4MLLndggXfuIbkjO8dhkSgvfg/FjpJA==\",\"salt\":\"IgSA20d5yRKDuhmJIlZzOA==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10),('f7af3f32-5f1e-4d03-be29-8f2b1a19143f',NULL,'password','a13d0718-447f-4389-8de6-73d040e5b27e',1666228889844,NULL,'{\"value\":\"8kbfgurWk3Agd3yMm6NA19Z8ShYH1kav5v+9OhFx2ctsQr29v8/cRXb1Os2MLxfNfx6Vnipt/m5SZrxdqOkg3w==\",\"salt\":\"S6Tcgcr7btT83diyum0W+w==\"}','{\"hashIterations\":27500,\"algorithm\":\"pbkdf2-sha256\"}',10);
/*!40000 ALTER TABLE `CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOG`
--

DROP TABLE IF EXISTS `DATABASECHANGELOG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTHOR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FILENAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int NOT NULL,
  `EXECTYPE` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `MD5SUM` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `COMMENTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TAG` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LIQUIBASE` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CONTEXTS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LABELS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOG`
--

LOCK TABLES `DATABASECHANGELOG` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOG` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOG` VALUES ('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/jpa-changelog-1.0.0.Final.xml','2022-10-19 09:53:51',1,'EXECUTED','7:4e70412f24a3f382c82183742ec79317','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.0.0.Final-KEYCLOAK-5461','sthorger@redhat.com','META-INF/db2-jpa-changelog-1.0.0.Final.xml','2022-10-19 09:53:51',2,'MARK_RAN','7:cb16724583e9675711801c6875114f28','createTable tableName=APPLICATION_DEFAULT_ROLES; createTable tableName=CLIENT; createTable tableName=CLIENT_SESSION; createTable tableName=CLIENT_SESSION_ROLE; createTable tableName=COMPOSITE_ROLE; createTable tableName=CREDENTIAL; createTable tab...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.1.0.Beta1','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Beta1.xml','2022-10-19 09:53:51',3,'EXECUTED','7:0310eb8ba07cec616460794d42ade0fa','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=CLIENT_ATTRIBUTES; createTable tableName=CLIENT_SESSION_NOTE; createTable tableName=APP_NODE_REGISTRATIONS; addColumn table...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.1.0.Final','sthorger@redhat.com','META-INF/jpa-changelog-1.1.0.Final.xml','2022-10-19 09:53:51',4,'EXECUTED','7:5d25857e708c3233ef4439df1f93f012','renameColumn newColumnName=EVENT_TIME, oldColumnName=TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.2.0.Beta1','psilva@redhat.com','META-INF/jpa-changelog-1.2.0.Beta1.xml','2022-10-19 09:53:52',5,'EXECUTED','7:c7a54a1041d58eb3817a4a883b4d4e84','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.2.0.Beta1','psilva@redhat.com','META-INF/db2-jpa-changelog-1.2.0.Beta1.xml','2022-10-19 09:53:52',6,'MARK_RAN','7:2e01012df20974c1c2a605ef8afe25b7','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION; createTable tableName=PROTOCOL_MAPPER; createTable tableName=PROTOCOL_MAPPER_CONFIG; createTable tableName=...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.2.0.RC1','bburke@redhat.com','META-INF/jpa-changelog-1.2.0.CR1.xml','2022-10-19 09:53:53',7,'EXECUTED','7:0f08df48468428e0f30ee59a8ec01a41','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.2.0.RC1','bburke@redhat.com','META-INF/db2-jpa-changelog-1.2.0.CR1.xml','2022-10-19 09:53:53',8,'MARK_RAN','7:a77ea2ad226b345e7d689d366f185c8c','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=MIGRATION_MODEL; createTable tableName=IDENTITY_P...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.2.0.Final','keycloak','META-INF/jpa-changelog-1.2.0.Final.xml','2022-10-19 09:53:53',9,'EXECUTED','7:a3377a2059aefbf3b90ebb4c4cc8e2ab','update tableName=CLIENT; update tableName=CLIENT; update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.3.0','bburke@redhat.com','META-INF/jpa-changelog-1.3.0.xml','2022-10-19 09:53:54',10,'EXECUTED','7:04c1dbedc2aa3e9756d1a1668e003451','delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete tableName=USER_SESSION; createTable tableName=ADMI...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.4.0','bburke@redhat.com','META-INF/jpa-changelog-1.4.0.xml','2022-10-19 09:53:55',11,'EXECUTED','7:36ef39ed560ad07062d956db861042ba','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.4.0','bburke@redhat.com','META-INF/db2-jpa-changelog-1.4.0.xml','2022-10-19 09:53:55',12,'MARK_RAN','7:d909180b2530479a716d3f9c9eaea3d7','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.5.0','bburke@redhat.com','META-INF/jpa-changelog-1.5.0.xml','2022-10-19 09:53:55',13,'EXECUTED','7:cf12b04b79bea5152f165eb41f3955f6','delete tableName=CLIENT_SESSION_AUTH_STATUS; delete tableName=CLIENT_SESSION_ROLE; delete tableName=CLIENT_SESSION_PROT_MAPPER; delete tableName=CLIENT_SESSION_NOTE; delete tableName=CLIENT_SESSION; delete tableName=USER_SESSION_NOTE; delete table...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.6.1_from15','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-10-19 09:53:55',14,'EXECUTED','7:7e32c8f05c755e8675764e7d5f514509','addColumn tableName=REALM; addColumn tableName=KEYCLOAK_ROLE; addColumn tableName=CLIENT; createTable tableName=OFFLINE_USER_SESSION; createTable tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_US_SES_PK2, tableName=...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.6.1_from16-pre','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-10-19 09:53:55',15,'MARK_RAN','7:980ba23cc0ec39cab731ce903dd01291','delete tableName=OFFLINE_CLIENT_SESSION; delete tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.6.1_from16','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-10-19 09:53:55',16,'MARK_RAN','7:2fa220758991285312eb84f3b4ff5336','dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_US_SES_PK, tableName=OFFLINE_USER_SESSION; dropPrimaryKey constraintName=CONSTRAINT_OFFLINE_CL_SES_PK, tableName=OFFLINE_CLIENT_SESSION; addColumn tableName=OFFLINE_USER_SESSION; update tableName=OF...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.6.1','mposolda@redhat.com','META-INF/jpa-changelog-1.6.1.xml','2022-10-19 09:53:55',17,'EXECUTED','7:d41d8cd98f00b204e9800998ecf8427e','empty','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.7.0','bburke@redhat.com','META-INF/jpa-changelog-1.7.0.xml','2022-10-19 09:53:55',18,'EXECUTED','7:91ace540896df890cc00a0490ee52bbc','createTable tableName=KEYCLOAK_GROUP; createTable tableName=GROUP_ROLE_MAPPING; createTable tableName=GROUP_ATTRIBUTE; createTable tableName=USER_GROUP_MEMBERSHIP; createTable tableName=REALM_DEFAULT_GROUPS; addColumn tableName=IDENTITY_PROVIDER; ...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.8.0','mposolda@redhat.com','META-INF/jpa-changelog-1.8.0.xml','2022-10-19 09:53:56',19,'EXECUTED','7:c31d1646dfa2618a9335c00e07f89f24','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.8.0-2','keycloak','META-INF/jpa-changelog-1.8.0.xml','2022-10-19 09:53:56',20,'EXECUTED','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.8.0','mposolda@redhat.com','META-INF/db2-jpa-changelog-1.8.0.xml','2022-10-19 09:53:56',21,'MARK_RAN','7:f987971fe6b37d963bc95fee2b27f8df','addColumn tableName=IDENTITY_PROVIDER; createTable tableName=CLIENT_TEMPLATE; createTable tableName=CLIENT_TEMPLATE_ATTRIBUTES; createTable tableName=TEMPLATE_SCOPE_MAPPING; dropNotNullConstraint columnName=CLIENT_ID, tableName=PROTOCOL_MAPPER; ad...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.8.0-2','keycloak','META-INF/db2-jpa-changelog-1.8.0.xml','2022-10-19 09:53:56',22,'MARK_RAN','7:df8bc21027a4f7cbbb01f6344e89ce07','dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; update tableName=CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.9.0','mposolda@redhat.com','META-INF/jpa-changelog-1.9.0.xml','2022-10-19 09:53:56',23,'EXECUTED','7:ed2dc7f799d19ac452cbcda56c929e47','update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=REALM; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=REALM; update tableName=REALM; customChange; dr...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.9.1','keycloak','META-INF/jpa-changelog-1.9.1.xml','2022-10-19 09:53:56',24,'EXECUTED','7:80b5db88a5dda36ece5f235be8757615','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=PUBLIC_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.9.1','keycloak','META-INF/db2-jpa-changelog-1.9.1.xml','2022-10-19 09:53:56',25,'MARK_RAN','7:1437310ed1305a9b93f8848f301726ce','modifyDataType columnName=PRIVATE_KEY, tableName=REALM; modifyDataType columnName=CERTIFICATE, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('1.9.2','keycloak','META-INF/jpa-changelog-1.9.2.xml','2022-10-19 09:53:56',26,'EXECUTED','7:b82ffb34850fa0836be16deefc6a87c4','createIndex indexName=IDX_USER_EMAIL, tableName=USER_ENTITY; createIndex indexName=IDX_USER_ROLE_MAPPING, tableName=USER_ROLE_MAPPING; createIndex indexName=IDX_USER_GROUP_MAPPING, tableName=USER_GROUP_MEMBERSHIP; createIndex indexName=IDX_USER_CO...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-2.0.0','psilva@redhat.com','META-INF/jpa-changelog-authz-2.0.0.xml','2022-10-19 09:53:57',27,'EXECUTED','7:9cc98082921330d8d9266decdd4bd658','createTable tableName=RESOURCE_SERVER; addPrimaryKey constraintName=CONSTRAINT_FARS, tableName=RESOURCE_SERVER; addUniqueConstraint constraintName=UK_AU8TT6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER; createTable tableName=RESOURCE_SERVER_RESOU...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-2.5.1','psilva@redhat.com','META-INF/jpa-changelog-authz-2.5.1.xml','2022-10-19 09:53:57',28,'EXECUTED','7:03d64aeed9cb52b969bd30a7ac0db57e','update tableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.1.0-KEYCLOAK-5461','bburke@redhat.com','META-INF/jpa-changelog-2.1.0.xml','2022-10-19 09:53:58',29,'EXECUTED','7:f1f9fd8710399d725b780f463c6b21cd','createTable tableName=BROKER_LINK; createTable tableName=FED_USER_ATTRIBUTE; createTable tableName=FED_USER_CONSENT; createTable tableName=FED_USER_CONSENT_ROLE; createTable tableName=FED_USER_CONSENT_PROT_MAPPER; createTable tableName=FED_USER_CR...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.2.0','bburke@redhat.com','META-INF/jpa-changelog-2.2.0.xml','2022-10-19 09:53:58',30,'EXECUTED','7:53188c3eb1107546e6f765835705b6c1','addColumn tableName=ADMIN_EVENT_ENTITY; createTable tableName=CREDENTIAL_ATTRIBUTE; createTable tableName=FED_CREDENTIAL_ATTRIBUTE; modifyDataType columnName=VALUE, tableName=CREDENTIAL; addForeignKeyConstraint baseTableName=FED_CREDENTIAL_ATTRIBU...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.3.0','bburke@redhat.com','META-INF/jpa-changelog-2.3.0.xml','2022-10-19 09:53:58',31,'EXECUTED','7:d6e6f3bc57a0c5586737d1351725d4d4','createTable tableName=FEDERATED_USER; addPrimaryKey constraintName=CONSTR_FEDERATED_USER, tableName=FEDERATED_USER; dropDefaultValue columnName=TOTP, tableName=USER_ENTITY; dropColumn columnName=TOTP, tableName=USER_ENTITY; addColumn tableName=IDE...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.4.0','bburke@redhat.com','META-INF/jpa-changelog-2.4.0.xml','2022-10-19 09:53:58',32,'EXECUTED','7:454d604fbd755d9df3fd9c6329043aa5','customChange','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.5.0','bburke@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-10-19 09:53:58',33,'EXECUTED','7:57e98a3077e29caf562f7dbf80c72600','customChange; modifyDataType columnName=USER_ID, tableName=OFFLINE_USER_SESSION','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.5.0-unicode-oracle','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-10-19 09:53:58',34,'MARK_RAN','7:e4c7e8f2256210aee71ddc42f538b57a','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.5.0-unicode-other-dbs','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-10-19 09:53:59',35,'EXECUTED','7:09a43c97e49bc626460480aa1379b522','modifyDataType columnName=DESCRIPTION, tableName=AUTHENTICATION_FLOW; modifyDataType columnName=DESCRIPTION, tableName=CLIENT_TEMPLATE; modifyDataType columnName=DESCRIPTION, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=DESCRIPTION,...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.5.0-duplicate-email-support','slawomir@dabek.name','META-INF/jpa-changelog-2.5.0.xml','2022-10-19 09:53:59',36,'EXECUTED','7:26bfc7c74fefa9126f2ce702fb775553','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.5.0-unique-group-names','hmlnarik@redhat.com','META-INF/jpa-changelog-2.5.0.xml','2022-10-19 09:53:59',37,'EXECUTED','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6173229202'),('2.5.1','bburke@redhat.com','META-INF/jpa-changelog-2.5.1.xml','2022-10-19 09:53:59',38,'EXECUTED','7:37fc1781855ac5388c494f1442b3f717','addColumn tableName=FED_USER_CONSENT','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.0.0','bburke@redhat.com','META-INF/jpa-changelog-3.0.0.xml','2022-10-19 09:53:59',39,'EXECUTED','7:13a27db0dae6049541136adad7261d27','addColumn tableName=IDENTITY_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.2.0-fix','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-10-19 09:53:59',40,'MARK_RAN','7:550300617e3b59e8af3a6294df8248a3','addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.2.0-fix-with-keycloak-5416','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-10-19 09:53:59',41,'MARK_RAN','7:e3a9482b8931481dc2772a5c07c44f17','dropIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS; addNotNullConstraint columnName=REALM_ID, tableName=CLIENT_INITIAL_ACCESS; createIndex indexName=IDX_CLIENT_INIT_ACC_REALM, tableName=CLIENT_INITIAL_ACCESS','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.2.0-fix-offline-sessions','hmlnarik','META-INF/jpa-changelog-3.2.0.xml','2022-10-19 09:53:59',42,'EXECUTED','7:72b07d85a2677cb257edb02b408f332d','customChange','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.2.0-fixed','keycloak','META-INF/jpa-changelog-3.2.0.xml','2022-10-19 09:54:00',43,'EXECUTED','7:a72a7858967bd414835d19e04d880312','addColumn tableName=REALM; dropPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_PK2, tableName=OFFLINE_CLIENT_SESSION; dropColumn columnName=CLIENT_SESSION_ID, tableName=OFFLINE_CLIENT_SESSION; addPrimaryKey constraintName=CONSTRAINT_OFFL_CL_SES_P...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.3.0','keycloak','META-INF/jpa-changelog-3.3.0.xml','2022-10-19 09:54:00',44,'EXECUTED','7:94edff7cf9ce179e7e85f0cd78a3cf2c','addColumn tableName=USER_ENTITY','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-3.4.0.CR1-resource-server-pk-change-part1','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-10-19 09:54:00',45,'EXECUTED','7:6a48ce645a3525488a90fbf76adf3bb3','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_RESOURCE; addColumn tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-3.4.0.CR1-resource-server-pk-change-part2-KEYCLOAK-6095','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-10-19 09:54:00',46,'EXECUTED','7:e64b5dcea7db06077c6e57d3b9e5ca14','customChange','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-10-19 09:54:00',47,'MARK_RAN','7:fd8cf02498f8b1e72496a20afc75178c','dropIndex indexName=IDX_RES_SERV_POL_RES_SERV, tableName=RESOURCE_SERVER_POLICY; dropIndex indexName=IDX_RES_SRV_RES_RES_SRV, tableName=RESOURCE_SERVER_RESOURCE; dropIndex indexName=IDX_RES_SRV_SCOPE_RES_SRV, tableName=RESOURCE_SERVER_SCOPE','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-3.4.0.CR1-resource-server-pk-change-part3-fixed-nodropindex','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-10-19 09:54:01',48,'EXECUTED','7:542794f25aa2b1fbabb7e577d6646319','addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_POLICY; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, tableName=RESOURCE_SERVER_RESOURCE; addNotNullConstraint columnName=RESOURCE_SERVER_CLIENT_ID, ...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authn-3.4.0.CR1-refresh-token-max-reuse','glavoie@gmail.com','META-INF/jpa-changelog-authz-3.4.0.CR1.xml','2022-10-19 09:54:01',49,'EXECUTED','7:edad604c882df12f74941dac3cc6d650','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.4.0','keycloak','META-INF/jpa-changelog-3.4.0.xml','2022-10-19 09:54:01',50,'EXECUTED','7:0f88b78b7b46480eb92690cbf5e44900','addPrimaryKey constraintName=CONSTRAINT_REALM_DEFAULT_ROLES, tableName=REALM_DEFAULT_ROLES; addPrimaryKey constraintName=CONSTRAINT_COMPOSITE_ROLE, tableName=COMPOSITE_ROLE; addPrimaryKey constraintName=CONSTR_REALM_DEFAULT_GROUPS, tableName=REALM...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.4.0-KEYCLOAK-5230','hmlnarik@redhat.com','META-INF/jpa-changelog-3.4.0.xml','2022-10-19 09:54:01',51,'EXECUTED','7:d560e43982611d936457c327f872dd59','createIndex indexName=IDX_FU_ATTRIBUTE, tableName=FED_USER_ATTRIBUTE; createIndex indexName=IDX_FU_CONSENT, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CONSENT_RU, tableName=FED_USER_CONSENT; createIndex indexName=IDX_FU_CREDENTIAL, t...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.4.1','psilva@redhat.com','META-INF/jpa-changelog-3.4.1.xml','2022-10-19 09:54:01',52,'EXECUTED','7:c155566c42b4d14ef07059ec3b3bbd8e','modifyDataType columnName=VALUE, tableName=CLIENT_ATTRIBUTES','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.4.2','keycloak','META-INF/jpa-changelog-3.4.2.xml','2022-10-19 09:54:01',53,'EXECUTED','7:b40376581f12d70f3c89ba8ddf5b7dea','update tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('3.4.2-KEYCLOAK-5172','mkanis@redhat.com','META-INF/jpa-changelog-3.4.2.xml','2022-10-19 09:54:01',54,'EXECUTED','7:a1132cc395f7b95b3646146c2e38f168','update tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.0.0-KEYCLOAK-6335','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-10-19 09:54:01',55,'EXECUTED','7:d8dc5d89c789105cfa7ca0e82cba60af','createTable tableName=CLIENT_AUTH_FLOW_BINDINGS; addPrimaryKey constraintName=C_CLI_FLOW_BIND, tableName=CLIENT_AUTH_FLOW_BINDINGS','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.0.0-CLEANUP-UNUSED-TABLE','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-10-19 09:54:01',56,'EXECUTED','7:7822e0165097182e8f653c35517656a3','dropTable tableName=CLIENT_IDENTITY_PROV_MAPPING','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.0.0-KEYCLOAK-6228','bburke@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-10-19 09:54:02',57,'EXECUTED','7:c6538c29b9c9a08f9e9ea2de5c2b6375','dropUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHOGM8UEWRT, tableName=USER_CONSENT; dropNotNullConstraint columnName=CLIENT_ID, tableName=USER_CONSENT; addColumn tableName=USER_CONSENT; addUniqueConstraint constraintName=UK_JKUWUVD56ONTGSUHO...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.0.0-KEYCLOAK-5579-fixed','mposolda@redhat.com','META-INF/jpa-changelog-4.0.0.xml','2022-10-19 09:54:03',58,'EXECUTED','7:6d4893e36de22369cf73bcb051ded875','dropForeignKeyConstraint baseTableName=CLIENT_TEMPLATE_ATTRIBUTES, constraintName=FK_CL_TEMPL_ATTR_TEMPL; renameTable newTableName=CLIENT_SCOPE_ATTRIBUTES, oldTableName=CLIENT_TEMPLATE_ATTRIBUTES; renameColumn newColumnName=SCOPE_ID, oldColumnName...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-4.0.0.CR1','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.CR1.xml','2022-10-19 09:54:03',59,'EXECUTED','7:57960fc0b0f0dd0563ea6f8b2e4a1707','createTable tableName=RESOURCE_SERVER_PERM_TICKET; addPrimaryKey constraintName=CONSTRAINT_FAPMT, tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRHO213XCX4WNKOG82SSPMT...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-4.0.0.Beta3','psilva@redhat.com','META-INF/jpa-changelog-authz-4.0.0.Beta3.xml','2022-10-19 09:54:03',60,'EXECUTED','7:2b4b8bff39944c7097977cc18dbceb3b','addColumn tableName=RESOURCE_SERVER_POLICY; addColumn tableName=RESOURCE_SERVER_PERM_TICKET; addForeignKeyConstraint baseTableName=RESOURCE_SERVER_PERM_TICKET, constraintName=FK_FRSRPO2128CX4WNKOG82SSRFY, referencedTableName=RESOURCE_SERVER_POLICY','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-4.2.0.Final','mhajas@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-10-19 09:54:03',61,'EXECUTED','7:2aa42a964c59cd5b8ca9822340ba33a8','createTable tableName=RESOURCE_URIS; addForeignKeyConstraint baseTableName=RESOURCE_URIS, constraintName=FK_RESOURCE_SERVER_URIS, referencedTableName=RESOURCE_SERVER_RESOURCE; customChange; dropColumn columnName=URI, tableName=RESOURCE_SERVER_RESO...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-4.2.0.Final-KEYCLOAK-9944','hmlnarik@redhat.com','META-INF/jpa-changelog-authz-4.2.0.Final.xml','2022-10-19 09:54:03',62,'EXECUTED','7:9ac9e58545479929ba23f4a3087a0346','addPrimaryKey constraintName=CONSTRAINT_RESOUR_URIS_PK, tableName=RESOURCE_URIS','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.2.0-KEYCLOAK-6313','wadahiro@gmail.com','META-INF/jpa-changelog-4.2.0.xml','2022-10-19 09:54:03',63,'EXECUTED','7:14d407c35bc4fe1976867756bcea0c36','addColumn tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.3.0-KEYCLOAK-7984','wadahiro@gmail.com','META-INF/jpa-changelog-4.3.0.xml','2022-10-19 09:54:03',64,'EXECUTED','7:241a8030c748c8548e346adee548fa93','update tableName=REQUIRED_ACTION_PROVIDER','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.6.0-KEYCLOAK-7950','psilva@redhat.com','META-INF/jpa-changelog-4.6.0.xml','2022-10-19 09:54:03',65,'EXECUTED','7:7d3182f65a34fcc61e8d23def037dc3f','update tableName=RESOURCE_SERVER_RESOURCE','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.6.0-KEYCLOAK-8377','keycloak','META-INF/jpa-changelog-4.6.0.xml','2022-10-19 09:54:03',66,'EXECUTED','7:b30039e00a0b9715d430d1b0636728fa','createTable tableName=ROLE_ATTRIBUTE; addPrimaryKey constraintName=CONSTRAINT_ROLE_ATTRIBUTE_PK, tableName=ROLE_ATTRIBUTE; addForeignKeyConstraint baseTableName=ROLE_ATTRIBUTE, constraintName=FK_ROLE_ATTRIBUTE_ID, referencedTableName=KEYCLOAK_ROLE...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.6.0-KEYCLOAK-8555','gideonray@gmail.com','META-INF/jpa-changelog-4.6.0.xml','2022-10-19 09:54:03',67,'EXECUTED','7:3797315ca61d531780f8e6f82f258159','createIndex indexName=IDX_COMPONENT_PROVIDER_TYPE, tableName=COMPONENT','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.7.0-KEYCLOAK-1267','sguilhen@redhat.com','META-INF/jpa-changelog-4.7.0.xml','2022-10-19 09:54:03',68,'EXECUTED','7:c7aa4c8d9573500c2d347c1941ff0301','addColumn tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.7.0-KEYCLOAK-7275','keycloak','META-INF/jpa-changelog-4.7.0.xml','2022-10-19 09:54:04',69,'EXECUTED','7:b207faee394fc074a442ecd42185a5dd','renameColumn newColumnName=CREATED_ON, oldColumnName=LAST_SESSION_REFRESH, tableName=OFFLINE_USER_SESSION; addNotNullConstraint columnName=CREATED_ON, tableName=OFFLINE_USER_SESSION; addColumn tableName=OFFLINE_USER_SESSION; customChange; createIn...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('4.8.0-KEYCLOAK-8835','sguilhen@redhat.com','META-INF/jpa-changelog-4.8.0.xml','2022-10-19 09:54:04',70,'EXECUTED','7:ab9a9762faaba4ddfa35514b212c4922','addNotNullConstraint columnName=SSO_MAX_LIFESPAN_REMEMBER_ME, tableName=REALM; addNotNullConstraint columnName=SSO_IDLE_TIMEOUT_REMEMBER_ME, tableName=REALM','',NULL,'3.5.4',NULL,NULL,'6173229202'),('authz-7.0.0-KEYCLOAK-10443','psilva@redhat.com','META-INF/jpa-changelog-authz-7.0.0.xml','2022-10-19 09:54:04',71,'EXECUTED','7:b9710f74515a6ccb51b72dc0d19df8c4','addColumn tableName=RESOURCE_SERVER','',NULL,'3.5.4',NULL,NULL,'6173229202'),('8.0.0-adding-credential-columns','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-10-19 09:54:04',72,'EXECUTED','7:ec9707ae4d4f0b7452fee20128083879','addColumn tableName=CREDENTIAL; addColumn tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6173229202'),('8.0.0-updating-credential-data-not-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-10-19 09:54:04',73,'EXECUTED','7:03b3f4b264c3c68ba082250a80b74216','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6173229202'),('8.0.0-updating-credential-data-oracle','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-10-19 09:54:04',74,'MARK_RAN','7:64c5728f5ca1f5aa4392217701c4fe23','update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL; update tableName=FED_USER_CREDENTIAL','',NULL,'3.5.4',NULL,NULL,'6173229202'),('8.0.0-credential-cleanup-fixed','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-10-19 09:54:04',75,'EXECUTED','7:b48da8c11a3d83ddd6b7d0c8c2219345','dropDefaultValue columnName=COUNTER, tableName=CREDENTIAL; dropDefaultValue columnName=DIGITS, tableName=CREDENTIAL; dropDefaultValue columnName=PERIOD, tableName=CREDENTIAL; dropDefaultValue columnName=ALGORITHM, tableName=CREDENTIAL; dropColumn ...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('8.0.0-resource-tag-support','keycloak','META-INF/jpa-changelog-8.0.0.xml','2022-10-19 09:54:04',76,'EXECUTED','7:a73379915c23bfad3e8f5c6d5c0aa4bd','addColumn tableName=MIGRATION_MODEL; createIndex indexName=IDX_UPDATE_TIME, tableName=MIGRATION_MODEL','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.0-always-display-client','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-10-19 09:54:04',77,'EXECUTED','7:39e0073779aba192646291aa2332493d','addColumn tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.0-drop-constraints-for-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-10-19 09:54:04',78,'MARK_RAN','7:81f87368f00450799b4bf42ea0b3ec34','dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5PMT, tableName=RESOURCE_SERVER_PERM_TICKET; dropUniqueConstraint constraintName=UK_FRSR6T700S9V50BU18WS5HA6, tableName=RESOURCE_SERVER_RESOURCE; dropPrimaryKey constraintName=CONSTRAINT_O...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.0-increase-column-size-federated-fk','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-10-19 09:54:04',79,'EXECUTED','7:20b37422abb9fb6571c618148f013a15','modifyDataType columnName=CLIENT_ID, tableName=FED_USER_CONSENT; modifyDataType columnName=CLIENT_REALM_CONSTRAINT, tableName=KEYCLOAK_ROLE; modifyDataType columnName=OWNER, tableName=RESOURCE_SERVER_POLICY; modifyDataType columnName=CLIENT_ID, ta...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.0-recreate-constraints-after-column-increase','keycloak','META-INF/jpa-changelog-9.0.0.xml','2022-10-19 09:54:04',80,'MARK_RAN','7:1970bb6cfb5ee800736b95ad3fb3c78a','addNotNullConstraint columnName=CLIENT_ID, tableName=OFFLINE_CLIENT_SESSION; addNotNullConstraint columnName=OWNER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNullConstraint columnName=REQUESTER, tableName=RESOURCE_SERVER_PERM_TICKET; addNotNull...','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.1-add-index-to-client.client_id','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-10-19 09:54:04',81,'EXECUTED','7:45d9b25fc3b455d522d8dcc10a0f4c80','createIndex indexName=IDX_CLIENT_ID, tableName=CLIENT','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.1-KEYCLOAK-12579-drop-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-10-19 09:54:04',82,'MARK_RAN','7:890ae73712bc187a66c2813a724d037f','dropUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.1-KEYCLOAK-12579-add-not-null-constraint','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-10-19 09:54:05',83,'EXECUTED','7:0a211980d27fafe3ff50d19a3a29b538','addNotNullConstraint columnName=PARENT_GROUP, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.1-KEYCLOAK-12579-recreate-constraints','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-10-19 09:54:05',84,'MARK_RAN','7:a161e2ae671a9020fff61e996a207377','addUniqueConstraint constraintName=SIBLING_NAMES, tableName=KEYCLOAK_GROUP','',NULL,'3.5.4',NULL,NULL,'6173229202'),('9.0.1-add-index-to-events','keycloak','META-INF/jpa-changelog-9.0.1.xml','2022-10-19 09:54:05',85,'EXECUTED','7:01c49302201bdf815b0a18d1f98a55dc','createIndex indexName=IDX_EVENT_TIME, tableName=EVENT_ENTITY','',NULL,'3.5.4',NULL,NULL,'6173229202'),('map-remove-ri','keycloak','META-INF/jpa-changelog-11.0.0.xml','2022-10-19 09:54:05',86,'EXECUTED','7:3dace6b144c11f53f1ad2c0361279b86','dropForeignKeyConstraint baseTableName=REALM, constraintName=FK_TRAF444KK6QRKMS7N56AIWQ5Y; dropForeignKeyConstraint baseTableName=KEYCLOAK_ROLE, constraintName=FK_KJHO5LE2C0RAL09FL8CM9WFW9','',NULL,'3.5.4',NULL,NULL,'6173229202');
/*!40000 ALTER TABLE `DATABASECHANGELOG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

DROP TABLE IF EXISTS `DATABASECHANGELOGLOCK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DATABASECHANGELOGLOCK`
--

LOCK TABLES `DATABASECHANGELOGLOCK` WRITE;
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` DISABLE KEYS */;
INSERT INTO `DATABASECHANGELOGLOCK` VALUES (1,_binary '\0',NULL,NULL),(1000,_binary '\0',NULL,NULL),(1001,_binary '\0',NULL,NULL);
/*!40000 ALTER TABLE `DATABASECHANGELOGLOCK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `DEFAULT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEFAULT_CLIENT_SCOPE`
--

LOCK TABLES `DEFAULT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` DISABLE KEYS */;
INSERT INTO `DEFAULT_CLIENT_SCOPE` VALUES ('hi','04f47a6c-8d2b-415f-be78-80d855e614a8',_binary '\0'),('hi','176332ca-d883-4329-a9d4-68884a7c275e',_binary ''),('hi','3617b695-9239-4d20-9271-32aa00a4825a',_binary ''),('hi','5753f684-aa1d-4cc0-88aa-98a2f0cab3af',_binary ''),('hi','76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0',_binary ''),('hi','90332860-b400-4df0-b3a0-5ddee0d59319',_binary '\0'),('hi','91926bc4-0204-43c3-a034-67e94de06f80',_binary ''),('hi','e7c2df73-1988-4b3e-b971-24cd27bb2a0f',_binary '\0'),('hi','ee7ace46-13d6-42c2-9718-1c0cbd9418a8',_binary '\0'),('hi-library','2a8bc487-583c-43dc-8d29-1ad0950d438b',_binary ''),('hi-library','356d3968-262b-4bee-8d44-0d93e880b01a',_binary ''),('hi-library','4072c001-f7e7-4fa4-9f9f-0f099a308dfe',_binary '\0'),('hi-library','41cca0ba-533b-45a7-99c1-8b4ecf149f06',_binary ''),('hi-library','4d7db1a2-1bb6-4104-801b-ea18bd31d25e',_binary '\0'),('hi-library','77249e04-e2d2-4031-9667-8786a866947c',_binary ''),('hi-library','c32f9638-55d0-4d5a-a3fb-feb682bc420c',_binary '\0'),('hi-library','c860f1d3-2172-40b1-9ce2-84911e6a17a9',_binary ''),('hi-library','fb50c6e7-5a41-49e1-a6d1-933d23ad0663',_binary '\0'),('hi-therapist','0d783cca-c3a4-4d95-ab32-82551105367e',_binary ''),('hi-therapist','433a8036-5c4d-4675-a59e-2ac046db7713',_binary ''),('hi-therapist','467375c3-0f8a-490f-b105-0bb44c15a518',_binary '\0'),('hi-therapist','63210a8a-0008-4908-a26e-c374667cf2ea',_binary ''),('hi-therapist','7f8eb3f6-36a3-4334-926c-7e7a067a96ad',_binary '\0'),('hi-therapist','8c3bdc03-95db-4a61-833f-d816bc6d702c',_binary '\0'),('hi-therapist','f070e008-1bf3-4354-9566-af729276ee3e',_binary ''),('hi-therapist','f8b8a1e5-c804-4695-b5b1-35c66ddbabee',_binary '\0'),('hi-therapist','fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71',_binary ''),('master','0a0dc4b2-5723-473a-97ee-ebb0050602c7',_binary ''),('master','30fc52ff-ab28-4569-92e2-26fe8f73626c',_binary ''),('master','5610c6b0-c1a2-4482-a1b8-d337404da618',_binary '\0'),('master','5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1',_binary '\0'),('master','815f7fe2-91f6-474c-ba61-a72d19605316',_binary ''),('master','95552cf7-ce2a-4b2d-a8cc-6595013f1e87',_binary '\0'),('master','b010f421-6272-47b6-9e2a-2e4368ef8869',_binary '\0'),('master','b8ee5766-81f3-4388-a09d-ccbd286cc542',_binary ''),('master','c81a0d08-591a-4602-9ef1-9acbd7902e86',_binary '');
/*!40000 ALTER TABLE `DEFAULT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EVENT_ENTITY`
--

DROP TABLE IF EXISTS `EVENT_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DETAILS_JSON` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `ERROR` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SESSION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EVENT_TIME` bigint DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_EVENT_TIME` (`REALM_ID`,`EVENT_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EVENT_ENTITY`
--

LOCK TABLES `EVENT_ENTITY` WRITE;
/*!40000 ALTER TABLE `EVENT_ENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `EVENT_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_IDENTITY`
--

DROP TABLE IF EXISTS `FEDERATED_IDENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `TOKEN` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`),
  CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_IDENTITY`
--

LOCK TABLES `FEDERATED_IDENTITY` WRITE;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_IDENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FEDERATED_USER`
--

DROP TABLE IF EXISTS `FEDERATED_USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FEDERATED_USER`
--

LOCK TABLES `FEDERATED_USER` WRITE;
/*!40000 ALTER TABLE `FEDERATED_USER` DISABLE KEYS */;
/*!40000 ALTER TABLE `FEDERATED_USER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `FED_USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ATTRIBUTE`
--

LOCK TABLES `FED_USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT`
--

LOCK TABLES `FED_USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

DROP TABLE IF EXISTS `FED_USER_CONSENT_CL_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CONSENT_CL_SCOPE`
--

LOCK TABLES `FED_USER_CONSENT_CL_SCOPE` WRITE;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CONSENT_CL_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

DROP TABLE IF EXISTS `FED_USER_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SALT` tinyblob,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SECRET_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CREDENTIAL_DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_CREDENTIAL`
--

LOCK TABLES `FED_USER_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `FED_USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `FED_USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `FED_USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_REQUIRED_ACTION`
--

LOCK TABLES `FED_USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `FED_USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FED_USER_ROLE_MAPPING`
--

LOCK TABLES `FED_USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` DISABLE KEYS */;
/*!40000 ALTER TABLE `FED_USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

DROP TABLE IF EXISTS `GROUP_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ATTRIBUTE`
--

LOCK TABLES `GROUP_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `GROUP_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `GROUP_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`),
  CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GROUP_ROLE_MAPPING`
--

LOCK TABLES `GROUP_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `GROUP_ROLE_MAPPING` VALUES ('378a0b15-a242-4eb8-bea6-4e03b2c40ded','43644117-0a68-4f54-9d9d-a79bc788da6d'),('3ba06e2e-8369-4329-99c5-f48c8c7a2c39','43644117-0a68-4f54-9d9d-a79bc788da6d'),('781d96e7-76e4-405e-a5d3-dde6a26bdb12','43644117-0a68-4f54-9d9d-a79bc788da6d'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','43644117-0a68-4f54-9d9d-a79bc788da6d'),('a0e43a7c-29f7-4e91-804d-08d094de488b','43644117-0a68-4f54-9d9d-a79bc788da6d'),('bcbc6ae1-2e22-494d-b760-0e8583355525','43644117-0a68-4f54-9d9d-a79bc788da6d'),('bea852e4-dc8c-4fa9-ab23-9e025bad558c','43644117-0a68-4f54-9d9d-a79bc788da6d'),('37b4a72a-ca7e-43bc-9d11-27fa7b625185','4a12dce5-7432-4a69-bc53-924bb8e14763'),('3af4e50d-5229-4db2-8514-bd654206469c','4a12dce5-7432-4a69-bc53-924bb8e14763'),('bb7e3087-8ad5-46fb-a66f-f201749b77dd','4a12dce5-7432-4a69-bc53-924bb8e14763'),('12d42716-ddf9-4a1c-ae19-509770c173fc','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('2480e19a-9b3d-457e-b01c-31d5a8c71d21','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('2c421755-e3f0-44bb-9dc9-23664ba75999','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('72e02da3-38f0-44af-b047-334e0575c99b','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('77b1f911-ab47-423f-b7c7-59dde8e6ddc1','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('a2ba492e-1b3f-4e0a-a2c9-b8cb97bea491','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('bbc5975f-d084-4af5-bc84-e3434c57ea21','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('de9e3906-1f7d-46fc-b1e0-c7479b359373','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('e7f4c7bb-c736-44ad-a932-fa9ff147e6d7','566021f0-f4e8-4ea0-b6ba-72a3c5b35599'),('2346b050-3bf2-4dcf-93f4-bc6079ceba05','628a4475-dc04-4f04-8232-82952becec7d'),('37b4a72a-ca7e-43bc-9d11-27fa7b625185','628a4475-dc04-4f04-8232-82952becec7d'),('48d39a36-0001-4b24-8ff4-713fce6ee144','628a4475-dc04-4f04-8232-82952becec7d'),('a07756dd-2e41-414c-9017-b93afd3bb522','628a4475-dc04-4f04-8232-82952becec7d'),('a9a48d94-076e-4dd8-902b-fa5b4cc92561','628a4475-dc04-4f04-8232-82952becec7d'),('bb7e3087-8ad5-46fb-a66f-f201749b77dd','628a4475-dc04-4f04-8232-82952becec7d'),('bf97ff26-b23e-498d-8d8b-536773b9d834','628a4475-dc04-4f04-8232-82952becec7d'),('d4462f7a-1c48-4ba1-b24f-3e0f8c82e550','628a4475-dc04-4f04-8232-82952becec7d'),('10726d7c-b18f-4cee-86ed-85b47f0cf37e','73327fb8-7eba-416c-b98a-eacbf51d1137'),('1e93736d-f776-45b2-a96b-d25eea66709b','73327fb8-7eba-416c-b98a-eacbf51d1137'),('22443081-8011-43ff-b0db-7c73d25c8539','73327fb8-7eba-416c-b98a-eacbf51d1137'),('22ffa567-5b11-4982-afc8-f3116f592f31','73327fb8-7eba-416c-b98a-eacbf51d1137'),('23eaffa9-c12b-4f4c-93b2-6c4ac04ada97','73327fb8-7eba-416c-b98a-eacbf51d1137'),('2aec1f96-5ff5-4c69-8762-e27ccf92b0aa','73327fb8-7eba-416c-b98a-eacbf51d1137'),('35326eab-a0bd-41ec-a152-be9086d25489','73327fb8-7eba-416c-b98a-eacbf51d1137'),('7fcb25fc-35c6-4ad3-8519-d4bc40635022','73327fb8-7eba-416c-b98a-eacbf51d1137'),('9df676e9-1d82-416a-b64e-342b628b22fd','73327fb8-7eba-416c-b98a-eacbf51d1137'),('a00df050-5498-4548-89e5-a8e0d746b586','73327fb8-7eba-416c-b98a-eacbf51d1137'),('c632a80d-e13b-4858-96a1-98211e7835a7','73327fb8-7eba-416c-b98a-eacbf51d1137'),('efba8528-db6b-44f6-a982-8b9e095d3927','73327fb8-7eba-416c-b98a-eacbf51d1137'),('054bebcf-01e1-4372-bde4-ff06daa0d164','a874c900-56b5-43c9-84cc-e2232d01accf'),('120ca44d-f527-4bb3-9583-d8161284cbde','a874c900-56b5-43c9-84cc-e2232d01accf'),('14981c9f-810f-446c-a117-cc854b2b7835','a874c900-56b5-43c9-84cc-e2232d01accf'),('2ecf43c0-432d-42d6-9dfc-cc1445361baf','a874c900-56b5-43c9-84cc-e2232d01accf'),('308a36be-0b75-42e8-8917-b711d045134d','a874c900-56b5-43c9-84cc-e2232d01accf'),('378a0b15-a242-4eb8-bea6-4e03b2c40ded','a874c900-56b5-43c9-84cc-e2232d01accf'),('3bc6bb6e-0c42-420c-9484-ba27cad08e7f','a874c900-56b5-43c9-84cc-e2232d01accf'),('52aac4f5-6406-4895-9c5f-7f8ffdd8413a','a874c900-56b5-43c9-84cc-e2232d01accf'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','a874c900-56b5-43c9-84cc-e2232d01accf'),('a0e43a7c-29f7-4e91-804d-08d094de488b','a874c900-56b5-43c9-84cc-e2232d01accf'),('afaee320-f76a-48ad-a700-b106d05813d9','a874c900-56b5-43c9-84cc-e2232d01accf'),('b6f16505-bdbe-4ee0-af77-06ddb84cb62c','a874c900-56b5-43c9-84cc-e2232d01accf'),('b8d4e191-773f-4142-a859-8314a7fb5926','a874c900-56b5-43c9-84cc-e2232d01accf'),('bea852e4-dc8c-4fa9-ab23-9e025bad558c','a874c900-56b5-43c9-84cc-e2232d01accf'),('c0e4d349-85f5-47fd-8f93-aa8cdaf816bf','a874c900-56b5-43c9-84cc-e2232d01accf'),('c181012a-31a5-4a76-acf7-75d7a6e0bb59','a874c900-56b5-43c9-84cc-e2232d01accf'),('c1fab73c-9b32-4931-b49a-0e25ada0f0b6','a874c900-56b5-43c9-84cc-e2232d01accf'),('cd22ea20-4224-4b01-a4d3-29d97a306861','a874c900-56b5-43c9-84cc-e2232d01accf'),('ce03ff53-dd1f-4a70-96f9-fee461bdfe4b','a874c900-56b5-43c9-84cc-e2232d01accf'),('ce4d96ba-0759-4405-b77c-9ac5ec5ca368','a874c900-56b5-43c9-84cc-e2232d01accf'),('ce545cba-3739-491a-a4b0-2178a6a9ec45','a874c900-56b5-43c9-84cc-e2232d01accf'),('d373fd80-c342-49d9-8c2e-ab0a7b0e7a37','a874c900-56b5-43c9-84cc-e2232d01accf'),('d98a0753-50e2-45e1-b0c9-e98d41bd64ce','a874c900-56b5-43c9-84cc-e2232d01accf'),('dc509253-74e0-43b0-8d0c-6f9895dffae4','a874c900-56b5-43c9-84cc-e2232d01accf'),('de71c678-fba9-42bc-a16c-a0a339d0c820','a874c900-56b5-43c9-84cc-e2232d01accf'),('e6320424-9682-466c-bc33-131ffeb0c062','a874c900-56b5-43c9-84cc-e2232d01accf'),('2ecf43c0-432d-42d6-9dfc-cc1445361baf','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('378a0b15-a242-4eb8-bea6-4e03b2c40ded','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('3bc6bb6e-0c42-420c-9484-ba27cad08e7f','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('45220250-6002-4f8a-bb49-f3dbe07fd3fc','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('46ac402d-f653-4c27-887f-685a697f46e9','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('46f7a006-c3b2-4fcb-9265-6b7715daeeb5','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('5e3951fd-7594-4bd3-8a12-84dbc1552d13','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('66ee0cf6-ed60-42b7-8bd8-ee497863d25f','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('93d8d4e2-303c-47d4-9eb9-4a599f4bd9b1','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('9f71496a-1d21-4282-8032-cc93fdac806d','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('a0e43a7c-29f7-4e91-804d-08d094de488b','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('bea852e4-dc8c-4fa9-ab23-9e025bad558c','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('c0e4d349-85f5-47fd-8f93-aa8cdaf816bf','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('c1fab73c-9b32-4931-b49a-0e25ada0f0b6','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('cd22ea20-4224-4b01-a4d3-29d97a306861','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('ce03ff53-dd1f-4a70-96f9-fee461bdfe4b','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('ce4d96ba-0759-4405-b77c-9ac5ec5ca368','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('ce545cba-3739-491a-a4b0-2178a6a9ec45','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('d373fd80-c342-49d9-8c2e-ab0a7b0e7a37','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('d85332df-5cd4-4bd2-aecd-e53fc4db8ef0','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('dc509253-74e0-43b0-8d0c-6f9895dffae4','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('e2e3689c-e30f-40f8-90af-cc7b3376724e','bbeb9671-7a62-4333-a809-b4138e11a4ed'),('378a0b15-a242-4eb8-bea6-4e03b2c40ded','c262046d-3b62-41ca-89f5-747cdbcf472a'),('75fd73bb-ffba-45bc-9115-f326a69abd9e','c262046d-3b62-41ca-89f5-747cdbcf472a'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','c262046d-3b62-41ca-89f5-747cdbcf472a'),('a0e43a7c-29f7-4e91-804d-08d094de488b','c262046d-3b62-41ca-89f5-747cdbcf472a'),('bea852e4-dc8c-4fa9-ab23-9e025bad558c','c262046d-3b62-41ca-89f5-747cdbcf472a');
/*!40000 ALTER TABLE `GROUP_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0',
  PRIMARY KEY (`INTERNAL_ID`),
  UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER`
--

LOCK TABLES `IDENTITY_PROVIDER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_CONFIG`
--

LOCK TABLES `IDENTITY_PROVIDER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

DROP TABLE IF EXISTS `IDENTITY_PROVIDER_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDENTITY_PROVIDER_MAPPER`
--

LOCK TABLES `IDENTITY_PROVIDER_MAPPER` WRITE;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDENTITY_PROVIDER_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `IDP_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `IDP_MAPPER_CONFIG`
--

LOCK TABLES `IDP_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `IDP_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_GROUP`
--

DROP TABLE IF EXISTS `KEYCLOAK_GROUP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `PARENT_GROUP` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`),
  CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_GROUP`
--

LOCK TABLES `KEYCLOAK_GROUP` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_GROUP` VALUES ('c262046d-3b62-41ca-89f5-747cdbcf472a','clinic_admin',' ','hi'),('43644117-0a68-4f54-9d9d-a79bc788da6d','country_admin',' ','hi'),('a874c900-56b5-43c9-84cc-e2232d01accf','organization_admin',' ','hi'),('bbeb9671-7a62-4333-a809-b4138e11a4ed','super_admin',' ','hi'),('566021f0-f4e8-4ea0-b6ba-72a3c5b35599','translator',' ','hi'),('628a4475-dc04-4f04-8232-82952becec7d','admin',' ','hi-library'),('4a12dce5-7432-4a69-bc53-924bb8e14763','moderator',' ','hi-library'),('73327fb8-7eba-416c-b98a-eacbf51d1137','therapist',' ','hi-therapist');
/*!40000 ALTER TABLE `KEYCLOAK_GROUP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `KEYCLOAK_ROLE`
--

DROP TABLE IF EXISTS `KEYCLOAK_ROLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`),
  CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `KEYCLOAK_ROLE`
--

LOCK TABLES `KEYCLOAK_ROLE` WRITE;
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` DISABLE KEYS */;
INSERT INTO `KEYCLOAK_ROLE` VALUES ('0298bc76-a999-46cc-82b0-ad5786222d76','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_manage-users}','manage-users','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('054bebcf-01e1-4372-bde4-ff06daa0d164','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_manage-realm}','manage-realm','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('062883cd-4a6b-46f2-b8f3-2bb0a09e245b','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_query-realms}','query-realms','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('07caf862-aa71-42e2-8e1b-72636efc39ed','hi',_binary '\0',NULL,'view_educational_material','hi',NULL,'hi'),('0bd1e972-359f-4451-a62d-d219f1d3e1f5','hi',_binary '\0',NULL,'view_questionnaire','hi',NULL,'hi'),('0dba3061-2a7f-4419-a9e1-e79a52a1e0d9','b3fea689-45c7-4c2b-96ef-b389a0355159',_binary '','${role_read-token}','read-token','hi-library','b3fea689-45c7-4c2b-96ef-b389a0355159',NULL),('10726d7c-b18f-4cee-86ed-85b47f0cf37e','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_manage-users}','manage-users','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('1131383e-de0d-491f-8940-f2d2ff21f361','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_view-clients}','view-clients','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('120ca44d-f527-4bb3-9583-d8161284cbde','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_create-client}','create-client','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('12d42716-ddf9-4a1c-ae19-509770c173fc','hi',_binary '\0',NULL,'translate_exercise','hi',NULL,'hi'),('14981c9f-810f-446c-a117-cc854b2b7835','hi',_binary '\0','Able to manage the color scheme','manage_color_scheme','hi',NULL,'hi'),('14ac522d-5f9f-495c-8481-87e42bb08980','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_impersonation}','impersonation','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('14f729d2-c548-4e43-bb0c-d974bc6af896','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_query-groups}','query-groups','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('15b61531-58a3-4c8f-9bbb-30f08526ceff','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_query-clients}','query-clients','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('18ad43de-71c2-4a8b-ad73-f07085acdf31','89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '','${role_manage-account}','manage-account','hi-therapist','89d22c6b-7a3a-406a-8635-049ea85abb55',NULL),('1921fe4f-bc6d-4c31-8983-63ea0d3d28a3','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('1c1676e8-93d6-4468-a1ed-ef29a45da551','ac8a7f4f-fefc-4a43-bc0f-b42078184dc5',_binary '','${role_read-token}','read-token','hi','ac8a7f4f-fefc-4a43-bc0f-b42078184dc5',NULL),('1cb16ce1-3a7f-43b9-bacf-10c1ad9a49bc','55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '','${role_manage-account-links}','manage-account-links','hi','55c52d92-7f2e-40b2-8cef-35e558d2c72b',NULL),('1d158036-ed3b-436f-ad15-c5925cdfbbc2','1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '','${role_view-consent}','view-consent','master','1288ec7b-6f3d-429e-b43e-2e0b710239ba',NULL),('1d33e369-a70f-4178-aafe-6907f30eb041','hi-therapist',_binary '\0',NULL,'setup_category','hi-therapist',NULL,'hi-therapist'),('1d6d918f-c1c3-48cb-81b4-e0a65fb1b92c','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_view-identity-providers}','view-identity-providers','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('1dc40da9-ce99-4be0-a632-9765bf897854','hi-therapist',_binary '\0','Able to CRUD the therapist user','manage_therapist','hi-therapist',NULL,'hi-therapist'),('1dd8f455-fe1e-4019-b31e-66421091ddd8','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_view-events}','view-events','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('1e93736d-f776-45b2-a96b-d25eea66709b','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_query-groups}','query-groups','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('1f793b3d-406f-43d5-b323-edecd35d7ace','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_manage-users}','manage-users','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('22443081-8011-43ff-b0db-7c73d25c8539','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_query-clients}','query-clients','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('22d81b87-2705-4b8a-9f17-d8c73bbb8ada','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_query-groups}','query-groups','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('22ffa567-5b11-4982-afc8-f3116f592f31','89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '','${role_view-profile}','view-profile','hi-therapist','89d22c6b-7a3a-406a-8635-049ea85abb55',NULL),('2346b050-3bf2-4dcf-93f4-bc6079ceba05','hi-library',_binary '\0','Manage translation','manage_translation','hi-library',NULL,'hi-library'),('2385fd60-9f39-4485-aa49-d06c6519316f','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_create-client}','create-client','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('23eaffa9-c12b-4f4c-93b2-6c4ac04ada97','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_manage-identity-providers}','manage-identity-providers','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('242285dd-bda3-4f01-a8c5-8edf054b9c00','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_view-clients}','view-clients','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('2480e19a-9b3d-457e-b01c-31d5a8c71d21','hi',_binary '\0',NULL,'translate_guidance_page','hi',NULL,'hi'),('285c93ec-8189-4bc2-8d45-80868c84068a','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_manage-events}','manage-events','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('297cc743-3395-4613-82b9-0c9316f72255','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_query-realms}','query-realms','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('2aec1f96-5ff5-4c69-8762-e27ccf92b0aa','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_manage-events}','manage-events','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('2c421755-e3f0-44bb-9dc9-23664ba75999','hi',_binary '\0',NULL,'translate_category','hi',NULL,'hi'),('2caea195-e039-4c43-8197-3afd1fa5b5da','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_query-users}','query-users','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('2d685fb4-91d7-4004-a3bd-f687ca8a9414','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_view-authorization}','view-authorization','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('2d7c0c3c-74d3-464c-8949-5955fb9ebaaa','hi',_binary '\0',NULL,'view_exercise','hi',NULL,'hi'),('2e12ca9a-83f4-4aed-98a7-7fa6ea1ba299','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_manage-users}','manage-users','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('2ecf43c0-432d-42d6-9dfc-cc1445361baf','hi',_binary '\0',NULL,'setup_category','hi',NULL,'hi'),('308a36be-0b75-42e8-8917-b711d045134d','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_manage-authorization}','manage-authorization','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('31dd067f-5aa5-4ac2-896c-8a42efb5062e','89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '','${role_manage-account-links}','manage-account-links','hi-therapist','89d22c6b-7a3a-406a-8635-049ea85abb55',NULL),('31fb5c69-e11c-4557-b38e-2d66a0f9dc8e','3d1bc1d3-98c0-4a03-abee-8057573ff7cb',_binary '','${role_read-token}','read-token','master','3d1bc1d3-98c0-4a03-abee-8057573ff7cb',NULL),('34e066a1-a850-4ed5-9e14-f2438a9b2135','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_manage-clients}','manage-clients','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('35326eab-a0bd-41ec-a152-be9086d25489','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_manage-realm}','manage-realm','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('378a0b15-a242-4eb8-bea6-4e03b2c40ded','hi',_binary '\0',NULL,'view_dashboard','hi',NULL,'hi'),('37b4a72a-ca7e-43bc-9d11-27fa7b625185','hi-library',_binary '\0','Able to CRUD the the resource, and can them','manage_resource','hi-library',NULL,'hi-library'),('38270fed-0ae0-4300-ac04-f8f0f69285af','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '','${role_view-applications}','view-applications','hi-library','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',NULL),('38f80631-917d-4413-9562-7cb836e89858','hi',_binary '\0','${role_offline-access}','offline_access','hi',NULL,'hi'),('3992601b-152d-4c5e-bcff-7007b41923e3','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_view-clients}','view-clients','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('3af4e50d-5229-4db2-8514-bd654206469c','hi-library',_binary '\0','Able to approve/decline resource and translation','review_resource','hi-library',NULL,'hi-library'),('3ba06e2e-8369-4329-99c5-f48c8c7a2c39','hi',_binary '\0','Able to CRUD the clinic admin user','manage_clinic_admin','hi',NULL,'hi'),('3bc6bb6e-0c42-420c-9484-ba27cad08e7f','hi',_binary '\0',NULL,'manage_static_page','hi',NULL,'hi'),('3cccce94-b48e-4c33-8958-4f7657fc314b','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_impersonation}','impersonation','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('3eaec993-a4f3-42e1-ba9a-8aaadd1df12a','hi-therapist',_binary '\0','Able to CRUD the exercise','setup_exercise','hi-therapist',NULL,'hi-therapist'),('3f903215-6c7d-4c4b-85b3-0059ee3d67f1','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_view-clients}','view-clients','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('402f483e-b25a-4ef6-a7b5-edd149476a66','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_query-users}','query-users','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('415103ec-a3f4-401f-950a-72d6b14b6f78','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_manage-authorization}','manage-authorization','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('44be220f-b334-4263-9cf7-f8f561e78cd8','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_view-realm}','view-realm','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('44f11c4f-11de-4930-a9bb-66f1504833af','hi-library',_binary '\0','${role_offline-access}','offline_access','hi-library',NULL,'hi-library'),('45220250-6002-4f8a-bb49-f3dbe07fd3fc','hi',_binary '\0',NULL,'manage_organization','hi',NULL,'hi'),('46ac402d-f653-4c27-887f-685a697f46e9','hi',_binary '\0',NULL,'manage_term_condition','hi',NULL,'hi'),('46f7a006-c3b2-4fcb-9265-6b7715daeeb5','hi',_binary '\0',NULL,'manage_disease','hi',NULL,'hi'),('47ae232f-75b7-4988-9298-7bdaa6765b46','hi',_binary '\0',NULL,'submit_questionnaire_answer','hi',NULL,'hi'),('48d39a36-0001-4b24-8ff4-713fce6ee144','hi-library',_binary '\0','Able to CRUD the static page','manage_static_page','hi-library',NULL,'hi-library'),('48dfb461-04ca-48a5-95e3-1371514e7f0a','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_view-events}','view-events','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('49e18c09-e656-430c-b553-e6ecc1021764','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_view-authorization}','view-authorization','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('49ece663-7023-411c-a095-abddc2b344a9','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_view-events}','view-events','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('4a38d073-c8b2-4d2f-a41b-309828b871c8','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '','${role_manage-account}','manage-account','hi-library','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',NULL),('4ac09737-0054-4017-9be3-bef99d4f80ab','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_query-realms}','query-realms','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('4b6e58bc-31ce-4f87-ba54-d537ca2592cd','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_manage-clients}','manage-clients','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('4c61424e-c93e-48cf-98e4-e57ba8afc85e','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_view-authorization}','view-authorization','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('4cb97d48-2f20-4146-9b3f-2317233e53c5','hi-therapist',_binary '\0','Able to CRUD the patient','manage_patient','hi-therapist',NULL,'hi-therapist'),('4d3a4901-714f-4f20-a9ff-690cc5319eeb','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_query-users}','query-users','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('52aac4f5-6406-4895-9c5f-7f8ffdd8413a','hi',_binary '\0','Able to view the term condition','view_term_condition','hi',NULL,'hi'),('52e3937a-614a-4d35-94df-cbb332b995ec','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_view-identity-providers}','view-identity-providers','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('53607b42-ccf5-42e2-b0e7-79e183e32cfe','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_impersonation}','impersonation','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('5460ad86-a19a-467f-ba48-9c1ad3377b1c','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_manage-identity-providers}','manage-identity-providers','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('54f3ba9c-339a-47f1-9c90-7adb0dc81720','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_query-clients}','query-clients','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('561aa322-24db-4b3e-837e-95566a8010a1','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_view-users}','view-users','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('566d5ed8-f34e-4d54-af16-b22bfd2d999d','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_manage-clients}','manage-clients','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('56fceb4c-8177-42bb-ae99-b408c919532e','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_query-users}','query-users','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('57f8de0b-ed99-4fa1-b2c3-9349f52799a2','hi-therapist',_binary '\0','${role_offline-access}','offline_access','hi-therapist',NULL,'hi-therapist'),('58638617-b996-4958-8fd7-39f13662cfa9','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_view-users}','view-users','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('58e44ab5-ff5a-49d1-87a5-004b50d7bc4d','hi-therapist',_binary '\0',NULL,'view_goal_progress','hi-therapist',NULL,'hi-therapist'),('5902a4b5-396b-4eea-905a-c118fa71b163','89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '','${role_view-applications}','view-applications','hi-therapist','89d22c6b-7a3a-406a-8635-049ea85abb55',NULL),('5ab04104-9ddd-43b4-bd42-4642f7bdf36e','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_view-identity-providers}','view-identity-providers','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('5b6c12f0-0e9b-471a-babf-c11e0609fe71','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_query-clients}','query-clients','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('5bd24075-4f1a-4f31-9646-d152685192a8','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '','${role_manage-account-links}','manage-account-links','hi-library','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',NULL),('5ddd5c4c-e4d8-45d0-a399-d240e8a434c3','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_create-client}','create-client','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('5de95d05-8d26-4af8-ba68-e403183dcd49','hi',_binary '\0',NULL,'view_appointment','hi',NULL,'hi'),('5e3951fd-7594-4bd3-8a12-84dbc1552d13','hi',_binary '\0',NULL,'manage_translation','hi',NULL,'hi'),('5eeae865-ed74-4f5b-8901-8ef7f397fb18','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_view-authorization}','view-authorization','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('5fea908a-8b72-45f3-a5f8-457a2ec35db0','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_view-authorization}','view-authorization','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('619042b1-f9e2-46fc-a4cf-25d191e5412b','hi',_binary '\0','${role_uma_authorization}','uma_authorization','hi',NULL,'hi'),('66ee0cf6-ed60-42b7-8bd8-ee497863d25f','hi',_binary '\0',NULL,'manage_privacy_policy','hi',NULL,'hi'),('677d4ca9-0212-4f5e-b061-b284152a1870','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_view-users}','view-users','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('68058e8a-9155-4286-8c47-2009a9e63b39','55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '','${role_view-consent}','view-consent','hi','55c52d92-7f2e-40b2-8cef-35e558d2c72b',NULL),('684b9754-6a4e-496d-887b-6c5a9e9b38b8','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_manage-events}','manage-events','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('69106efc-b3f8-4f20-a69a-8d47b0e15ab1','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_view-identity-providers}','view-identity-providers','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('6a3356b5-86ba-4956-ad4b-84cc8d51aafb','hi-therapist',_binary '\0','Able to CRUD the educational material','setup_educational_material','hi-therapist',NULL,'hi-therapist'),('6de77d1f-fa45-428f-84d5-6d317841c5e8','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_query-groups}','query-groups','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('6e394702-4f6a-4b94-9470-519fd14eead7','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_view-users}','view-users','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('70c3353e-289e-4686-b254-6a8475f53402','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_query-realms}','query-realms','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('724a47ee-a397-4a64-aa58-eb4682607e7e','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_view-realm}','view-realm','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('72e02da3-38f0-44af-b047-334e0575c99b','hi',_binary '\0',NULL,'translate_educational_material','hi',NULL,'hi'),('74061294-979c-41ca-89f0-f188f91b6c0a','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_view-clients}','view-clients','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('75fd73bb-ffba-45bc-9115-f326a69abd9e','hi',_binary '\0','Able to CRUD the therapist user','manage_therapist','hi',NULL,'hi'),('7648244f-8f6a-43d8-94b0-5d3c1694547c','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_create-client}','create-client','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('76ac899d-029d-4ab3-b123-b33d43881931','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_impersonation}','impersonation','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('76d0231e-ccd3-43f1-a147-b7b7a24aab88','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_manage-authorization}','manage-authorization','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('77456bd3-b257-4094-8591-c79eab57a465','hi',_binary '\0','view, select and arrange content','create_treatment_plan_for_patient','hi',NULL,'hi'),('77b1f911-ab47-423f-b7c7-59dde8e6ddc1','hi',_binary '\0',NULL,'translate_term_condition','hi',NULL,'hi'),('781d96e7-76e4-405e-a5d3-dde6a26bdb12','hi',_binary '\0',NULL,'manage_clinic','hi',NULL,'hi'),('79379a0d-8564-4c5a-9281-80e6e8f9c259','89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '','${role_view-consent}','view-consent','hi-therapist','89d22c6b-7a3a-406a-8635-049ea85abb55',NULL),('7a77eaa4-ec6d-4364-9d61-113997360274','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_realm-admin}','realm-admin','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('7ab2df1b-095d-4df9-ae9a-82c9c489e8f0','master',_binary '\0','${role_create-realm}','create-realm','master',NULL,'master'),('7dd12a22-6e02-4c0d-a98a-e610c52b8678','hi-therapist',_binary '\0','Able to CRUD the country admin user','manage_country_admin','hi-therapist',NULL,'hi-therapist'),('7fcb25fc-35c6-4ad3-8519-d4bc40635022','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_impersonation}','impersonation','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('82bdc776-a4d7-4cc0-924b-2f819c00f674','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_create-client}','create-client','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('82d73cb9-7046-4cbf-acc6-176f67419ee5','hi',_binary '\0',NULL,'view_treatment_detail','hi',NULL,'hi'),('84be6ae7-bcb2-43a4-b0b7-672534afe8cb','1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '','${role_view-applications}','view-applications','master','1288ec7b-6f3d-429e-b43e-2e0b710239ba',NULL),('864c5a94-0990-484f-be31-2a78ed815e00','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_query-realms}','query-realms','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('86cc53c6-7921-4f3a-9d08-d84718c5046f','hi',_binary '\0',NULL,'arrange_appointment','hi',NULL,'hi'),('8841ef88-bcd0-402e-bd15-499fb05b954d','1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '','${role_manage-account-links}','manage-account-links','master','1288ec7b-6f3d-429e-b43e-2e0b710239ba',NULL),('889edec8-6fd2-40ca-ab3a-4a640e0312c3','hi-therapist',_binary '\0',NULL,'view_appointment','hi-therapist',NULL,'hi-therapist'),('88cb6e2b-59b7-4623-ac7a-9a4da7f6fdde','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_view-events}','view-events','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('8bd25600-aeab-447d-825e-ead3d7217518','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_view-identity-providers}','view-identity-providers','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('8cfa4596-c794-4a7d-81b7-9be60295cddc','hi-therapist',_binary '\0',NULL,'submit_exercise_result','hi-therapist',NULL,'hi-therapist'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '','${role_view-profile}','view-profile','hi','55c52d92-7f2e-40b2-8cef-35e558d2c72b',NULL),('8e6a0fb9-c145-42df-9fa2-a3b1893119b2','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_manage-realm}','manage-realm','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('909d09c1-22eb-4144-b5ec-30b8de651dd2','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '','${role_manage-consent}','manage-consent','hi-library','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',NULL),('90c096ed-e262-4d33-b108-2e94efc15e5b','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('9239b389-0550-4654-bb93-4b8c97ed6da5','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_manage-users}','manage-users','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('93d8d4e2-303c-47d4-9eb9-4a599f4bd9b1','hi',_binary '\0',NULL,'manage_translator','hi',NULL,'hi'),('9477a00f-8934-4e15-b988-08202d1975d7','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_view-users}','view-users','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('95875ed1-42bc-42ae-9c0e-4145e9ce5f63','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_manage-users}','manage-users','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('96c94865-f042-4716-89c8-d28d62da716b','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_manage-realm}','manage-realm','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('99668381-46f5-4934-864f-922c66efa7dd','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_query-users}','query-users','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('996b8b32-cfb2-4912-b250-83ed166bad34','hi-therapist',_binary '\0','Able to CRUD the clinic admin user','manage_clinic_admin','hi-therapist',NULL,'hi-therapist'),('998b3784-2126-4f2c-ae88-006aec714bb7','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_view-realm}','view-realm','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('9ac3098d-e17e-4f43-acd8-efcefdbe37c8','89d22c6b-7a3a-406a-8635-049ea85abb55',_binary '','${role_manage-consent}','manage-consent','hi-therapist','89d22c6b-7a3a-406a-8635-049ea85abb55',NULL),('9b3bf72d-8c6a-4dd2-b676-adaf85286bae','hi-therapist',_binary '\0',NULL,'arrange_appointment','hi-therapist',NULL,'hi-therapist'),('9bb9ff1d-b7b5-465b-a062-ce5008ff6cf3','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_manage-clients}','manage-clients','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','master',_binary '\0','${role_admin}','admin','master',NULL,'master'),('9df676e9-1d82-416a-b64e-342b628b22fd','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_manage-clients}','manage-clients','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('9e73d30d-39bd-4b9e-a0a4-b5acc01c762f','hi-therapist',_binary '\0','view, select and arrange content','create_treatment_plan_for_patient','hi-therapist',NULL,'hi-therapist'),('9f71496a-1d21-4282-8032-cc93fdac806d','hi',_binary '\0',NULL,'manage_guidance_page','hi',NULL,'hi'),('a00df050-5498-4548-89e5-a8e0d746b586','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_create-client}','create-client','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('a07756dd-2e41-414c-9017-b93afd3bb522','hi-library',_binary '\0',NULL,'manage_language','hi-library',NULL,'hi-library'),('a0e43a7c-29f7-4e91-804d-08d094de488b','hi',_binary '\0',NULL,'view_edit_own_profile','hi',NULL,'hi'),('a0ed7511-4e73-496b-8381-4830ea6c8a86','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_view-authorization}','view-authorization','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('a101ab45-c2cd-49c1-9f29-858b1cbfcd1c','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_manage-authorization}','manage-authorization','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('a1536262-08cb-4b79-b0db-c676eb890b2e','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_view-identity-providers}','view-identity-providers','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('a2ba492e-1b3f-4e0a-a2c9-b8cb97bea491','hi',_binary '\0',NULL,'translate_static_page','hi',NULL,'hi'),('a2c3724c-6af6-4971-bc63-eef9fa25187d','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_view-realm}','view-realm','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('a43df422-48c0-4a17-bf2a-d628deb44d5f','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_view-events}','view-events','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('a66c14fa-631a-4e0b-9d82-e8b7f15e189f','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_manage-realm}','manage-realm','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('a929749a-7c30-4cf2-9d55-34294c77b091','hi-therapist',_binary '\0',NULL,'view_edit_own_profile','hi-therapist',NULL,'hi-therapist'),('a9a48d94-076e-4dd8-902b-fa5b4cc92561','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '','${role_view-profile}','view-profile','hi-library','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',NULL),('aa08b7ec-5382-4d15-bf0d-b2a3b0c34552','hi',_binary '\0','Able to CRUD the patient','manage_patient','hi',NULL,'hi'),('ada4a48a-3bba-4f0e-93fb-0577d5143d0a','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_view-users}','view-users','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('aeac672f-dc8f-450e-b2e3-ab866af60ae0','55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '','${role_manage-consent}','manage-consent','hi','55c52d92-7f2e-40b2-8cef-35e558d2c72b',NULL),('af47ac5e-673f-4a8e-a96f-36a84a72d4ea','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_manage-clients}','manage-clients','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('afaee320-f76a-48ad-a700-b106d05813d9','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_manage-identity-providers}','manage-identity-providers','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('b12b28cb-ae8c-47be-a339-584caba2f264','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_view-authorization}','view-authorization','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('b158838e-c17a-4a04-a920-b0cb24db4c09','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_query-groups}','query-groups','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('b30da0e7-4091-4583-8472-419ccb8f9de0','55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '','${role_manage-account}','manage-account','hi','55c52d92-7f2e-40b2-8cef-35e558d2c72b',NULL),('b3cb606d-891e-4952-bb8c-f0980ec78d72','hi-therapist',_binary '\0','Able to CRUD the educational questionnaire','setup_questionnaire','hi-therapist',NULL,'hi-therapist'),('b57b0da5-ac8d-48a2-be41-2e12f5e6dcda','78044321-1410-42bf-9489-f89303e77e5a',_binary '','${role_read-token}','read-token','hi-therapist','78044321-1410-42bf-9489-f89303e77e5a',NULL),('b6f16505-bdbe-4ee0-af77-06ddb84cb62c','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_manage-users}','manage-users','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('b82479b2-0770-4d20-b015-ffeb651b6fe1','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_query-realms}','query-realms','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('b828f2ee-5fc3-42c7-ac6a-fec7a25f4e74','master',_binary '\0','${role_uma_authorization}','uma_authorization','master',NULL,'master'),('b8d4e191-773f-4142-a859-8314a7fb5926','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_query-clients}','query-clients','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('bb7e3087-8ad5-46fb-a66f-f201749b77dd','hi-library',_binary '\0','Able to update its own user profile','view_edit_own_profile','hi-library',NULL,'hi-library'),('bbb1dad1-62c2-4922-b864-2a1effe10347','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_view-events}','view-events','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('bbc5975f-d084-4af5-bc84-e3434c57ea21','hi',_binary '\0',NULL,'translate_privacy_policy','hi',NULL,'hi'),('bcbc6ae1-2e22-494d-b760-0e8583355525','hi',_binary '\0',NULL,'manage_profession','hi',NULL,'hi'),('bea852e4-dc8c-4fa9-ab23-9e025bad558c','hi',_binary '\0',NULL,'view_report','hi',NULL,'hi'),('bf241da0-eba6-4f64-90b5-fe63072844db','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_view-clients}','view-clients','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('bf97ff26-b23e-498d-8d8b-536773b9d834','hi-library',_binary '\0','Able to CRUD the user','manage_user','hi-library',NULL,'hi-library'),('c0a6b980-eb58-4f78-bace-709d78ebf49a','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_manage-authorization}','manage-authorization','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('c0e4d349-85f5-47fd-8f93-aa8cdaf816bf','hi',_binary '\0','Able to CRUD the global admin user','manage_global_admin','hi',NULL,'hi'),('c181012a-31a5-4a76-acf7-75d7a6e0bb59','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_query-users}','query-users','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('c1fab73c-9b32-4931-b49a-0e25ada0f0b6','hi',_binary '\0','Able to CRUD the exercise','setup_exercise','hi',NULL,'hi'),('c2db71d6-b098-4688-a383-12e79f5bcc7d','1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '','${role_manage-account}','manage-account','master','1288ec7b-6f3d-429e-b43e-2e0b710239ba',NULL),('c31eb90e-f12d-4516-b7df-870e1d8e351d','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('c43fba40-8523-428c-b2ce-793efe0fa6de','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_manage-realm}','manage-realm','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('c488a6e4-2fb7-4ede-b36e-ac876cb23470','hi',_binary '\0',NULL,'submit_exercise_result','hi',NULL,'hi'),('c632a80d-e13b-4858-96a1-98211e7835a7','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_manage-authorization}','manage-authorization','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('c7347789-2ff6-42f6-b66e-f174895d2838','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_manage-clients}','manage-clients','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('cc4ba29a-6d5f-4a44-8708-f04fa4685152','hi-therapist',_binary '\0',NULL,'view_questionnaire','hi-therapist',NULL,'hi-therapist'),('ccd1d72a-1899-4330-959a-dcd53fdf08f3','hi-therapist',_binary '\0',NULL,'view_educational_material','hi-therapist',NULL,'hi-therapist'),('cd22ea20-4224-4b01-a4d3-29d97a306861','hi',_binary '\0','Able to CRUD the educational questionnaire','setup_questionnaire','hi',NULL,'hi'),('cd45236d-bff4-4b6e-9d29-f50a2bdb710b','hi-therapist',_binary '\0','${role_uma_authorization}','uma_authorization','hi-therapist',NULL,'hi-therapist'),('ce03ff53-dd1f-4a70-96f9-fee461bdfe4b','hi',_binary '\0',NULL,'manage_organization_admin','hi',NULL,'hi'),('ce4d96ba-0759-4405-b77c-9ac5ec5ca368','hi',_binary '\0',NULL,'manage_country','hi',NULL,'hi'),('ce545cba-3739-491a-a4b0-2178a6a9ec45','hi',_binary '\0','Able to CRUD the country admin user','manage_country_admin','hi',NULL,'hi'),('ce58491c-8ecd-45eb-9386-46489869e50b','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_query-groups}','query-groups','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('ce78b116-0146-4168-9e0c-dd6abc7989ea','hi',_binary '\0',NULL,'view_goal_progress','hi',NULL,'hi'),('ce81cff5-3cce-40f2-86b2-e1e75d00ab76','hi',_binary '\0',NULL,'message_call_between_therapist_patient','hi',NULL,'hi'),('d0472798-0773-4a9a-9ea1-0547f4968d28','master',_binary '\0','${role_offline-access}','offline_access','master',NULL,'master'),('d10021f4-b42f-4d36-86d6-472063f00e1f','hi',_binary '\0',NULL,'input_goal_progress','hi',NULL,'hi'),('d19370df-9c4e-41f4-bf84-a59d49602adb','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_query-realms}','query-realms','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('d373fd80-c342-49d9-8c2e-ab0a7b0e7a37','hi',_binary '\0','Able to CRUD the educational material','setup_educational_material','hi',NULL,'hi'),('d42d4b1d-fd21-4278-9923-4588f6a6df23','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_view-realm}','view-realm','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('d4462f7a-1c48-4ba1-b24f-3e0f8c82e550','hi-library',_binary '\0','Able to CRUD the category','setup_category','hi-library',NULL,'hi-library'),('d686ff30-9ce6-4d21-b40e-954cf53da12d','hi-library',_binary '\0','${role_uma_authorization}','uma_authorization','hi-library',NULL,'hi-library'),('d740044a-1084-4c9d-b6e1-351ac19b02a5','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_manage-events}','manage-events','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('d804beeb-4b12-42b9-ab6f-8fc8e14d8d1d','hi-therapist',_binary '\0',NULL,'view_exercise','hi-therapist',NULL,'hi-therapist'),('d85332df-5cd4-4bd2-aecd-e53fc4db8ef0','hi',_binary '\0',NULL,'super_admin','hi',NULL,'hi'),('d8978dbe-2f95-407f-bc7c-c5425b8bfaaa','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_view-identity-providers}','view-identity-providers','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('d9200ac4-0370-48ab-9339-1fa3b80cc030','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_impersonation}','impersonation','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('d98a0753-50e2-45e1-b0c9-e98d41bd64ce','hi',_binary '\0','Able to view the privacy policy','view_privacy_policy','hi',NULL,'hi'),('dc2548b0-a639-46fa-b100-d9e79403159a','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_view-clients}','view-clients','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('dc509253-74e0-43b0-8d0c-6f9895dffae4','hi',_binary '\0',NULL,'manage_system_limit','hi',NULL,'hi'),('dcd52f0b-387f-48db-82d1-b706d50e756a','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_manage-realm}','manage-realm','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('dd09bc4c-82ce-4c7f-a199-74d18141777a','hi-therapist',_binary '\0',NULL,'view_treatment_detail','hi-therapist',NULL,'hi-therapist'),('dd3f5e76-3ede-469e-b1fb-ee1ada3b0006','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_manage-authorization}','manage-authorization','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('de71c678-fba9-42bc-a16c-a0a339d0c820','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_manage-events}','manage-events','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('de9e3906-1f7d-46fc-b1e0-c7479b359373','hi',_binary '\0',NULL,'translate_questionnaire','hi',NULL,'hi'),('e0087938-a86d-4136-ab2e-2c6148e15279','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_query-clients}','query-clients','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('e277a2d9-196e-441e-b560-f5ae4a6cdb6b','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',_binary '','${role_create-client}','create-client','master','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',NULL),('e2e3689c-e30f-40f8-90af-cc7b3376724e','hi',_binary '\0',NULL,'manage_language','hi',NULL,'hi'),('e59b9570-112d-4b45-9a21-975f40df2f2c','1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '','${role_manage-consent}','manage-consent','master','1288ec7b-6f3d-429e-b43e-2e0b710239ba',NULL),('e6320424-9682-466c-bc33-131ffeb0c062','eec28897-b54a-4d82-9488-f454e28d01ea',_binary '','${role_realm-admin}','realm-admin','hi','eec28897-b54a-4d82-9488-f454e28d01ea',NULL),('e6bc4d2e-62c3-4ca8-b5fe-3dd02e0b6e55','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_view-realm}','view-realm','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('e7f4c7bb-c736-44ad-a932-fa9ff147e6d7','hi',_binary '\0',NULL,'translate_translation','hi',NULL,'hi'),('eac704fd-d0a7-4137-9e18-2c54d6a861f0','1288ec7b-6f3d-429e-b43e-2e0b710239ba',_binary '','${role_view-profile}','view-profile','master','1288ec7b-6f3d-429e-b43e-2e0b710239ba',NULL),('eb01e416-d8d8-48cb-96d4-a5a526fbf81a','hi-therapist',_binary '\0',NULL,'submit_questionnaire_answer','hi-therapist',NULL,'hi-therapist'),('ebdb7e9c-5c47-4c4e-8a34-4c1f48cbf3dd','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_view-events}','view-events','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('ed10bdfe-d49f-40ac-8eb3-88281e25b79e','hi-therapist',_binary '\0',NULL,'view_report','hi-therapist',NULL,'hi-therapist'),('eeebc61d-8128-4e4c-8a8f-e27796a714d4','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_manage-events}','manage-events','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('ef88978c-6262-4102-a8b9-4e2cc8a4344a','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_query-users}','query-users','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('efba8528-db6b-44f6-a982-8b9e095d3927','ead46d75-3ebd-458d-8d9a-8df75b027507',_binary '','${role_realm-admin}','realm-admin','hi-therapist','ead46d75-3ebd-458d-8d9a-8df75b027507',NULL),('f1d49e6b-b815-4574-908e-0bc24d1c180a','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_query-groups}','query-groups','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('f20b2e08-0240-4cf4-b36a-a878c5318b2b','55c52d92-7f2e-40b2-8cef-35e558d2c72b',_binary '','${role_view-applications}','view-applications','hi','55c52d92-7f2e-40b2-8cef-35e558d2c72b',NULL),('f58d490b-4960-4ca7-bd77-55a7cf944b99','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_query-clients}','query-clients','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('f5dbedbe-8f75-4d1d-8cef-888c8c59bf54','hi-therapist',_binary '\0',NULL,'input_goal_progress','hi-therapist',NULL,'hi-therapist'),('f63f40a3-dd78-4321-afec-85ecb708fc2d','a46e6bdc-8a4f-4501-897d-efe09b633126',_binary '','${role_view-users}','view-users','master','a46e6bdc-8a4f-4501-897d-efe09b633126',NULL),('f885a621-175f-4a11-88ac-9d3f778b4920','hi-therapist',_binary '\0',NULL,'message_call_between_therapist_patient','hi-therapist',NULL,'hi-therapist'),('fb4125e3-a3e4-4078-a7d4-1e45370023c1','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',_binary '','${role_view-consent}','view-consent','hi-library','dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c',NULL),('fb46403d-6bd8-43ef-8a34-d4b177c7134d','0ae8de67-23f4-49b2-8672-75bb2dedc900',_binary '','${role_view-realm}','view-realm','hi-library','0ae8de67-23f4-49b2-8672-75bb2dedc900',NULL),('fb6e7bfd-6ce2-477c-b266-25c4d868a488','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',_binary '','${role_impersonation}','impersonation','master','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',NULL),('fb76d28f-756e-4bee-aa0d-e3101875df75','hi-therapist',_binary '\0','Able to CRUD the global admin user','manage_global_admin','hi-therapist',NULL,'hi-therapist'),('fe93dcf8-c4df-4d75-b7ff-dd6f9d572d87','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_manage-identity-providers}','manage-identity-providers','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL),('ff1e6b33-140c-4b0b-bb87-06e08f2f1fcb','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',_binary '','${role_manage-events}','manage-events','master','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',NULL);
/*!40000 ALTER TABLE `KEYCLOAK_ROLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MIGRATION_MODEL`
--

DROP TABLE IF EXISTS `MIGRATION_MODEL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VERSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `UPDATE_TIME` bigint NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  KEY `IDX_UPDATE_TIME` (`UPDATE_TIME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MIGRATION_MODEL`
--

LOCK TABLES `MIGRATION_MODEL` WRITE;
/*!40000 ALTER TABLE `MIGRATION_MODEL` DISABLE KEYS */;
INSERT INTO `MIGRATION_MODEL` VALUES ('0ndlk','11.0.3',1666173246);
/*!40000 ALTER TABLE `MIGRATION_MODEL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_CLIENT_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OFFLINE_FLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TIMESTAMP` int DEFAULT NULL,
  `DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `CLIENT_STORAGE_PROVIDER` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'local',
  PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_CLIENT_SESSION`
--

LOCK TABLES `OFFLINE_CLIENT_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_CLIENT_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

DROP TABLE IF EXISTS `OFFLINE_USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_ON` int NOT NULL,
  `OFFLINE_FLAG` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DATA` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `LAST_SESSION_REFRESH` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OFFLINE_USER_SESSION`
--

LOCK TABLES `OFFLINE_USER_SESSION` WRITE;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `OFFLINE_USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `POLICY_CONFIG`
--

DROP TABLE IF EXISTS `POLICY_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`POLICY_ID`,`NAME`),
  CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `POLICY_CONFIG`
--

LOCK TABLES `POLICY_CONFIG` WRITE;
/*!40000 ALTER TABLE `POLICY_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `POLICY_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`),
  CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER`
--

LOCK TABLES `PROTOCOL_MAPPER` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER` VALUES ('006df7f3-db14-4b30-bbb2-de147bde0122','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'f8b8a1e5-c804-4695-b5b1-35c66ddbabee'),('0325562f-9938-4c05-9bc1-5e68fa717a42','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'815f7fe2-91f6-474c-ba61-a72d19605316'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('096ca0ed-f271-47b3-84a6-18d924575aa7','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c3bdc03-95db-4a61-833f-d816bc6d702c'),('09752ae6-e227-42a6-a0b7-f1b3535fe89e','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'0a0dc4b2-5723-473a-97ee-ebb0050602c7'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','locale','openid-connect','oidc-usermodel-attribute-mapper','5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0',NULL),('115d48de-d73e-4a75-be15-813f8794f05c','email','openid-connect','oidc-usermodel-property-mapper',NULL,'815f7fe2-91f6-474c-ba61-a72d19605316'),('131bd228-0aa8-4f4f-a803-dae8934e4430','username','openid-connect','oidc-usermodel-property-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('1593fa24-8a33-4eeb-acbb-2b8b97abd004','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'41cca0ba-533b-45a7-99c1-8b4ecf149f06'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5610c6b0-c1a2-4482-a1b8-d337404da618'),('198063ba-d18a-483e-8c5c-06361e4b61ae','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('19d50c57-f8ea-4609-8af2-b7cbe9c166a2','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'176332ca-d883-4329-a9d4-68884a7c275e'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('1f88e620-e06c-4b8c-90ca-80b3d4c4e946','full name','openid-connect','oidc-full-name-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('235604a1-f400-4ad5-846c-fe6488996e95','audience resolve','openid-connect','oidc-audience-resolve-mapper','af07419a-9fdd-48f8-bb86-98deababeb5d',NULL),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('2edc67a4-d6ca-40c1-ab1d-9755cbfc964e','full name','openid-connect','oidc-full-name-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('2fccc0e1-960f-4a02-b324-26730253693f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','email','openid-connect','oidc-usermodel-property-mapper',NULL,'77249e04-e2d2-4031-9667-8786a866947c'),('31a4b671-cda0-43b3-bb40-dd49af57e755','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'77249e04-e2d2-4031-9667-8786a866947c'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'8c3bdc03-95db-4a61-833f-d816bc6d702c'),('3a823928-d589-4b70-b9ff-dedac139acc7','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'5753f684-aa1d-4cc0-88aa-98a2f0cab3af'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'ee7ace46-13d6-42c2-9718-1c0cbd9418a8'),('3fc458c5-2cea-45ea-8900-3530eaab9307','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'c32f9638-55d0-4d5a-a3fb-feb682bc420c'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('44197f4e-2f1b-46c9-aab1-417cf632acba','address','openid-connect','oidc-address-mapper',NULL,'04f47a6c-8d2b-415f-be78-80d855e614a8'),('4433784e-2995-42f7-9975-103a472b9cdf','full name','openid-connect','oidc-full-name-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('44b10a86-9368-427f-a595-a308956637f4','role list','saml','saml-role-list-mapper',NULL,'c860f1d3-2172-40b1-9ce2-84911e6a17a9'),('47e11601-6ddd-4294-9718-11ad2de3f79a','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4072c001-f7e7-4fa4-9f9f-0f099a308dfe'),('48b0b514-addb-4eef-9226-649ad9da816d','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('48f1f00f-b3a6-451c-b258-0e1661e745ea','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'91926bc4-0204-43c3-a034-67e94de06f80'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','given name','openid-connect','oidc-usermodel-property-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('4fa4652e-e530-458a-8419-f08e1d48c283','role list','saml','saml-role-list-mapper',NULL,'fedf7ec0-e80f-4336-a9b1-17e8bf4c7b71'),('5710c814-8c1b-4aa6-9082-4d9364c67951','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'ee7ace46-13d6-42c2-9718-1c0cbd9418a8'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('5739cb2d-e908-40b7-b04d-eddf6e024567','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','username','openid-connect','oidc-usermodel-property-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('5b42761a-a309-4dfe-a4d1-82d5834e5b01','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'0a0dc4b2-5723-473a-97ee-ebb0050602c7'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('61736adc-05ad-42ad-b0ce-f8787dd4b476','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'30fc52ff-ab28-4569-92e2-26fe8f73626c'),('68bc5ecd-9b4c-44e0-aafa-cbed318f3a89','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0d783cca-c3a4-4d95-ab32-82551105367e'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'95552cf7-ce2a-4b2d-a8cc-6595013f1e87'),('6b278229-0181-4fc4-b4c9-a80f5218a124','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'90332860-b400-4df0-b3a0-5ddee0d59319'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('6b69c55c-b041-425e-b771-15990ccaef1f','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('6d4467b4-3bf6-40b6-9fce-d82f2863c74e','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'0d783cca-c3a4-4d95-ab32-82551105367e'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','locale','openid-connect','oidc-usermodel-attribute-mapper','b53a1923-71b3-4fbf-be97-b1573d596e47',NULL),('70d7e45d-b13b-444a-ae75-d8f6536558cf','audience resolve','openid-connect','oidc-audience-resolve-mapper','77e9c98b-7058-4d56-ba7d-a742ef5e4e53',NULL),('76383b8f-1a73-4948-afd4-62e04c8581e1','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('76ebb615-67ff-4932-82fd-068a96debe79','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('81719cf9-dcb4-4804-9427-c0d34073a261','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('89d9ac7b-1360-42eb-8eb1-d0cdfc29b8b6','role list','saml','saml-role-list-mapper',NULL,'b8ee5766-81f3-4388-a09d-ccbd286cc542'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','groups','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'f8b8a1e5-c804-4695-b5b1-35c66ddbabee'),('9077b7ef-ecb9-49f9-a70e-c4f901a0a6df','audience resolve','openid-connect','oidc-audience-resolve-mapper','1d1424ea-24c6-4434-b5e5-8e96e26f3255',NULL),('95898375-85c2-4f64-9e07-9c0167f1abba','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'356d3968-262b-4bee-8d44-0d93e880b01a'),('958ba9e1-0bd0-4495-9e17-3bbd61c8e970','role list','saml','saml-role-list-mapper',NULL,'76bd20ff-2540-4fb2-b91f-f1b9ec78c9d0'),('96211100-9f9c-4d9a-8749-1d248f69d421','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'4072c001-f7e7-4fa4-9f9f-0f099a308dfe'),('96eadbc7-0864-40ca-9243-f3deeb6615c4','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'91926bc4-0204-43c3-a034-67e94de06f80'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','email verified','openid-connect','oidc-usermodel-property-mapper',NULL,'f070e008-1bf3-4354-9566-af729276ee3e'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','address','openid-connect','oidc-address-mapper',NULL,'4d7db1a2-1bb6-4104-801b-ea18bd31d25e'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','email','openid-connect','oidc-usermodel-property-mapper',NULL,'5753f684-aa1d-4cc0-88aa-98a2f0cab3af'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'95552cf7-ce2a-4b2d-a8cc-6595013f1e87'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','family name','openid-connect','oidc-usermodel-property-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','email','openid-connect','oidc-usermodel-property-mapper',NULL,'f070e008-1bf3-4354-9566-af729276ee3e'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','phone number verified','openid-connect','oidc-usermodel-attribute-mapper',NULL,'5610c6b0-c1a2-4482-a1b8-d337404da618'),('a5bb2b95-0c4a-44a1-88de-dfbfff6af5d4','audience resolve','openid-connect','oidc-audience-resolve-mapper','63f568e6-51bc-4bbe-9fb4-1dcf570d09a4',NULL),('a7af676a-3789-448d-856d-e05f9e8da7ac','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('a7dfdc24-e978-4324-a549-66d791b39e08','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','phone number','openid-connect','oidc-usermodel-attribute-mapper',NULL,'90332860-b400-4df0-b3a0-5ddee0d59319'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('b11141a7-cae8-4dc1-8e0a-d105dd1d3716','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'41cca0ba-533b-45a7-99c1-8b4ecf149f06'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','username','openid-connect','oidc-usermodel-property-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','upn','openid-connect','oidc-usermodel-property-mapper',NULL,'c32f9638-55d0-4d5a-a3fb-feb682bc420c'),('bc63dd6f-b404-4819-97e1-97bc5427f777','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('bd321e4c-74d3-4028-a5c0-10dcc7157cc1','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'91926bc4-0204-43c3-a034-67e94de06f80'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','locale','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('be118bec-e679-4e70-aee1-7703b4050dd8','full name','openid-connect','oidc-full-name-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','address','openid-connect','oidc-address-mapper',NULL,'5f41c2f9-c719-41e9-bfb2-8e34ba8d89e1'),('cc5b8a35-d901-4796-aa54-aa293be0928d','audience resolve','openid-connect','oidc-audience-resolve-mapper',NULL,'0d783cca-c3a4-4d95-ab32-82551105367e'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','address','openid-connect','oidc-address-mapper',NULL,'467375c3-0f8a-490f-b105-0bb44c15a518'),('cecc87dc-098b-4511-bf83-31e3f775ef23','realm roles','openid-connect','oidc-usermodel-realm-role-mapper',NULL,'0a0dc4b2-5723-473a-97ee-ebb0050602c7'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','nickname','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','locale','openid-connect','oidc-usermodel-attribute-mapper','d84f18c2-b355-4a93-893b-a886e0b8fcf2',NULL),('d6160b92-64a3-46fa-be76-4a14ae3b5107','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('d62b6e6b-99b5-412e-a53b-b496d9059733','gender','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','birthdate','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('de7cae8a-0085-488b-bafd-df92884f3a06','allowed web origins','openid-connect','oidc-allowed-origins-mapper',NULL,'433a8036-5c4d-4675-a59e-2ac046db7713'),('dfd01dfc-b19c-4643-bd57-209d003f4980','locale','openid-connect','oidc-usermodel-attribute-mapper','cb884845-e614-4c6e-9508-6fd6ae87fd60',NULL),('e149ff65-9268-4d44-8d6d-fd850788b1f8','username','openid-connect','oidc-usermodel-property-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','picture','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('e3dada28-c2ac-4413-a52b-62e55e41d800','client roles','openid-connect','oidc-usermodel-client-role-mapper',NULL,'41cca0ba-533b-45a7-99c1-8b4ecf149f06'),('e641f464-24e8-4494-bf28-3e0355b5e746','middle name','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'3617b695-9239-4d20-9271-32aa00a4825a'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','profile','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea'),('f16fe40a-855b-4be0-b340-60407b6b4699','zoneinfo','openid-connect','oidc-usermodel-attribute-mapper',NULL,'c81a0d08-591a-4602-9ef1-9acbd7902e86'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','website','openid-connect','oidc-usermodel-attribute-mapper',NULL,'2a8bc487-583c-43dc-8d29-1ad0950d438b'),('fdbc37ba-f5d2-445d-8316-7094f279200f','updated at','openid-connect','oidc-usermodel-attribute-mapper',NULL,'63210a8a-0008-4908-a26e-c374667cf2ea');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `PROTOCOL_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PROTOCOL_MAPPER_CONFIG`
--

LOCK TABLES `PROTOCOL_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` DISABLE KEYS */;
INSERT INTO `PROTOCOL_MAPPER_CONFIG` VALUES ('006df7f3-db14-4b30-bbb2-de147bde0122','true','access.token.claim'),('006df7f3-db14-4b30-bbb2-de147bde0122','upn','claim.name'),('006df7f3-db14-4b30-bbb2-de147bde0122','true','id.token.claim'),('006df7f3-db14-4b30-bbb2-de147bde0122','String','jsonType.label'),('006df7f3-db14-4b30-bbb2-de147bde0122','username','user.attribute'),('006df7f3-db14-4b30-bbb2-de147bde0122','true','userinfo.token.claim'),('0325562f-9938-4c05-9bc1-5e68fa717a42','true','access.token.claim'),('0325562f-9938-4c05-9bc1-5e68fa717a42','email_verified','claim.name'),('0325562f-9938-4c05-9bc1-5e68fa717a42','true','id.token.claim'),('0325562f-9938-4c05-9bc1-5e68fa717a42','boolean','jsonType.label'),('0325562f-9938-4c05-9bc1-5e68fa717a42','emailVerified','user.attribute'),('0325562f-9938-4c05-9bc1-5e68fa717a42','true','userinfo.token.claim'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','true','access.token.claim'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','family_name','claim.name'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','true','id.token.claim'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','String','jsonType.label'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','lastName','user.attribute'),('037b7484-2d7a-4965-9f11-e9df8f2196a3','true','userinfo.token.claim'),('096ca0ed-f271-47b3-84a6-18d924575aa7','true','access.token.claim'),('096ca0ed-f271-47b3-84a6-18d924575aa7','phone_number','claim.name'),('096ca0ed-f271-47b3-84a6-18d924575aa7','true','id.token.claim'),('096ca0ed-f271-47b3-84a6-18d924575aa7','String','jsonType.label'),('096ca0ed-f271-47b3-84a6-18d924575aa7','phoneNumber','user.attribute'),('096ca0ed-f271-47b3-84a6-18d924575aa7','true','userinfo.token.claim'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','true','access.token.claim'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','locale','claim.name'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','true','id.token.claim'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','String','jsonType.label'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','locale','user.attribute'),('0fab5b8a-16c6-4ace-ba0c-80c5b724989a','true','userinfo.token.claim'),('115d48de-d73e-4a75-be15-813f8794f05c','true','access.token.claim'),('115d48de-d73e-4a75-be15-813f8794f05c','email','claim.name'),('115d48de-d73e-4a75-be15-813f8794f05c','true','id.token.claim'),('115d48de-d73e-4a75-be15-813f8794f05c','String','jsonType.label'),('115d48de-d73e-4a75-be15-813f8794f05c','email','user.attribute'),('115d48de-d73e-4a75-be15-813f8794f05c','true','userinfo.token.claim'),('131bd228-0aa8-4f4f-a803-dae8934e4430','true','access.token.claim'),('131bd228-0aa8-4f4f-a803-dae8934e4430','preferred_username','claim.name'),('131bd228-0aa8-4f4f-a803-dae8934e4430','true','id.token.claim'),('131bd228-0aa8-4f4f-a803-dae8934e4430','String','jsonType.label'),('131bd228-0aa8-4f4f-a803-dae8934e4430','username','user.attribute'),('131bd228-0aa8-4f4f-a803-dae8934e4430','true','userinfo.token.claim'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','true','access.token.claim'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','gender','claim.name'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','true','id.token.claim'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','String','jsonType.label'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','gender','user.attribute'),('13479da2-7a14-49a5-a36c-9fe1b1f49559','true','userinfo.token.claim'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','true','access.token.claim'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','phone_number','claim.name'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','true','id.token.claim'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','String','jsonType.label'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','phoneNumber','user.attribute'),('17c751cb-aff5-42c7-9b5d-73eecb1f94dd','true','userinfo.token.claim'),('198063ba-d18a-483e-8c5c-06361e4b61ae','true','access.token.claim'),('198063ba-d18a-483e-8c5c-06361e4b61ae','picture','claim.name'),('198063ba-d18a-483e-8c5c-06361e4b61ae','true','id.token.claim'),('198063ba-d18a-483e-8c5c-06361e4b61ae','String','jsonType.label'),('198063ba-d18a-483e-8c5c-06361e4b61ae','picture','user.attribute'),('198063ba-d18a-483e-8c5c-06361e4b61ae','true','userinfo.token.claim'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','true','access.token.claim'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','profile','claim.name'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','true','id.token.claim'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','String','jsonType.label'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','profile','user.attribute'),('1aa58698-76dd-4113-8161-cae0fe90cb1a','true','userinfo.token.claim'),('1f88e620-e06c-4b8c-90ca-80b3d4c4e946','true','access.token.claim'),('1f88e620-e06c-4b8c-90ca-80b3d4c4e946','true','id.token.claim'),('1f88e620-e06c-4b8c-90ca-80b3d4c4e946','true','userinfo.token.claim'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','true','access.token.claim'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','locale','claim.name'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','true','id.token.claim'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','String','jsonType.label'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','locale','user.attribute'),('21c787c2-3e60-4a3c-aa47-72078daf1a3c','true','userinfo.token.claim'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','true','access.token.claim'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','nickname','claim.name'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','true','id.token.claim'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','String','jsonType.label'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','nickname','user.attribute'),('21d400d1-75ad-4e66-95e5-206ea1d2a49f','true','userinfo.token.claim'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','true','access.token.claim'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','given_name','claim.name'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','true','id.token.claim'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','String','jsonType.label'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','firstName','user.attribute'),('2324eae2-7402-4ad4-ad51-bb469eb3982e','true','userinfo.token.claim'),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','true','access.token.claim'),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','zoneinfo','claim.name'),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','true','id.token.claim'),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','String','jsonType.label'),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','zoneinfo','user.attribute'),('2767f0f8-c8e0-4aba-99bd-683d158c9a35','true','userinfo.token.claim'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','true','access.token.claim'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','nickname','claim.name'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','true','id.token.claim'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','String','jsonType.label'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','nickname','user.attribute'),('29f6f61d-61cf-4ace-9278-dd69d1b73112','true','userinfo.token.claim'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','true','access.token.claim'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','given_name','claim.name'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','true','id.token.claim'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','String','jsonType.label'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','firstName','user.attribute'),('2ba97f11-a3bb-4a2c-8542-db5429eb7813','true','userinfo.token.claim'),('2edc67a4-d6ca-40c1-ab1d-9755cbfc964e','true','access.token.claim'),('2edc67a4-d6ca-40c1-ab1d-9755cbfc964e','true','id.token.claim'),('2edc67a4-d6ca-40c1-ab1d-9755cbfc964e','true','userinfo.token.claim'),('2fccc0e1-960f-4a02-b324-26730253693f','true','access.token.claim'),('2fccc0e1-960f-4a02-b324-26730253693f','updated_at','claim.name'),('2fccc0e1-960f-4a02-b324-26730253693f','true','id.token.claim'),('2fccc0e1-960f-4a02-b324-26730253693f','String','jsonType.label'),('2fccc0e1-960f-4a02-b324-26730253693f','updatedAt','user.attribute'),('2fccc0e1-960f-4a02-b324-26730253693f','true','userinfo.token.claim'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','true','access.token.claim'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','email','claim.name'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','true','id.token.claim'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','String','jsonType.label'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','email','user.attribute'),('30b414b5-01ed-4cd0-866f-c3edc937bb9a','true','userinfo.token.claim'),('31a4b671-cda0-43b3-bb40-dd49af57e755','true','access.token.claim'),('31a4b671-cda0-43b3-bb40-dd49af57e755','family_name','claim.name'),('31a4b671-cda0-43b3-bb40-dd49af57e755','true','id.token.claim'),('31a4b671-cda0-43b3-bb40-dd49af57e755','String','jsonType.label'),('31a4b671-cda0-43b3-bb40-dd49af57e755','lastName','user.attribute'),('31a4b671-cda0-43b3-bb40-dd49af57e755','true','userinfo.token.claim'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','true','access.token.claim'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','email_verified','claim.name'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','true','id.token.claim'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','boolean','jsonType.label'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','emailVerified','user.attribute'),('330b1fd6-41da-4693-9a5c-f60a5a76d055','true','userinfo.token.claim'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','true','access.token.claim'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','nickname','claim.name'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','true','id.token.claim'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','String','jsonType.label'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','nickname','user.attribute'),('340c09f2-d529-4f0a-9ba9-d43989e121d5','true','userinfo.token.claim'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','true','access.token.claim'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','phone_number_verified','claim.name'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','true','id.token.claim'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','boolean','jsonType.label'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','phoneNumberVerified','user.attribute'),('36f43a1f-7960-4b1e-9fad-cb0a9b958015','true','userinfo.token.claim'),('3a823928-d589-4b70-b9ff-dedac139acc7','true','access.token.claim'),('3a823928-d589-4b70-b9ff-dedac139acc7','email_verified','claim.name'),('3a823928-d589-4b70-b9ff-dedac139acc7','true','id.token.claim'),('3a823928-d589-4b70-b9ff-dedac139acc7','boolean','jsonType.label'),('3a823928-d589-4b70-b9ff-dedac139acc7','emailVerified','user.attribute'),('3a823928-d589-4b70-b9ff-dedac139acc7','true','userinfo.token.claim'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','true','access.token.claim'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','groups','claim.name'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','true','id.token.claim'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','String','jsonType.label'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','true','multivalued'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','foo','user.attribute'),('3b165070-481a-4bfd-a16e-acb2a7987ed9','true','userinfo.token.claim'),('3fc458c5-2cea-45ea-8900-3530eaab9307','true','access.token.claim'),('3fc458c5-2cea-45ea-8900-3530eaab9307','groups','claim.name'),('3fc458c5-2cea-45ea-8900-3530eaab9307','true','id.token.claim'),('3fc458c5-2cea-45ea-8900-3530eaab9307','String','jsonType.label'),('3fc458c5-2cea-45ea-8900-3530eaab9307','true','multivalued'),('3fc458c5-2cea-45ea-8900-3530eaab9307','foo','user.attribute'),('3fc458c5-2cea-45ea-8900-3530eaab9307','true','userinfo.token.claim'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','true','access.token.claim'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','given_name','claim.name'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','true','id.token.claim'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','String','jsonType.label'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','firstName','user.attribute'),('4182c471-c41f-4d0b-ae8a-4135ebb175cb','true','userinfo.token.claim'),('44197f4e-2f1b-46c9-aab1-417cf632acba','true','access.token.claim'),('44197f4e-2f1b-46c9-aab1-417cf632acba','true','id.token.claim'),('44197f4e-2f1b-46c9-aab1-417cf632acba','country','user.attribute.country'),('44197f4e-2f1b-46c9-aab1-417cf632acba','formatted','user.attribute.formatted'),('44197f4e-2f1b-46c9-aab1-417cf632acba','locality','user.attribute.locality'),('44197f4e-2f1b-46c9-aab1-417cf632acba','postal_code','user.attribute.postal_code'),('44197f4e-2f1b-46c9-aab1-417cf632acba','region','user.attribute.region'),('44197f4e-2f1b-46c9-aab1-417cf632acba','street','user.attribute.street'),('44197f4e-2f1b-46c9-aab1-417cf632acba','true','userinfo.token.claim'),('4433784e-2995-42f7-9975-103a472b9cdf','true','access.token.claim'),('4433784e-2995-42f7-9975-103a472b9cdf','true','id.token.claim'),('4433784e-2995-42f7-9975-103a472b9cdf','true','userinfo.token.claim'),('44b10a86-9368-427f-a595-a308956637f4','Role','attribute.name'),('44b10a86-9368-427f-a595-a308956637f4','Basic','attribute.nameformat'),('44b10a86-9368-427f-a595-a308956637f4','false','single'),('47e11601-6ddd-4294-9718-11ad2de3f79a','true','access.token.claim'),('47e11601-6ddd-4294-9718-11ad2de3f79a','phone_number_verified','claim.name'),('47e11601-6ddd-4294-9718-11ad2de3f79a','true','id.token.claim'),('47e11601-6ddd-4294-9718-11ad2de3f79a','boolean','jsonType.label'),('47e11601-6ddd-4294-9718-11ad2de3f79a','phoneNumberVerified','user.attribute'),('47e11601-6ddd-4294-9718-11ad2de3f79a','true','userinfo.token.claim'),('48b0b514-addb-4eef-9226-649ad9da816d','true','access.token.claim'),('48b0b514-addb-4eef-9226-649ad9da816d','updated_at','claim.name'),('48b0b514-addb-4eef-9226-649ad9da816d','true','id.token.claim'),('48b0b514-addb-4eef-9226-649ad9da816d','String','jsonType.label'),('48b0b514-addb-4eef-9226-649ad9da816d','updatedAt','user.attribute'),('48b0b514-addb-4eef-9226-649ad9da816d','true','userinfo.token.claim'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','true','access.token.claim'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','given_name','claim.name'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','true','id.token.claim'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','String','jsonType.label'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','firstName','user.attribute'),('4bbd70f2-774a-456f-85bc-cd75b0e64d42','true','userinfo.token.claim'),('4fa4652e-e530-458a-8419-f08e1d48c283','Role','attribute.name'),('4fa4652e-e530-458a-8419-f08e1d48c283','Basic','attribute.nameformat'),('4fa4652e-e530-458a-8419-f08e1d48c283','false','single'),('5710c814-8c1b-4aa6-9082-4d9364c67951','true','access.token.claim'),('5710c814-8c1b-4aa6-9082-4d9364c67951','upn','claim.name'),('5710c814-8c1b-4aa6-9082-4d9364c67951','true','id.token.claim'),('5710c814-8c1b-4aa6-9082-4d9364c67951','String','jsonType.label'),('5710c814-8c1b-4aa6-9082-4d9364c67951','username','user.attribute'),('5710c814-8c1b-4aa6-9082-4d9364c67951','true','userinfo.token.claim'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','true','access.token.claim'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','middle_name','claim.name'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','true','id.token.claim'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','String','jsonType.label'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','middleName','user.attribute'),('571fa7da-4f61-4c58-84a2-ee8bba9320bc','true','userinfo.token.claim'),('5739cb2d-e908-40b7-b04d-eddf6e024567','true','access.token.claim'),('5739cb2d-e908-40b7-b04d-eddf6e024567','family_name','claim.name'),('5739cb2d-e908-40b7-b04d-eddf6e024567','true','id.token.claim'),('5739cb2d-e908-40b7-b04d-eddf6e024567','String','jsonType.label'),('5739cb2d-e908-40b7-b04d-eddf6e024567','lastName','user.attribute'),('5739cb2d-e908-40b7-b04d-eddf6e024567','true','userinfo.token.claim'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','true','access.token.claim'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','preferred_username','claim.name'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','true','id.token.claim'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','String','jsonType.label'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','username','user.attribute'),('5a3e40aa-5988-4a7c-b03f-1ea561d30ec1','true','userinfo.token.claim'),('5b42761a-a309-4dfe-a4d1-82d5834e5b01','true','access.token.claim'),('5b42761a-a309-4dfe-a4d1-82d5834e5b01','resource_access.${client_id}.roles','claim.name'),('5b42761a-a309-4dfe-a4d1-82d5834e5b01','String','jsonType.label'),('5b42761a-a309-4dfe-a4d1-82d5834e5b01','true','multivalued'),('5b42761a-a309-4dfe-a4d1-82d5834e5b01','foo','user.attribute'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','true','access.token.claim'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','birthdate','claim.name'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','true','id.token.claim'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','String','jsonType.label'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','birthdate','user.attribute'),('5c826d24-7138-4d8f-b415-92b3d3a1d463','true','userinfo.token.claim'),('68bc5ecd-9b4c-44e0-aafa-cbed318f3a89','true','access.token.claim'),('68bc5ecd-9b4c-44e0-aafa-cbed318f3a89','realm_access.roles','claim.name'),('68bc5ecd-9b4c-44e0-aafa-cbed318f3a89','String','jsonType.label'),('68bc5ecd-9b4c-44e0-aafa-cbed318f3a89','true','multivalued'),('68bc5ecd-9b4c-44e0-aafa-cbed318f3a89','foo','user.attribute'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','true','access.token.claim'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','groups','claim.name'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','true','id.token.claim'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','String','jsonType.label'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','true','multivalued'),('6978ec5a-7cd3-46d9-9362-60eeadefde2f','foo','user.attribute'),('6b278229-0181-4fc4-b4c9-a80f5218a124','true','access.token.claim'),('6b278229-0181-4fc4-b4c9-a80f5218a124','phone_number_verified','claim.name'),('6b278229-0181-4fc4-b4c9-a80f5218a124','true','id.token.claim'),('6b278229-0181-4fc4-b4c9-a80f5218a124','boolean','jsonType.label'),('6b278229-0181-4fc4-b4c9-a80f5218a124','phoneNumberVerified','user.attribute'),('6b278229-0181-4fc4-b4c9-a80f5218a124','true','userinfo.token.claim'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','true','access.token.claim'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','website','claim.name'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','true','id.token.claim'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','String','jsonType.label'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','website','user.attribute'),('6b301df0-831e-4aec-ae1e-e12d055d5b81','true','userinfo.token.claim'),('6b69c55c-b041-425e-b771-15990ccaef1f','true','access.token.claim'),('6b69c55c-b041-425e-b771-15990ccaef1f','picture','claim.name'),('6b69c55c-b041-425e-b771-15990ccaef1f','true','id.token.claim'),('6b69c55c-b041-425e-b771-15990ccaef1f','String','jsonType.label'),('6b69c55c-b041-425e-b771-15990ccaef1f','picture','user.attribute'),('6b69c55c-b041-425e-b771-15990ccaef1f','true','userinfo.token.claim'),('6d4467b4-3bf6-40b6-9fce-d82f2863c74e','true','access.token.claim'),('6d4467b4-3bf6-40b6-9fce-d82f2863c74e','resource_access.${client_id}.roles','claim.name'),('6d4467b4-3bf6-40b6-9fce-d82f2863c74e','String','jsonType.label'),('6d4467b4-3bf6-40b6-9fce-d82f2863c74e','true','multivalued'),('6d4467b4-3bf6-40b6-9fce-d82f2863c74e','foo','user.attribute'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','true','access.token.claim'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','gender','claim.name'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','true','id.token.claim'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','String','jsonType.label'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','gender','user.attribute'),('6d6d50b8-cd32-40a4-b07b-0eb7c5a0a8c7','true','userinfo.token.claim'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','true','access.token.claim'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','locale','claim.name'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','true','id.token.claim'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','String','jsonType.label'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','locale','user.attribute'),('6f65adeb-29a0-4a55-994e-5d8db85fa374','true','userinfo.token.claim'),('76383b8f-1a73-4948-afd4-62e04c8581e1','true','access.token.claim'),('76383b8f-1a73-4948-afd4-62e04c8581e1','middle_name','claim.name'),('76383b8f-1a73-4948-afd4-62e04c8581e1','true','id.token.claim'),('76383b8f-1a73-4948-afd4-62e04c8581e1','String','jsonType.label'),('76383b8f-1a73-4948-afd4-62e04c8581e1','middleName','user.attribute'),('76383b8f-1a73-4948-afd4-62e04c8581e1','true','userinfo.token.claim'),('76ebb615-67ff-4932-82fd-068a96debe79','true','access.token.claim'),('76ebb615-67ff-4932-82fd-068a96debe79','website','claim.name'),('76ebb615-67ff-4932-82fd-068a96debe79','true','id.token.claim'),('76ebb615-67ff-4932-82fd-068a96debe79','String','jsonType.label'),('76ebb615-67ff-4932-82fd-068a96debe79','website','user.attribute'),('76ebb615-67ff-4932-82fd-068a96debe79','true','userinfo.token.claim'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','true','access.token.claim'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','locale','claim.name'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','true','id.token.claim'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','String','jsonType.label'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','locale','user.attribute'),('80c245ea-7a32-48da-a1b7-5c0ab5663c7a','true','userinfo.token.claim'),('81719cf9-dcb4-4804-9427-c0d34073a261','true','access.token.claim'),('81719cf9-dcb4-4804-9427-c0d34073a261','updated_at','claim.name'),('81719cf9-dcb4-4804-9427-c0d34073a261','true','id.token.claim'),('81719cf9-dcb4-4804-9427-c0d34073a261','String','jsonType.label'),('81719cf9-dcb4-4804-9427-c0d34073a261','updatedAt','user.attribute'),('81719cf9-dcb4-4804-9427-c0d34073a261','true','userinfo.token.claim'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','true','access.token.claim'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','locale','claim.name'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','true','id.token.claim'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','String','jsonType.label'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','locale','user.attribute'),('82d96572-c3fe-4f6a-aea2-efa45c566fe5','true','userinfo.token.claim'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','true','access.token.claim'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','profile','claim.name'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','true','id.token.claim'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','String','jsonType.label'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','profile','user.attribute'),('85fea67a-1bc0-4958-b78f-69f103c3b80d','true','userinfo.token.claim'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','true','access.token.claim'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','birthdate','claim.name'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','true','id.token.claim'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','String','jsonType.label'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','birthdate','user.attribute'),('894279b9-16aa-4ebe-b40f-c338bf2a7d92','true','userinfo.token.claim'),('89d9ac7b-1360-42eb-8eb1-d0cdfc29b8b6','Role','attribute.name'),('89d9ac7b-1360-42eb-8eb1-d0cdfc29b8b6','Basic','attribute.nameformat'),('89d9ac7b-1360-42eb-8eb1-d0cdfc29b8b6','false','single'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','true','access.token.claim'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','groups','claim.name'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','true','id.token.claim'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','String','jsonType.label'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','true','multivalued'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','foo','user.attribute'),('8faf4278-9adf-4ea6-ba06-74792a73ed54','true','userinfo.token.claim'),('958ba9e1-0bd0-4495-9e17-3bbd61c8e970','Role','attribute.name'),('958ba9e1-0bd0-4495-9e17-3bbd61c8e970','Basic','attribute.nameformat'),('958ba9e1-0bd0-4495-9e17-3bbd61c8e970','false','single'),('96211100-9f9c-4d9a-8749-1d248f69d421','true','access.token.claim'),('96211100-9f9c-4d9a-8749-1d248f69d421','phone_number','claim.name'),('96211100-9f9c-4d9a-8749-1d248f69d421','true','id.token.claim'),('96211100-9f9c-4d9a-8749-1d248f69d421','String','jsonType.label'),('96211100-9f9c-4d9a-8749-1d248f69d421','phoneNumber','user.attribute'),('96211100-9f9c-4d9a-8749-1d248f69d421','true','userinfo.token.claim'),('96eadbc7-0864-40ca-9243-f3deeb6615c4','true','access.token.claim'),('96eadbc7-0864-40ca-9243-f3deeb6615c4','realm_access.roles','claim.name'),('96eadbc7-0864-40ca-9243-f3deeb6615c4','String','jsonType.label'),('96eadbc7-0864-40ca-9243-f3deeb6615c4','true','multivalued'),('96eadbc7-0864-40ca-9243-f3deeb6615c4','foo','user.attribute'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','true','access.token.claim'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','email_verified','claim.name'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','true','id.token.claim'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','boolean','jsonType.label'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','emailVerified','user.attribute'),('9a84beae-9dab-4a04-ba5c-e4f5117e07f1','true','userinfo.token.claim'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','true','access.token.claim'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','true','id.token.claim'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','country','user.attribute.country'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','formatted','user.attribute.formatted'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','locality','user.attribute.locality'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','postal_code','user.attribute.postal_code'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','region','user.attribute.region'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','street','user.attribute.street'),('9c4bbdd6-ce3e-4db0-8a4a-9cab43631399','true','userinfo.token.claim'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','true','access.token.claim'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','email','claim.name'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','true','id.token.claim'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','String','jsonType.label'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','email','user.attribute'),('9d3d082f-0f51-44a8-a828-7e51381a12cd','true','userinfo.token.claim'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','true','access.token.claim'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','upn','claim.name'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','true','id.token.claim'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','String','jsonType.label'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','username','user.attribute'),('9e88f3bc-7025-4dc0-9231-f209179bfbbc','true','userinfo.token.claim'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','true','access.token.claim'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','family_name','claim.name'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','true','id.token.claim'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','String','jsonType.label'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','lastName','user.attribute'),('9eaea907-8ea0-46c7-b495-921d82af2c8d','true','userinfo.token.claim'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','true','access.token.claim'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','email','claim.name'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','true','id.token.claim'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','String','jsonType.label'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','email','user.attribute'),('9f8e25ef-c1d9-4d9b-87b4-b33d61987fe6','true','userinfo.token.claim'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','true','access.token.claim'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','birthdate','claim.name'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','true','id.token.claim'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','String','jsonType.label'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','birthdate','user.attribute'),('a3967c9d-64b7-4eaa-98a2-f8ae0cf2ddfc','true','userinfo.token.claim'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','true','access.token.claim'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','phone_number_verified','claim.name'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','true','id.token.claim'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','boolean','jsonType.label'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','phoneNumberVerified','user.attribute'),('a57dd606-2daf-4a1b-bd89-d04e0439f8e8','true','userinfo.token.claim'),('a7af676a-3789-448d-856d-e05f9e8da7ac','true','access.token.claim'),('a7af676a-3789-448d-856d-e05f9e8da7ac','middle_name','claim.name'),('a7af676a-3789-448d-856d-e05f9e8da7ac','true','id.token.claim'),('a7af676a-3789-448d-856d-e05f9e8da7ac','String','jsonType.label'),('a7af676a-3789-448d-856d-e05f9e8da7ac','middleName','user.attribute'),('a7af676a-3789-448d-856d-e05f9e8da7ac','true','userinfo.token.claim'),('a7dfdc24-e978-4324-a549-66d791b39e08','true','access.token.claim'),('a7dfdc24-e978-4324-a549-66d791b39e08','gender','claim.name'),('a7dfdc24-e978-4324-a549-66d791b39e08','true','id.token.claim'),('a7dfdc24-e978-4324-a549-66d791b39e08','String','jsonType.label'),('a7dfdc24-e978-4324-a549-66d791b39e08','gender','user.attribute'),('a7dfdc24-e978-4324-a549-66d791b39e08','true','userinfo.token.claim'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','true','access.token.claim'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','phone_number','claim.name'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','true','id.token.claim'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','String','jsonType.label'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','phoneNumber','user.attribute'),('a9f03f70-1836-4ffb-ad00-124c7d1a7bad','true','userinfo.token.claim'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','true','access.token.claim'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','profile','claim.name'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','true','id.token.claim'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','String','jsonType.label'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','profile','user.attribute'),('aaef7709-adaf-4ca4-9e22-da8c5df6eea0','true','userinfo.token.claim'),('b11141a7-cae8-4dc1-8e0a-d105dd1d3716','true','access.token.claim'),('b11141a7-cae8-4dc1-8e0a-d105dd1d3716','realm_access.roles','claim.name'),('b11141a7-cae8-4dc1-8e0a-d105dd1d3716','String','jsonType.label'),('b11141a7-cae8-4dc1-8e0a-d105dd1d3716','true','multivalued'),('b11141a7-cae8-4dc1-8e0a-d105dd1d3716','foo','user.attribute'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','true','access.token.claim'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','preferred_username','claim.name'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','true','id.token.claim'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','String','jsonType.label'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','username','user.attribute'),('b55f3b8e-88c4-4ae5-9178-c8d0df2f82ca','true','userinfo.token.claim'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','true','access.token.claim'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','upn','claim.name'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','true','id.token.claim'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','String','jsonType.label'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','username','user.attribute'),('b97ea8a6-c8cb-42f8-9c81-24ec8ca6a490','true','userinfo.token.claim'),('bc63dd6f-b404-4819-97e1-97bc5427f777','true','access.token.claim'),('bc63dd6f-b404-4819-97e1-97bc5427f777','picture','claim.name'),('bc63dd6f-b404-4819-97e1-97bc5427f777','true','id.token.claim'),('bc63dd6f-b404-4819-97e1-97bc5427f777','String','jsonType.label'),('bc63dd6f-b404-4819-97e1-97bc5427f777','picture','user.attribute'),('bc63dd6f-b404-4819-97e1-97bc5427f777','true','userinfo.token.claim'),('bd321e4c-74d3-4028-a5c0-10dcc7157cc1','true','access.token.claim'),('bd321e4c-74d3-4028-a5c0-10dcc7157cc1','resource_access.${client_id}.roles','claim.name'),('bd321e4c-74d3-4028-a5c0-10dcc7157cc1','String','jsonType.label'),('bd321e4c-74d3-4028-a5c0-10dcc7157cc1','true','multivalued'),('bd321e4c-74d3-4028-a5c0-10dcc7157cc1','foo','user.attribute'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','true','access.token.claim'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','locale','claim.name'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','true','id.token.claim'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','String','jsonType.label'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','locale','user.attribute'),('bd3e6f70-09ca-439a-8fd4-0b5cf8cd4a1a','true','userinfo.token.claim'),('be118bec-e679-4e70-aee1-7703b4050dd8','true','access.token.claim'),('be118bec-e679-4e70-aee1-7703b4050dd8','true','id.token.claim'),('be118bec-e679-4e70-aee1-7703b4050dd8','true','userinfo.token.claim'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','true','access.token.claim'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','true','id.token.claim'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','country','user.attribute.country'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','formatted','user.attribute.formatted'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','locality','user.attribute.locality'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','postal_code','user.attribute.postal_code'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','region','user.attribute.region'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','street','user.attribute.street'),('c59d48a3-b5fa-4faa-9e97-f70644afa8b2','true','userinfo.token.claim'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','true','access.token.claim'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','true','id.token.claim'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','country','user.attribute.country'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','formatted','user.attribute.formatted'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','locality','user.attribute.locality'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','postal_code','user.attribute.postal_code'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','region','user.attribute.region'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','street','user.attribute.street'),('cda7a2f1-ab17-4e79-8af7-51a719c2ee4f','true','userinfo.token.claim'),('cecc87dc-098b-4511-bf83-31e3f775ef23','true','access.token.claim'),('cecc87dc-098b-4511-bf83-31e3f775ef23','realm_access.roles','claim.name'),('cecc87dc-098b-4511-bf83-31e3f775ef23','String','jsonType.label'),('cecc87dc-098b-4511-bf83-31e3f775ef23','true','multivalued'),('cecc87dc-098b-4511-bf83-31e3f775ef23','foo','user.attribute'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','true','access.token.claim'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','nickname','claim.name'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','true','id.token.claim'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','String','jsonType.label'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','nickname','user.attribute'),('d1e1d6bb-7e12-46ac-861e-0b9df2f064e3','true','userinfo.token.claim'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','true','access.token.claim'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','locale','claim.name'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','true','id.token.claim'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','String','jsonType.label'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','locale','user.attribute'),('d216a194-89f0-49b6-90a4-84f23c24f2d5','true','userinfo.token.claim'),('d6160b92-64a3-46fa-be76-4a14ae3b5107','true','access.token.claim'),('d6160b92-64a3-46fa-be76-4a14ae3b5107','website','claim.name'),('d6160b92-64a3-46fa-be76-4a14ae3b5107','true','id.token.claim'),('d6160b92-64a3-46fa-be76-4a14ae3b5107','String','jsonType.label'),('d6160b92-64a3-46fa-be76-4a14ae3b5107','website','user.attribute'),('d6160b92-64a3-46fa-be76-4a14ae3b5107','true','userinfo.token.claim'),('d62b6e6b-99b5-412e-a53b-b496d9059733','true','access.token.claim'),('d62b6e6b-99b5-412e-a53b-b496d9059733','gender','claim.name'),('d62b6e6b-99b5-412e-a53b-b496d9059733','true','id.token.claim'),('d62b6e6b-99b5-412e-a53b-b496d9059733','String','jsonType.label'),('d62b6e6b-99b5-412e-a53b-b496d9059733','gender','user.attribute'),('d62b6e6b-99b5-412e-a53b-b496d9059733','true','userinfo.token.claim'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','true','access.token.claim'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','birthdate','claim.name'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','true','id.token.claim'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','String','jsonType.label'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','birthdate','user.attribute'),('de094ef6-4cb2-4341-ba33-0a5da4b18cc6','true','userinfo.token.claim'),('dfd01dfc-b19c-4643-bd57-209d003f4980','true','access.token.claim'),('dfd01dfc-b19c-4643-bd57-209d003f4980','locale','claim.name'),('dfd01dfc-b19c-4643-bd57-209d003f4980','true','id.token.claim'),('dfd01dfc-b19c-4643-bd57-209d003f4980','String','jsonType.label'),('dfd01dfc-b19c-4643-bd57-209d003f4980','locale','user.attribute'),('dfd01dfc-b19c-4643-bd57-209d003f4980','true','userinfo.token.claim'),('e149ff65-9268-4d44-8d6d-fd850788b1f8','true','access.token.claim'),('e149ff65-9268-4d44-8d6d-fd850788b1f8','preferred_username','claim.name'),('e149ff65-9268-4d44-8d6d-fd850788b1f8','true','id.token.claim'),('e149ff65-9268-4d44-8d6d-fd850788b1f8','String','jsonType.label'),('e149ff65-9268-4d44-8d6d-fd850788b1f8','username','user.attribute'),('e149ff65-9268-4d44-8d6d-fd850788b1f8','true','userinfo.token.claim'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','true','access.token.claim'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','picture','claim.name'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','true','id.token.claim'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','String','jsonType.label'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','picture','user.attribute'),('e224daa6-a8b8-43f3-9d05-073bac90abaf','true','userinfo.token.claim'),('e3dada28-c2ac-4413-a52b-62e55e41d800','true','access.token.claim'),('e3dada28-c2ac-4413-a52b-62e55e41d800','resource_access.${client_id}.roles','claim.name'),('e3dada28-c2ac-4413-a52b-62e55e41d800','String','jsonType.label'),('e3dada28-c2ac-4413-a52b-62e55e41d800','true','multivalued'),('e3dada28-c2ac-4413-a52b-62e55e41d800','foo','user.attribute'),('e641f464-24e8-4494-bf28-3e0355b5e746','true','access.token.claim'),('e641f464-24e8-4494-bf28-3e0355b5e746','middle_name','claim.name'),('e641f464-24e8-4494-bf28-3e0355b5e746','true','id.token.claim'),('e641f464-24e8-4494-bf28-3e0355b5e746','String','jsonType.label'),('e641f464-24e8-4494-bf28-3e0355b5e746','middleName','user.attribute'),('e641f464-24e8-4494-bf28-3e0355b5e746','true','userinfo.token.claim'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','true','access.token.claim'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','zoneinfo','claim.name'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','true','id.token.claim'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','String','jsonType.label'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','zoneinfo','user.attribute'),('eeb735b0-b090-4ed3-8b7e-928fba3192d5','true','userinfo.token.claim'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','true','access.token.claim'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','zoneinfo','claim.name'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','true','id.token.claim'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','String','jsonType.label'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','zoneinfo','user.attribute'),('ef0f0a8b-8ba8-4d32-98c5-cb8dc496514f','true','userinfo.token.claim'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','true','access.token.claim'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','profile','claim.name'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','true','id.token.claim'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','String','jsonType.label'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','profile','user.attribute'),('f0a40ed6-1df2-4037-bd94-f8d13b638fef','true','userinfo.token.claim'),('f16fe40a-855b-4be0-b340-60407b6b4699','true','access.token.claim'),('f16fe40a-855b-4be0-b340-60407b6b4699','zoneinfo','claim.name'),('f16fe40a-855b-4be0-b340-60407b6b4699','true','id.token.claim'),('f16fe40a-855b-4be0-b340-60407b6b4699','String','jsonType.label'),('f16fe40a-855b-4be0-b340-60407b6b4699','zoneinfo','user.attribute'),('f16fe40a-855b-4be0-b340-60407b6b4699','true','userinfo.token.claim'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','true','access.token.claim'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','website','claim.name'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','true','id.token.claim'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','String','jsonType.label'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','website','user.attribute'),('fae5b917-0f41-4c07-a1a0-c717a9d8c4ce','true','userinfo.token.claim'),('fdbc37ba-f5d2-445d-8316-7094f279200f','true','access.token.claim'),('fdbc37ba-f5d2-445d-8316-7094f279200f','updated_at','claim.name'),('fdbc37ba-f5d2-445d-8316-7094f279200f','true','id.token.claim'),('fdbc37ba-f5d2-445d-8316-7094f279200f','String','jsonType.label'),('fdbc37ba-f5d2-445d-8316-7094f279200f','updatedAt','user.attribute'),('fdbc37ba-f5d2-445d-8316-7094f279200f','true','userinfo.token.claim');
/*!40000 ALTER TABLE `PROTOCOL_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM`
--

DROP TABLE IF EXISTS `REALM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ACCESS_CODE_LIFESPAN` int DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ADMIN_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint DEFAULT NULL,
  `LOGIN_THEME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int DEFAULT NULL,
  `PASSWORD_POLICY` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIN_LIFESPAN` int DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int DEFAULT '0',
  `OTP_POLICY_WINDOW` int DEFAULT '1',
  `OTP_POLICY_PERIOD` int DEFAULT '30',
  `OTP_POLICY_DIGITS` int DEFAULT '6',
  `OTP_POLICY_ALG` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int DEFAULT '0',
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int DEFAULT '0',
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int DEFAULT '0',
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM`
--

LOCK TABLES `REALM` WRITE;
/*!40000 ALTER TABLE `REALM` DISABLE KEYS */;
INSERT INTO `REALM` VALUES ('hi',60,300,3600,NULL,NULL,NULL,_binary '',_binary '\0',0,'hi','hi',1608625292,'specialChars(1) and upperCase(1) and lowerCase(1) and length(8)',_binary '\0',_binary '\0',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','98f16bf2-97bb-4489-a7ae-5dc9b260bb61',1800,_binary '','en',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','6af89e7f-9873-400c-a6c3-e2dd7d474e26','9304b278-1ded-4951-9dc0-fbb578c6da2f','9814995c-54b2-4b8d-a29b-7c23042a5841','13e66f72-1319-4946-9991-4207daad9b35','b236e1ef-ac1b-442f-a7e8-814031aabdc6',2592000,_binary '\0',900,_binary '',_binary '\0','3f622d53-72a4-4f89-b928-fb3bdb38d30c',0,_binary '\0',0,0),('hi-library',60,300,300,NULL,NULL,'keycloak',_binary '',_binary '\0',0,'open-library','hi-library',0,NULL,_binary '\0',_binary '\0',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','ed3808cd-8f8d-4896-bc6a-01a16112a3c6',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','585f05eb-75b5-47fa-a893-f66cb810c5e7','c6135fa7-b58a-46ee-b566-adf6959b1785','9f8a2c39-2385-4f6e-abe9-040233498045','86d53555-aa8c-4450-b9b4-689ef6b89237','771a017f-b3b2-42cc-bd96-5efb4194b4f3',2592000,_binary '\0',900,_binary '',_binary '\0','26d6d8a6-24a4-48a9-856d-787e7a73a432',0,_binary '\0',0,0),('hi-therapist',60,300,1800,NULL,NULL,'keycloak',_binary '',_binary '\0',0,'hi','hi-therapist',1619517373,'specialChars(1) and upperCase(1) and lowerCase(1) and length(8)',_binary '\0',_binary '\0',_binary '',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','ab0c8a29-97d3-47bb-8756-47bb4deb34ed',1800,_binary '','en',_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','10d3d303-a637-49d9-a0d2-18e9d85eec96','b23d3bf9-6083-41cd-b142-f6f0f2933503','c20c2475-99eb-40e6-bae2-a8f5540087f8','e8efe948-5fc8-45a0-96c1-fa0f213831ab','47659d6f-ddbc-4590-8e49-d3d846d0c73b',2592000,_binary '\0',900,_binary '',_binary '\0','f0ba7e18-930e-4784-962d-1d5a99b9a30f',0,_binary '\0',0,0),('master',60,300,60,NULL,NULL,NULL,_binary '',_binary '\0',0,NULL,'master',0,NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0','EXTERNAL',1800,36000,_binary '\0',_binary '\0','a46e6bdc-8a4f-4501-897d-efe09b633126',1800,_binary '\0',NULL,_binary '\0',_binary '\0',_binary '\0',_binary '\0',0,1,30,6,'HmacSHA1','totp','409ff595-7f9b-40bb-8844-ae4ec74e24ef','e3c67d7a-39af-497b-aa8e-5bf39bc8b25c','31bf0da3-ebb0-46de-b6e7-45571ced2ef8','ae98e9f5-b8ff-4db8-87ec-4bc4468f399f','d4ae44af-6da9-417e-be64-94ae459a46cd',2592000,_binary '\0',900,_binary '',_binary '\0','4db51364-aa84-4543-a6da-a9ec2f8795c8',0,_binary '\0',0,0);
/*!40000 ALTER TABLE `REALM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ATTRIBUTE`
--

DROP TABLE IF EXISTS `REALM_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`NAME`,`REALM_ID`),
  KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`),
  CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ATTRIBUTE`
--

LOCK TABLES `REALM_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `REALM_ATTRIBUTE` VALUES ('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','hi'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','hi-library'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','hi-therapist'),('_browser_header.contentSecurityPolicy','frame-src \'self\'; frame-ancestors \'self\'; object-src \'none\';','master'),('_browser_header.contentSecurityPolicyReportOnly','','hi'),('_browser_header.contentSecurityPolicyReportOnly','','hi-library'),('_browser_header.contentSecurityPolicyReportOnly','','hi-therapist'),('_browser_header.contentSecurityPolicyReportOnly','','master'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','hi'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','hi-library'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','hi-therapist'),('_browser_header.strictTransportSecurity','max-age=31536000; includeSubDomains','master'),('_browser_header.xContentTypeOptions','nosniff','hi'),('_browser_header.xContentTypeOptions','nosniff','hi-library'),('_browser_header.xContentTypeOptions','nosniff','hi-therapist'),('_browser_header.xContentTypeOptions','nosniff','master'),('_browser_header.xFrameOptions','SAMEORIGIN','hi'),('_browser_header.xFrameOptions','SAMEORIGIN','hi-library'),('_browser_header.xFrameOptions','SAMEORIGIN','hi-therapist'),('_browser_header.xFrameOptions','SAMEORIGIN','master'),('_browser_header.xRobotsTag','none','hi'),('_browser_header.xRobotsTag','none','hi-library'),('_browser_header.xRobotsTag','none','hi-therapist'),('_browser_header.xRobotsTag','none','master'),('_browser_header.xXSSProtection','1; mode=block','hi'),('_browser_header.xXSSProtection','1; mode=block','hi-library'),('_browser_header.xXSSProtection','1; mode=block','hi-therapist'),('_browser_header.xXSSProtection','1; mode=block','master'),('actionTokenGeneratedByAdminLifespan','172800','hi'),('actionTokenGeneratedByAdminLifespan','43200','hi-library'),('actionTokenGeneratedByAdminLifespan','172800','hi-therapist'),('actionTokenGeneratedByUserLifespan','300','hi'),('actionTokenGeneratedByUserLifespan','300','hi-library'),('actionTokenGeneratedByUserLifespan','300','hi-therapist'),('bruteForceProtected','false','hi'),('bruteForceProtected','false','hi-library'),('bruteForceProtected','false','hi-therapist'),('bruteForceProtected','false','master'),('clientOfflineSessionIdleTimeout','0','hi'),('clientOfflineSessionIdleTimeout','0','hi-library'),('clientOfflineSessionIdleTimeout','0','hi-therapist'),('clientOfflineSessionMaxLifespan','0','hi'),('clientOfflineSessionMaxLifespan','0','hi-library'),('clientOfflineSessionMaxLifespan','0','hi-therapist'),('clientSessionIdleTimeout','0','hi'),('clientSessionIdleTimeout','0','hi-library'),('clientSessionIdleTimeout','0','hi-therapist'),('clientSessionMaxLifespan','0','hi'),('clientSessionMaxLifespan','0','hi-library'),('clientSessionMaxLifespan','0','hi-therapist'),('displayName','Keycloak','master'),('displayNameHtml','<div class=\"kc-logo-text\"><span>Keycloak</span></div>','master'),('failureFactor','30','hi'),('failureFactor','30','hi-library'),('failureFactor','30','hi-therapist'),('failureFactor','30','master'),('frontendUrl','https://local-hi-admin.wehost.asia/auth/','hi'),('frontendUrl','https://local-hi-library.wehost.asia/auth/','hi-library'),('frontendUrl','https://local-hi-therapist.wehost.asia/auth/','hi-therapist'),('maxDeltaTimeSeconds','43200','hi'),('maxDeltaTimeSeconds','43200','hi-library'),('maxDeltaTimeSeconds','43200','hi-therapist'),('maxDeltaTimeSeconds','43200','master'),('maxFailureWaitSeconds','900','hi'),('maxFailureWaitSeconds','900','hi-library'),('maxFailureWaitSeconds','900','hi-therapist'),('maxFailureWaitSeconds','900','master'),('minimumQuickLoginWaitSeconds','60','hi'),('minimumQuickLoginWaitSeconds','60','hi-library'),('minimumQuickLoginWaitSeconds','60','hi-therapist'),('minimumQuickLoginWaitSeconds','60','master'),('offlineSessionMaxLifespan','5184000','hi'),('offlineSessionMaxLifespan','5184000','hi-library'),('offlineSessionMaxLifespan','5184000','hi-therapist'),('offlineSessionMaxLifespan','5184000','master'),('offlineSessionMaxLifespanEnabled','false','hi'),('offlineSessionMaxLifespanEnabled','false','hi-library'),('offlineSessionMaxLifespanEnabled','false','hi-therapist'),('offlineSessionMaxLifespanEnabled','false','master'),('permanentLockout','false','hi'),('permanentLockout','false','hi-library'),('permanentLockout','false','hi-therapist'),('permanentLockout','false','master'),('quickLoginCheckMilliSeconds','1000','hi'),('quickLoginCheckMilliSeconds','1000','hi-library'),('quickLoginCheckMilliSeconds','1000','hi-therapist'),('quickLoginCheckMilliSeconds','1000','master'),('waitIncrementSeconds','60','hi'),('waitIncrementSeconds','60','hi-library'),('waitIncrementSeconds','60','hi-therapist'),('waitIncrementSeconds','60','master'),('webAuthnPolicyAttestationConveyancePreference','not specified','hi'),('webAuthnPolicyAttestationConveyancePreference','not specified','hi-library'),('webAuthnPolicyAttestationConveyancePreference','not specified','hi-therapist'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','hi'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','hi-library'),('webAuthnPolicyAttestationConveyancePreferencePasswordless','not specified','hi-therapist'),('webAuthnPolicyAuthenticatorAttachment','not specified','hi'),('webAuthnPolicyAuthenticatorAttachment','not specified','hi-library'),('webAuthnPolicyAuthenticatorAttachment','not specified','hi-therapist'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','hi'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','hi-library'),('webAuthnPolicyAuthenticatorAttachmentPasswordless','not specified','hi-therapist'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','hi'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','hi-library'),('webAuthnPolicyAvoidSameAuthenticatorRegister','false','hi-therapist'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','hi'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','hi-library'),('webAuthnPolicyAvoidSameAuthenticatorRegisterPasswordless','false','hi-therapist'),('webAuthnPolicyCreateTimeout','0','hi'),('webAuthnPolicyCreateTimeout','0','hi-library'),('webAuthnPolicyCreateTimeout','0','hi-therapist'),('webAuthnPolicyCreateTimeoutPasswordless','0','hi'),('webAuthnPolicyCreateTimeoutPasswordless','0','hi-library'),('webAuthnPolicyCreateTimeoutPasswordless','0','hi-therapist'),('webAuthnPolicyRequireResidentKey','not specified','hi'),('webAuthnPolicyRequireResidentKey','not specified','hi-library'),('webAuthnPolicyRequireResidentKey','not specified','hi-therapist'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','hi'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','hi-library'),('webAuthnPolicyRequireResidentKeyPasswordless','not specified','hi-therapist'),('webAuthnPolicyRpEntityName','keycloak','hi'),('webAuthnPolicyRpEntityName','keycloak','hi-library'),('webAuthnPolicyRpEntityName','keycloak','hi-therapist'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','hi'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','hi-library'),('webAuthnPolicyRpEntityNamePasswordless','keycloak','hi-therapist'),('webAuthnPolicyRpId','','hi'),('webAuthnPolicyRpId','','hi-library'),('webAuthnPolicyRpId','','hi-therapist'),('webAuthnPolicyRpIdPasswordless','','hi'),('webAuthnPolicyRpIdPasswordless','','hi-library'),('webAuthnPolicyRpIdPasswordless','','hi-therapist'),('webAuthnPolicySignatureAlgorithms','ES256','hi'),('webAuthnPolicySignatureAlgorithms','ES256','hi-library'),('webAuthnPolicySignatureAlgorithms','ES256','hi-therapist'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','hi'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','hi-library'),('webAuthnPolicySignatureAlgorithmsPasswordless','ES256','hi-therapist'),('webAuthnPolicyUserVerificationRequirement','not specified','hi'),('webAuthnPolicyUserVerificationRequirement','not specified','hi-library'),('webAuthnPolicyUserVerificationRequirement','not specified','hi-therapist'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','hi'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','hi-library'),('webAuthnPolicyUserVerificationRequirementPasswordless','not specified','hi-therapist');
/*!40000 ALTER TABLE `REALM_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_GROUPS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_GROUPS`
--

LOCK TABLES `REALM_DEFAULT_GROUPS` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_DEFAULT_GROUPS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

DROP TABLE IF EXISTS `REALM_DEFAULT_ROLES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_DEFAULT_ROLES`
--

LOCK TABLES `REALM_DEFAULT_ROLES` WRITE;
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` DISABLE KEYS */;
INSERT INTO `REALM_DEFAULT_ROLES` VALUES ('hi-library','44f11c4f-11de-4930-a9bb-66f1504833af'),('master','b828f2ee-5fc3-42c7-ac6a-fec7a25f4e74'),('master','d0472798-0773-4a9a-9ea1-0547f4968d28'),('hi-library','d686ff30-9ce6-4d21-b40e-954cf53da12d');
/*!40000 ALTER TABLE `REALM_DEFAULT_ROLES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

DROP TABLE IF EXISTS `REALM_ENABLED_EVENT_TYPES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_ENABLED_EVENT_TYPES`
--

LOCK TABLES `REALM_ENABLED_EVENT_TYPES` WRITE;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` DISABLE KEYS */;
/*!40000 ALTER TABLE `REALM_ENABLED_EVENT_TYPES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

DROP TABLE IF EXISTS `REALM_EVENTS_LISTENERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`),
  CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_EVENTS_LISTENERS`
--

LOCK TABLES `REALM_EVENTS_LISTENERS` WRITE;
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` DISABLE KEYS */;
INSERT INTO `REALM_EVENTS_LISTENERS` VALUES ('hi','jboss-logging'),('hi-library','jboss-logging'),('hi-therapist','jboss-logging'),('master','jboss-logging');
/*!40000 ALTER TABLE `REALM_EVENTS_LISTENERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

DROP TABLE IF EXISTS `REALM_REQUIRED_CREDENTIAL`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FORM_LABEL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`TYPE`),
  CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_REQUIRED_CREDENTIAL`
--

LOCK TABLES `REALM_REQUIRED_CREDENTIAL` WRITE;
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` DISABLE KEYS */;
INSERT INTO `REALM_REQUIRED_CREDENTIAL` VALUES ('password','password',_binary '',_binary '','hi'),('password','password',_binary '',_binary '','hi-library'),('password','password',_binary '',_binary '','hi-therapist'),('password','password',_binary '',_binary '','master');
/*!40000 ALTER TABLE `REALM_REQUIRED_CREDENTIAL` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

DROP TABLE IF EXISTS `REALM_SMTP_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`NAME`),
  CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SMTP_CONFIG`
--

LOCK TABLES `REALM_SMTP_CONFIG` WRITE;
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` DISABLE KEYS */;
INSERT INTO `REALM_SMTP_CONFIG` VALUES ('hi','true','auth'),('hi','noreply@web-essentials.asia','from'),('hi','10.10.10.37','host'),('hi','**********','password'),('hi','1025','port'),('hi','','replyTo'),('hi','false','ssl'),('hi','true','starttls'),('hi','noreply@web-essentials.asia','user'),('hi-library','true','auth'),('hi-library','noreply@opentelerehab.com','from'),('hi-library','email-smtp.us-east-1.amazonaws.com','host'),('hi-library','**********','password'),('hi-library','587','port'),('hi-library','false','ssl'),('hi-library','true','starttls'),('hi-library','AKIA2T6OTQKX64H4UR76','user'),('hi-therapist','false','auth'),('hi-therapist','noreply@web-essentials.asia','from'),('hi-therapist','10.10.10.37','host'),('hi-therapist','**********','password'),('hi-therapist','1025','port'),('hi-therapist','','ssl'),('hi-therapist','false','starttls'),('hi-therapist','noreply@web-essentials.asia','user');
/*!40000 ALTER TABLE `REALM_SMTP_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

DROP TABLE IF EXISTS `REALM_SUPPORTED_LOCALES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REALM_ID`,`VALUE`),
  KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`),
  CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REALM_SUPPORTED_LOCALES`
--

LOCK TABLES `REALM_SUPPORTED_LOCALES` WRITE;
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` DISABLE KEYS */;
INSERT INTO `REALM_SUPPORTED_LOCALES` VALUES ('hi','ar'),('hi','ca'),('hi','cs'),('hi','de'),('hi','en'),('hi','es'),('hi','fr'),('hi','it'),('hi','ja'),('hi','lt'),('hi','nl'),('hi','no'),('hi','pl'),('hi','pt-BR'),('hi','ru'),('hi','sk'),('hi','sv'),('hi','tr'),('hi','vi'),('hi','zh-CN'),('hi-library',''),('hi-therapist','ar'),('hi-therapist','ca'),('hi-therapist','cs'),('hi-therapist','de'),('hi-therapist','en'),('hi-therapist','es'),('hi-therapist','fr'),('hi-therapist','it'),('hi-therapist','ja'),('hi-therapist','lt'),('hi-therapist','nl'),('hi-therapist','no'),('hi-therapist','pl'),('hi-therapist','pt-BR'),('hi-therapist','ru'),('hi-therapist','sk'),('hi-therapist','sv'),('hi-therapist','tr'),('hi-therapist','vi'),('hi-therapist','zh-CN');
/*!40000 ALTER TABLE `REALM_SUPPORTED_LOCALES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REDIRECT_URIS`
--

DROP TABLE IF EXISTS `REDIRECT_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REDIRECT_URIS`
--

LOCK TABLES `REDIRECT_URIS` WRITE;
/*!40000 ALTER TABLE `REDIRECT_URIS` DISABLE KEYS */;
INSERT INTO `REDIRECT_URIS` VALUES ('1288ec7b-6f3d-429e-b43e-2e0b710239ba','/realms/master/account/*'),('1472daaa-5420-4b1f-bfb2-f184f16a8320','*'),('1d1424ea-24c6-4434-b5e5-8e96e26f3255','/realms/hi-library/account/*'),('30febc11-32fa-4349-a4db-a46a33775ab2','https://local-hi-therapist.wehost.asia/*'),('558bc5ae-068f-4e0b-b70a-170b730aa137','https://local-hi-admin.wehost.asia/*'),('55c52d92-7f2e-40b2-8cef-35e558d2c72b',''),('55c52d92-7f2e-40b2-8cef-35e558d2c72b','/realms/hi/account/*'),('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','/admin/hi-library/console/*'),('620c09d1-5d44-4bda-959f-82ff964b0f98','https://local-hi-library.wehost.asia/*'),('63f568e6-51bc-4bbe-9fb4-1dcf570d09a4','/realms/Hi/account/*'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','/realms/master/account/*'),('89d22c6b-7a3a-406a-8635-049ea85abb55','/realms/hi-therapist/account/*'),('af07419a-9fdd-48f8-bb86-98deababeb5d','/realms/Hi/account/*'),('b53a1923-71b3-4fbf-be97-b1573d596e47','/admin/master/console/*'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','/admin/hi-therapist/console/*'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','/admin/hi/console/*'),('da8a1c0e-1290-4e3d-988f-7ff967de07d8','*'),('dd77b2d7-5ee9-4a5d-a25a-eb152157fb4c','/realms/hi-library/account/*'),('e233b1cf-3455-4e60-9488-ec12dfa884d2','*');
/*!40000 ALTER TABLE `REDIRECT_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_CONFIG`
--

LOCK TABLES `REQUIRED_ACTION_CONFIG` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `REQUIRED_ACTION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

DROP TABLE IF EXISTS `REQUIRED_ACTION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALIAS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `REQUIRED_ACTION_PROVIDER`
--

LOCK TABLES `REQUIRED_ACTION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` DISABLE KEYS */;
INSERT INTO `REQUIRED_ACTION_PROVIDER` VALUES ('0c96aef9-58c2-4ca9-8c0f-9804c5ae81a6','UPDATE_PASSWORD','Update Password','hi-library',_binary '',_binary '\0','UPDATE_PASSWORD',30),('12eb6830-85a6-42f1-b338-227e6b0f1102','CONFIGURE_TOTP','Configure OTP','master',_binary '',_binary '\0','CONFIGURE_TOTP',10),('251f62cd-20a1-4867-931a-f58772aca089','terms_and_conditions','Terms and Conditions','hi-library',_binary '\0',_binary '\0','terms_and_conditions',20),('3bce35de-f1a4-454a-a12f-fd6bc543276d','terms_and_conditions','Terms and Conditions','master',_binary '\0',_binary '\0','terms_and_conditions',20),('457a9859-262a-4281-8cac-8b90e1cf7792','update_user_locale','Update User Locale','hi-therapist',_binary '',_binary '\0','update_user_locale',1000),('5c23f931-4533-49f8-9d95-5211de93e353','UPDATE_PASSWORD','Update Password','hi-therapist',_binary '',_binary '\0','UPDATE_PASSWORD',30),('62c6fb79-ff7b-40e8-a7d4-ba646177521a','update_user_locale','Update User Locale','master',_binary '',_binary '\0','update_user_locale',1000),('66019933-4293-454d-9e0f-227824e2beb6','UPDATE_PROFILE','Update Profile','hi-therapist',_binary '',_binary '\0','UPDATE_PROFILE',40),('6a141359-86b0-4505-a964-c103b776635d','VERIFY_EMAIL','Verify Email','hi-therapist',_binary '',_binary '\0','VERIFY_EMAIL',50),('6df8a505-0314-448c-a87f-bbf6ea7c5cae','update_user_locale','Update User Locale','hi',_binary '',_binary '\0','update_user_locale',1000),('70c23493-31e4-48f2-9a80-56d78653d02f','VERIFY_EMAIL','Verify Email','master',_binary '',_binary '\0','VERIFY_EMAIL',50),('804fbf39-a8bd-4609-8ea0-ad97a716e6de','terms_and_conditions','Terms and Conditions','hi-therapist',_binary '',_binary '','terms_and_conditions',20),('840d51a1-2a8f-40db-bb0f-83320f39a696','update_user_locale','Update User Locale','hi-library',_binary '',_binary '\0','update_user_locale',1000),('a1b67554-ed15-4327-b5c5-302add0e99da','UPDATE_PASSWORD','Update Password','hi',_binary '',_binary '\0','UPDATE_PASSWORD',30),('a9ecafc1-8039-47cb-9b72-569afe6664bb','CONFIGURE_TOTP','Configure OTP','hi',_binary '',_binary '\0','CONFIGURE_TOTP',10),('af33cb52-e072-43d1-aaa5-5c4042a32c9a','terms_and_conditions','Terms and Conditions','hi',_binary '',_binary '','terms_and_conditions',20),('c44ffcca-a26d-4905-ad67-c89e205dc148','UPDATE_PROFILE','Update Profile','hi',_binary '',_binary '\0','UPDATE_PROFILE',40),('c6c80242-ef00-45e1-8c9a-9a9d2126e682','UPDATE_PASSWORD','Update Password','master',_binary '',_binary '\0','UPDATE_PASSWORD',30),('ccadf9c1-06fb-4142-8bdf-1189cbd598ba','VERIFY_EMAIL','Verify Email','hi',_binary '',_binary '\0','VERIFY_EMAIL',50),('d32c11c6-7306-4cb1-9dd1-df367133251a','VERIFY_EMAIL','Verify Email','hi-library',_binary '',_binary '\0','VERIFY_EMAIL',50),('d8844328-e65f-4326-bd1b-eedb3dcdfdb7','UPDATE_PROFILE','Update Profile','hi-library',_binary '',_binary '\0','UPDATE_PROFILE',40),('d9f9c588-d516-4a97-ba13-eb0f67ff75fe','CONFIGURE_TOTP','Configure OTP','hi-library',_binary '',_binary '\0','CONFIGURE_TOTP',10),('f17ed90b-b62b-4f57-967e-a2db6c431938','UPDATE_PROFILE','Update Profile','master',_binary '',_binary '\0','UPDATE_PROFILE',40),('fdb698e6-8f15-4ecf-8321-faccc485f43b','CONFIGURE_TOTP','Configure OTP','hi-therapist',_binary '',_binary '\0','CONFIGURE_TOTP',10);
/*!40000 ALTER TABLE `REQUIRED_ACTION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `RESOURCE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_ATTRIBUTE`
--

LOCK TABLES `RESOURCE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_POLICY`
--

LOCK TABLES `RESOURCE_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`),
  CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SCOPE`
--

LOCK TABLES `RESOURCE_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER`
--

LOCK TABLES `RESOURCE_SERVER` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_PERM_TICKET`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REQUESTER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint NOT NULL,
  `GRANTED_TIMESTAMP` bigint DEFAULT NULL,
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_PERM_TICKET`
--

LOCK TABLES `RESOURCE_SERVER_PERM_TICKET` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_PERM_TICKET` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `DECISION_STRATEGY` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LOGIC` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_POLICY`
--

LOCK TABLES `RESOURCE_SERVER_POLICY` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_RESOURCE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ICON_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_RESOURCE`
--

LOCK TABLES `RESOURCE_SERVER_RESOURCE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_RESOURCE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

DROP TABLE IF EXISTS `RESOURCE_SERVER_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ICON_URI` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`),
  CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_SERVER_SCOPE`
--

LOCK TABLES `RESOURCE_SERVER_SCOPE` WRITE;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_SERVER_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `RESOURCE_URIS`
--

DROP TABLE IF EXISTS `RESOURCE_URIS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`RESOURCE_ID`,`VALUE`),
  CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `RESOURCE_URIS`
--

LOCK TABLES `RESOURCE_URIS` WRITE;
/*!40000 ALTER TABLE `RESOURCE_URIS` DISABLE KEYS */;
/*!40000 ALTER TABLE `RESOURCE_URIS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

DROP TABLE IF EXISTS `ROLE_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`),
  CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ROLE_ATTRIBUTE`
--

LOCK TABLES `ROLE_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ROLE_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_MAPPING`
--

DROP TABLE IF EXISTS `SCOPE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ROLE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`),
  CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_MAPPING`
--

LOCK TABLES `SCOPE_MAPPING` WRITE;
/*!40000 ALTER TABLE `SCOPE_MAPPING` DISABLE KEYS */;
INSERT INTO `SCOPE_MAPPING` VALUES ('1d1424ea-24c6-4434-b5e5-8e96e26f3255','4a38d073-c8b2-4d2f-a41b-309828b871c8'),('77e9c98b-7058-4d56-ba7d-a742ef5e4e53','c2db71d6-b098-4688-a383-12e79f5bcc7d');
/*!40000 ALTER TABLE `SCOPE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCOPE_POLICY`
--

DROP TABLE IF EXISTS `SCOPE_POLICY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `POLICY_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`),
  CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCOPE_POLICY`
--

LOCK TABLES `SCOPE_POLICY` WRITE;
/*!40000 ALTER TABLE `SCOPE_POLICY` DISABLE KEYS */;
/*!40000 ALTER TABLE `SCOPE_POLICY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

DROP TABLE IF EXISTS `USERNAME_LOGIN_FAILURE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int DEFAULT NULL,
  `LAST_FAILURE` bigint DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NUM_FAILURES` int DEFAULT NULL,
  PRIMARY KEY (`REALM_ID`,`USERNAME`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USERNAME_LOGIN_FAILURE`
--

LOCK TABLES `USERNAME_LOGIN_FAILURE` WRITE;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USERNAME_LOGIN_FAILURE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ATTRIBUTE`
--

DROP TABLE IF EXISTS `USER_ATTRIBUTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'sybase-needs-something-here',
  PRIMARY KEY (`ID`),
  KEY `IDX_USER_ATTRIBUTE` (`USER_ID`),
  CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ATTRIBUTE`
--

LOCK TABLES `USER_ATTRIBUTE` WRITE;
/*!40000 ALTER TABLE `USER_ATTRIBUTE` DISABLE KEYS */;
INSERT INTO `USER_ATTRIBUTE` VALUES ('locale','en','125522c5-aa37-48a1-a6fe-f6828ab9f69b','0105daec-03d5-41fa-be0b-67c4fae1b18d'),('locale','','9e1377bd-481e-4166-bb45-ed4fcba336dd','24f08eee-ed9e-4ddb-b218-e03a5e3fff44'),('locale','','ece42f3e-67d4-45cd-b194-1a75fbb997b0','2a386088-5f2c-4667-86a0-c91d4f7a81c1'),('terms_and_conditions','1666230102','34a8a769-9ee3-4624-892b-467934fdd429','34aa03a8-1c75-4406-b362-5898bfa31815'),('locale','en','34a8a769-9ee3-4624-892b-467934fdd429','4306ebd2-4e29-46e6-b9ae-e0997ee297cd'),('locale','','b2ca12b7-d7bf-4373-ad11-157a0c85450b','6bbbe5d8-4baf-45cc-8041-a169454cdbae'),('terms_and_conditions','1666231784','b2ca12b7-d7bf-4373-ad11-157a0c85450b','7d353ff5-3f58-47f4-8c61-e1e59931ccb7'),('terms_and_conditions','1666232471','9e1377bd-481e-4166-bb45-ed4fcba336dd','8cbc40da-4891-4a48-a636-7018aad082be');
/*!40000 ALTER TABLE `USER_ATTRIBUTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT`
--

DROP TABLE IF EXISTS `USER_CONSENT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CREATED_DATE` bigint DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  KEY `IDX_USER_CONSENT` (`USER_ID`),
  CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT`
--

LOCK TABLES `USER_CONSENT` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

DROP TABLE IF EXISTS `USER_CONSENT_CLIENT_SCOPE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `SCOPE_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`),
  CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_CONSENT_CLIENT_SCOPE`
--

LOCK TABLES `USER_CONSENT_CLIENT_SCOPE` WRITE;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_CONSENT_CLIENT_SCOPE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ENTITY`
--

DROP TABLE IF EXISTS `USER_ENTITY`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `EMAIL` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NOT_BEFORE` int NOT NULL DEFAULT '0',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  KEY `IDX_USER_EMAIL` (`EMAIL`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ENTITY`
--

LOCK TABLES `USER_ENTITY` WRITE;
/*!40000 ALTER TABLE `USER_ENTITY` DISABLE KEYS */;
INSERT INTO `USER_ENTITY` VALUES ('03e1f80f-e8cb-48d2-a032-2794c89ae9ab','admin@we.co','admin@we.co',_binary '\0',_binary '',NULL,'Admin','User','hi-library','admin@we.co',1666604743417,NULL,0),('125522c5-aa37-48a1-a6fe-f6828ab9f69b','therapist@we.co','therapist@we.co',_binary '\0',_binary '',NULL,'Therapist','Hi','hi-therapist','therapist@we.co',1666235301649,NULL,0),('1ce9a26f-7eb7-4974-94c1-786da65692e0',NULL,'a5d398f5-f374-428c-b5c4-d37199d85910',_binary '\0',_binary '',NULL,'DO NOT DELETE!','DO NOT DELETE!','hi-library','hi_backend',1666604338302,NULL,0),('34a8a769-9ee3-4624-892b-467934fdd429','organization-admin@we.co','organization-admin@we.co',_binary '\0',_binary '',NULL,'HI-Admin','HI-Admin','hi','organization-admin@we.co',1666227557780,NULL,0),('9788e968-d7e1-472f-b724-830ab7960b89',NULL,'600e39da-12b6-4c3f-8380-8b330315bab4',_binary '\0',_binary '',NULL,NULL,NULL,'master','admin',1666173247208,NULL,0),('9e1377bd-481e-4166-bb45-ed4fcba336dd','clinic-admin@we.co','clinic-admin@we.co',_binary '\0',_binary '',NULL,'Clinic','Admin','hi','clinic-admin@we.co',1666232378933,NULL,0),('a0f53e62-3cbb-4aa6-8248-7ad131b80de4',NULL,'da170d4f-4a7e-48fa-a095-437fece9e4d3',_binary '\0',_binary '',NULL,'DO NOT DELETE!','DO NOT DELETE!','hi-therapist','hi_backend',1666232721682,NULL,0),('a13d0718-447f-4389-8de6-73d040e5b27e','super-admin@we.co','super-admin@we.co',_binary '\0',_binary '',NULL,'Super','Admin','hi','super-admin@we.co',1666177764402,NULL,0),('ab020eff-64dd-4b2c-960a-5b8cf75ef25f',NULL,'ce8341c7-f3f0-4f97-a8a0-489f8d40066a',_binary '\0',_binary '',NULL,'DO NOT DELETE!','DO NOT DELETE!','hi','hi_backend',1666175748334,NULL,0),('b2ca12b7-d7bf-4373-ad11-157a0c85450b','country-admin@we.co','country-admin@we.co',_binary '\0',_binary '',NULL,'Country','Admin','hi','country-admin@we.co',1666231641544,NULL,0),('ece42f3e-67d4-45cd-b194-1a75fbb997b0','country-vn-admin@we.co','country-vn-admin@we.co',_binary '\0',_binary '',NULL,'Admin','Country VN','hi','country-vn-admin@we.co',1666231675744,NULL,0);
/*!40000 ALTER TABLE `USER_ENTITY` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`),
  CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_CONFIG`
--

LOCK TABLES `USER_FEDERATION_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`),
  CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER`
--

LOCK TABLES `USER_FEDERATION_MAPPER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

DROP TABLE IF EXISTS `USER_FEDERATION_MAPPER_CONFIG`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`),
  CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_MAPPER_CONFIG`
--

LOCK TABLES `USER_FEDERATION_MAPPER_CONFIG` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

DROP TABLE IF EXISTS `USER_FEDERATION_PROVIDER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `CHANGED_SYNC_PERIOD` int DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `FULL_SYNC_PERIOD` int DEFAULT NULL,
  `LAST_SYNC` int DEFAULT NULL,
  `PRIORITY` int DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`),
  CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_FEDERATION_PROVIDER`
--

LOCK TABLES `USER_FEDERATION_PROVIDER` WRITE;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_FEDERATION_PROVIDER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

DROP TABLE IF EXISTS `USER_GROUP_MEMBERSHIP`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_GROUP_MEMBERSHIP`
--

LOCK TABLES `USER_GROUP_MEMBERSHIP` WRITE;
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` DISABLE KEYS */;
INSERT INTO `USER_GROUP_MEMBERSHIP` VALUES ('628a4475-dc04-4f04-8232-82952becec7d','03e1f80f-e8cb-48d2-a032-2794c89ae9ab'),('a874c900-56b5-43c9-84cc-e2232d01accf','34a8a769-9ee3-4624-892b-467934fdd429'),('c262046d-3b62-41ca-89f5-747cdbcf472a','9e1377bd-481e-4166-bb45-ed4fcba336dd'),('bbeb9671-7a62-4333-a809-b4138e11a4ed','a13d0718-447f-4389-8de6-73d040e5b27e'),('43644117-0a68-4f54-9d9d-a79bc788da6d','b2ca12b7-d7bf-4373-ad11-157a0c85450b'),('43644117-0a68-4f54-9d9d-a79bc788da6d','ece42f3e-67d4-45cd-b194-1a75fbb997b0');
/*!40000 ALTER TABLE `USER_GROUP_MEMBERSHIP` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

DROP TABLE IF EXISTS `USER_REQUIRED_ACTION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `REQUIRED_ACTION` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT ' ',
  PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  KEY `IDX_USER_REQACTIONS` (`USER_ID`),
  CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_REQUIRED_ACTION`
--

LOCK TABLES `USER_REQUIRED_ACTION` WRITE;
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` DISABLE KEYS */;
INSERT INTO `USER_REQUIRED_ACTION` VALUES ('ece42f3e-67d4-45cd-b194-1a75fbb997b0','terms_and_conditions');
/*!40000 ALTER TABLE `USER_REQUIRED_ACTION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_ROLE_MAPPING`
--

DROP TABLE IF EXISTS `USER_ROLE_MAPPING`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `USER_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`),
  CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_ROLE_MAPPING`
--

LOCK TABLES `USER_ROLE_MAPPING` WRITE;
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` DISABLE KEYS */;
INSERT INTO `USER_ROLE_MAPPING` VALUES ('44f11c4f-11de-4930-a9bb-66f1504833af','03e1f80f-e8cb-48d2-a032-2794c89ae9ab'),('4a38d073-c8b2-4d2f-a41b-309828b871c8','03e1f80f-e8cb-48d2-a032-2794c89ae9ab'),('a9a48d94-076e-4dd8-902b-fa5b4cc92561','03e1f80f-e8cb-48d2-a032-2794c89ae9ab'),('d686ff30-9ce6-4d21-b40e-954cf53da12d','03e1f80f-e8cb-48d2-a032-2794c89ae9ab'),('22ffa567-5b11-4982-afc8-f3116f592f31','125522c5-aa37-48a1-a6fe-f6828ab9f69b'),('2e12ca9a-83f4-4aed-98a7-7fa6ea1ba299','1ce9a26f-7eb7-4974-94c1-786da65692e0'),('44f11c4f-11de-4930-a9bb-66f1504833af','1ce9a26f-7eb7-4974-94c1-786da65692e0'),('4a38d073-c8b2-4d2f-a41b-309828b871c8','1ce9a26f-7eb7-4974-94c1-786da65692e0'),('a9a48d94-076e-4dd8-902b-fa5b4cc92561','1ce9a26f-7eb7-4974-94c1-786da65692e0'),('d686ff30-9ce6-4d21-b40e-954cf53da12d','1ce9a26f-7eb7-4974-94c1-786da65692e0'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','34a8a769-9ee3-4624-892b-467934fdd429'),('9cbfc2a7-25ec-4b22-8990-57127bd0665c','9788e968-d7e1-472f-b724-830ab7960b89'),('b828f2ee-5fc3-42c7-ac6a-fec7a25f4e74','9788e968-d7e1-472f-b724-830ab7960b89'),('c2db71d6-b098-4688-a383-12e79f5bcc7d','9788e968-d7e1-472f-b724-830ab7960b89'),('d0472798-0773-4a9a-9ea1-0547f4968d28','9788e968-d7e1-472f-b724-830ab7960b89'),('eac704fd-d0a7-4137-9e18-2c54d6a861f0','9788e968-d7e1-472f-b724-830ab7960b89'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','9e1377bd-481e-4166-bb45-ed4fcba336dd'),('10726d7c-b18f-4cee-86ed-85b47f0cf37e','a0f53e62-3cbb-4aa6-8248-7ad131b80de4'),('22ffa567-5b11-4982-afc8-f3116f592f31','a0f53e62-3cbb-4aa6-8248-7ad131b80de4'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','a13d0718-447f-4389-8de6-73d040e5b27e'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','ab020eff-64dd-4b2c-960a-5b8cf75ef25f'),('b6f16505-bdbe-4ee0-af77-06ddb84cb62c','ab020eff-64dd-4b2c-960a-5b8cf75ef25f'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','b2ca12b7-d7bf-4373-ad11-157a0c85450b'),('8d4c4127-a801-4654-83a1-4ac23c6da4b3','ece42f3e-67d4-45cd-b194-1a75fbb997b0');
/*!40000 ALTER TABLE `USER_ROLE_MAPPING` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION`
--

DROP TABLE IF EXISTS `USER_SESSION`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `AUTH_METHOD` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `IP_ADDRESS` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `LAST_SESSION_REFRESH` int DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REALM_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int DEFAULT NULL,
  `USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `USER_SESSION_STATE` int DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION`
--

LOCK TABLES `USER_SESSION` WRITE;
/*!40000 ALTER TABLE `USER_SESSION` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER_SESSION_NOTE`
--

DROP TABLE IF EXISTS `USER_SESSION_NOTE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`USER_SESSION`,`NAME`),
  CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER_SESSION_NOTE`
--

LOCK TABLES `USER_SESSION_NOTE` WRITE;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` DISABLE KEYS */;
/*!40000 ALTER TABLE `USER_SESSION_NOTE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `WEB_ORIGINS`
--

DROP TABLE IF EXISTS `WEB_ORIGINS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`),
  CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `WEB_ORIGINS`
--

LOCK TABLES `WEB_ORIGINS` WRITE;
/*!40000 ALTER TABLE `WEB_ORIGINS` DISABLE KEYS */;
INSERT INTO `WEB_ORIGINS` VALUES ('5ac1fbef-dc0d-437e-bdfb-6d0c0d467dc0','+'),('b53a1923-71b3-4fbf-be97-b1573d596e47','+'),('cb884845-e614-4c6e-9508-6fd6ae87fd60','+'),('d84f18c2-b355-4a93-893b-a886e0b8fcf2','+');
/*!40000 ALTER TABLE `WEB_ORIGINS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-10-24 10:06:25
