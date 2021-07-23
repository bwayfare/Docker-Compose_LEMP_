FROM		debian:buster

RUN			apt-get update \
			&& apt-get upgrade -y \
			&& apt-get install -y nginx openssl

COPY		./conf/nginx.conf .

RUN			mkdir /etc/nginx/ssl_certs \
			&& openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out \
			/etc/nginx/ssl_certs/private.pem -keyout \
    		/etc/nginx/ssl_certs/public.key -subj "/C=RU/ST=KAZAN/L=KAZAN/OU=21school/" \
    		&& openssl rsa -noout -text -in /etc/nginx/ssl_certs/public.key

RUN			mv ./nginx.conf /etc/nginx/sites-available/my_site.conf \
			&& ln -s /etc/nginx/sites-available/my_site.conf /etc/nginx/sites-enabled/my_site.conf \
    		&& rm -Rf /etc/nginx/sites-enabled/default \
    		&& chown -R www-data /var/www/* \
			&& chmod -R 744 /var/www/*

ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"