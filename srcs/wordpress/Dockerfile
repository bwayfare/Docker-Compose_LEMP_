FROM		debian:buster

RUN			apt-get update \
			&& apt-get install -y php php-fpm php-mbstring wget unzip vim

RUN			mkdir /tmp/wordpress \
			mkdir -p /var/www

WORKDIR		/tmp/wordpress
RUN			wget https://wordpress.org/latest.zip
RUN			unzip latest.zip
RUN			mv wordpress /var/www/my_site
COPY		./conf/wp-config.php /var/www/my_site/

RUN			chown -R www-data /var/www/*
RUN			chmod -R 755 /var/www/*

COPY		./script/start.sh .

RUN			sh ./start.sh
