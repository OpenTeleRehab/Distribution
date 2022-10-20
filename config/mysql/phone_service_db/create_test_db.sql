CREATE DATABASE IF NOT EXISTS phone_service_test_db;
CREATE USER 'phone_service_test'@'%' IDENTIFIED BY 'phone_service_test';
GRANT ALL PRIVILEGES ON `phone_service_test_db`.* TO 'phone_service_test'@'%' WITH GRANT OPTION;
