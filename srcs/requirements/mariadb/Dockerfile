FROM	debian:bullseye

RUN	apt-get update && \
	apt-get install mariadb-server -y

COPY	./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

COPY	./tools/mariadb.sh /usr/local/bin

CMD	["usr/local/bin/mariadb.sh"]	
	
