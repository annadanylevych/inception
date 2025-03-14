#!/bin/bash
service mariadb start

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ];
then
	mysql -u root -p${MYSQL_ROOT_PASSWORD} -e "CREATE DATABASE $MYSQL_DATABASE;"
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'"
	mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
	mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"
fi

mysqladmin -u root --password=${MYSQL_ROOT_PASSWORD} shutdown

mysqld
