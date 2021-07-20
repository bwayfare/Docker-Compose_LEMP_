FROM		debian:buster

RUN		apt-get update \
		&& apt-get install -y php php-fpm php-mbstring wget unzip vim php-mysql

RUN		mkdir -p /var/www

RUN		wget https://wordpress.org/latest.zip
RUN		unzip latest.zip && rm -rf latest.zip
RUN		mv /wordpress /var/www/my_site/
COPY		./conf/wp-config.php /var/www/my_site

COPY		./script/start.sh .
EXPOSE		9000

RUN		mkdir -p /run/php/
RUN		sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf \
		&& echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

VOLUME		["/var/www/my_site"]
