FROM	debian:bullseye

RUN	apt-get update && \
	apt-get install mariadb-server -y

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN	mkdir -p /var/run/mysqld && \
	chown -R mysql:mysql /var/run/mysqld && \
	chmod 77 /var/run/mysqld

COPY	./tools/mariadb.sh /usr/local/bin/mariadb.sh

RUN	chmod +x /usr/local/bin/mariadb.sh

CMD	["/usr/local/bin/mariadb.sh"]	
	
