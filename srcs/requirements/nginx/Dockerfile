FROM		debian:buster

RUN		apt-get update \
		&& apt-get upgrade -y \
		&& apt-get install -y nginx vim openssl

COPY		./conf/nginx.conf /etc/nginx/sites-available/my_site.conf
COPY		./tools/start.sh .

RUN		sh ./start.sh

ENTRYPOINT	/usr/sbin/nginx -g "daemon off;"
