FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y vim mariadb-server

RUN			mkdir -p /var/run/mysqld/ \
    		&& chmod -R 744 /var/run/mysqld/ \
			&& chown -R mysql /var/run/mysqld \
			&& chmod -R 744 /var/lib/* \
			&& chown -R mysql /var/lib/

COPY		./conf/my.cnf /etc/mysql/
COPY		./tools/wp_database.sql /tmp
COPY		./tools/start.sh /tmp

EXPOSE		3306

CMD			sh /tmp/start.sh