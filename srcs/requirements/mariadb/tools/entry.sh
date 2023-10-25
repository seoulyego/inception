#!/bin/bash

export MARIADB_USER="yeongo"
export MARIADB_PWD=2369
export MARIADB_ROOT_PWD=2369
export WP_DB_NAME="wordpress"
export DB_HOST="mariadb"

mysql_install_db --user=root

echo "CREATE DATABASE IF NOT EXISTS ${WP_DB_NAME};
FLUSH PRIVILEGES;
USE ${WP_DB_NAME};
CREATE USER '${MARIADB_USER}'@'%' IDENTIFIED BY '${MARIADB_PWD}';
GRANT ALL PRIVILEGES ON * TO '${MARIADB_USER}'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
ALTER USER 'root'@'localhost' IDENTIFIED BY '${MARIADB_ROOT_PWD}';" > sql

mysqld -uroot --bootstrap < sql
mysqld -uroot
