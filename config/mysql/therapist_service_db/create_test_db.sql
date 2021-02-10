CREATE DATABASE IF NOT EXISTS therapist_service_test_db;
CREATE USER 'therapist_service_test'@'%' IDENTIFIED BY 'therapist_service_test';
GRANT ALL PRIVILEGES ON `therapist_service_test_db`.* TO 'therapist_service_test'@'%' WITH GRANT OPTION;
