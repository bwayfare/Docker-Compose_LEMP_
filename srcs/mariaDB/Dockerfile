FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade \
			&& apt-get install -y vim mariadb-server php-mysql

COPY		./script/wp_database.sql .
COPY		./script/start.sh .

RUN			sh ./start.sh
