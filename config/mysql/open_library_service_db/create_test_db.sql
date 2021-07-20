CREATE DATABASE IF NOT EXISTS open_library_service_test_db;
CREATE USER 'open_library_service_test'@'%' IDENTIFIED BY 'open_library_service_test';
GRANT ALL PRIVILEGES ON `open_library_service_test_db`.* TO 'open_library_service_test'@'%' WITH GRANT OPTION;
