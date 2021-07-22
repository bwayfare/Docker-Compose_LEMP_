FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y vim mariadb-server php-mysql

RUN			mkdir -p /var/run/mysqld/ \
#    		&& mkfifo /var/run/mysqld/mysqld.sock \
#    		&& touch /var/run/mysqld/mysqld.pid \
    		&& chmod -R 755 /var/run/mysqld/ \
			&& chown -R mysql /var/run/mysqld \
			&& chmod -R 755 /var/lib/* \
			&& chown -R mysql /var/lib/

COPY		./conf/my.cnf /etc/mysql/
COPY		./tools/wp_database.sql .
COPY		./tools/start.sh .

VOLUME		["/var/lib"]

EXPOSE		3306

CMD			sh start.sh