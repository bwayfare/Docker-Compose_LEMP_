FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y vim mariadb-server php-mysql

COPY		./conf/my.cnf /etc/mysql/
COPY		./tools/wp_database.sql .
COPY		./tools/start.sh .

VOLUME		["/var/lib"]

EXPOSE		3306

CMD			sh start.sh