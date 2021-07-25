FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y nginx openssl

COPY		./conf/nginx.conf /tmp
COPY		./tools/start.sh /tmp/

RUN			chown -R www-data /var/www/* \
			&& chmod -R 744 /var/www/*

CMD 		sh /tmp/start.sh