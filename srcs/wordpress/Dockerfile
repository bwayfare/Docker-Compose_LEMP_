FROM		debian:buster

RUN		apt-get update \
		&& apt-get install -y php php-fpm php-mbstring wget unzip vim

RUN		mkdir -p /var/www

RUN		wget https://wordpress.org/latest.zip
RUN		unzip latest.zip && rm -rf latest.zip
RUN		mv /wordpress /var/www/my_site/
COPY		./conf/wp-config.php /var/www/my_site

COPY		./script/start.sh .
EXPOSE		9000

RUN		mkdir -p /run/php/
RUN		mkfifo /run/php/$(ls /etc/init.d/ | grep php | grep fpm).sock

CMD		sh start.sh
