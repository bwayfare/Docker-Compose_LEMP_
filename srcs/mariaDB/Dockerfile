FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade \
		&& apt-get install -y vim mariadb-server php-mysql
RUN		cd

RUN		echo [mysqld] >> /etc/mysql/my.cnf \
		&& echo socket=/var/run/mysqld/mysqld.sock >> /etc/mysql/my.cnf \
		&& echo datadir = /var/lib/mysql >> /etc/mysql/my.cnf \
		&& echo bind_address = 0.0.0.0 >> /etc/mysql/my.cnf \
		&& echo port = 3306 >> /etc/mysql/my.cnf \
		&& echo skip-networking  = false >> /etc/mysql/my.cnf \
		&& mkdir -p /var/run/mysqld/ \
		&& mkfifo /var/run/mysqld/mysqld.sock \
		&& chmod 777 /var/run/mysqld/mysqld.sock \
		&& chown -R mysql /var/run/mysqld


COPY		./script/wp_database.sql .
COPY		./script/start.sh .
VOLUME		["/var/lib"]

EXPOSE		3306
CMD 		service mysql start && mysql  < wp_database.sql && tail -F /var/log/mysql/error.log
