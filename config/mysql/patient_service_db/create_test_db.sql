CREATE DATABASE IF NOT EXISTS patient_service_test_db;
CREATE USER 'patient_service_test'@'%' IDENTIFIED BY 'patient_service_test';
GRANT ALL PRIVILEGES ON `patient_service_test_db`.* TO 'patient_service_test'@'%' WITH GRANT OPTION;
