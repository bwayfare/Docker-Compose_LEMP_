CREATE DATABASE IF NOT EXISTS wordpress DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;
UPDATE mysql.user SET password = '112233kyky' WHERE user='root';
FLUSH PRIVILEGES;
