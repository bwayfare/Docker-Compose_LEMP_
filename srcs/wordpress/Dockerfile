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
#RUN		echo "listen = 9000" >> /etc/php7/php-fpm.d/www.conf
#RUN		mkfifo /run/php/$(ls /etc/init.d/ | grep php | grep fpm).sock

VOLUME		["/var/www/my_site"]

#CMD		sh start.sh
