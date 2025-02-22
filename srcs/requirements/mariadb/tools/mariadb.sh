service mariadb start

if [ ! -d /var/lib/mysql/${MYSQL_DATABASE} ]; then

	mysql -u ${MYSQL_ROOT_USER} -p${MYSQL_ROOT_PASSWORD} - e "CREATE DATABASE $MYSQL_DATABASE;"

	mysql -e "FLUSH PRIVILEGES;"

	mysql -e "ALTER USER '${MYSQL_ROOT_USER}'@'localhost' IDENTIFIED BY '${MYSQL_ROOT_PASSWORD}';"

mysqladmin -u  ${MYSQL_ROOT_USER} --password=${MYSQL_ROOT_PASSWORD} shutdown

mysqld
