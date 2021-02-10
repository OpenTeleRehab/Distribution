CREATE DATABASE IF NOT EXISTS admin_service_test_db;
CREATE USER 'admin_service_test'@'%' IDENTIFIED BY 'admin_service_test';
GRANT ALL PRIVILEGES ON `admin_service_test_db`.* TO 'admin_service_test'@'%' WITH GRANT OPTION;
