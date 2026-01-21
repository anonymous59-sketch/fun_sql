show databases;
CREATE USER 'dev01'@'%' IDENTIFIED BY 'dev01';
-- grant all privileges on dev.* to 'dev01'@'%' with grant option;
GRANT ALL PRIVILEGES ON dev.* TO 'dev01'@'%' WITH GRANT OPTION;