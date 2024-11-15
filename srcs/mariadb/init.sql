password
CREATE DATABASE WordPress_db;
CREATE USER "db"@"%" IDENTIFIED BY "password";
GRANT ALL PRIVILEGES ON WordPress_db.* TO "db"@"%";
FLUSH PRIVILEGES;