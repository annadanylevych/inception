#! /bin/bash

#Start the service if it is not running
service mariadb start

#Configuration of mysql database

#(enter) no root password yet
#(n) no unix_socket authentication
#(Y) change root password
#new password
#new password
#(Y) remove anonymous users
#(Y) disallow root login remotely, only allowed from localhost
#(Y) remove test database
#(Y) reload privilege tables so changes will take effect
mysql_secure_installation << FB_EOF

n
Y
$MYSQL_ROOT_PASSWORD
$MYSQL_ROOT_PASSWORD
Y
Y
Y
Y
FB_EOF

if [ ! -d /var/lib/mysql/$MYSQL_DATABASE ]
then
	mysql -u root -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE $MYSQL_DATABASE;"
	mysql -e "CREATE USER 'MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';"
	mysql -e "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' WITH GRANT OPTION;"
	mysql -e "FLUSH PRIVILEGES;"
	echo "User created in db successfully"
fi

service mariadb stop
mysqld
