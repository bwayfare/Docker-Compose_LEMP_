FROM		debian:buster

RUN		apt-get update \
		&& apt-get install -y php php-fpm php-mbstring wget unzip vim supervisor

RUN		mkdir -p /var/www

RUN		wget https://wordpress.org/latest.zip
RUN		unzip latest.zip && rm -rf latest.zip
COPY		./conf/wp-config.php .

COPY		./script/start.sh .
COPY		./conf/supervisord.conf /etc/supervisord.conf
EXPOSE		3306
RUN		mkdir -p /run/php/
RUN		touch /run/php/$(ls /etc/init.d/ | grep php | grep fpm).sock
CMD		sh start.sh
#CMD		/usr/sbin/(grep php-fpm) -g "daemon off;"
#/usr/sbin/nginx -g "daemon off;"
