FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y php php-fpm php-mbstring wget unzip vim php-mysql

RUN			mkdir -p /var/www/my_site \
			&& wget -P /usr/bin/ https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar \
			&& chmod +x /usr/bin/wp-cli.phar \
			&& mv /usr/bin/wp-cli.phar /usr/bin/wp \
			&& cd /var/www/my_site/ \
			&& wp core download --allow-root \
			&& cd /

COPY		./conf/wp-config.php .
COPY		./tools/start.sh .

RUN			mkdir -p /run/php/ \
			&& sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf \
			&& echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE		9000

CMD			sh start.sh