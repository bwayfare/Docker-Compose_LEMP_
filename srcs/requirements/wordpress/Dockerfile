FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y php php-fpm php-mbstring wget unzip vim php-mysql

RUN		mkdir -p /var/www
RUN		wget https://wordpress.org/latest.zip
RUN		unzip latest.zip && rm -rf latest.zip
RUN		mv /wordpress /var/www/my_site/
RUN		rm -rf latest.zip

COPY		./conf/wp-config.php /var/www/my_site
COPY		./tools/start.sh .

EXPOSE		9000

VOLUME		["/var/www/my_site"]

CMD		sh start.sh
