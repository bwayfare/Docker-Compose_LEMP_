if [ ! -d /etc/nginx/ssl_certs ]; then
    mkdir /etc/nginx/ssl_certs
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out \
    /etc/nginx/ssl_certs/private.pem -keyout \
    /etc/nginx/ssl_certs/public.key -subj "/C=RU/ST=KAZAN/L=KAZAN/OU=21school/"
    openssl rsa -noout -text -in /etc/nginx/ssl_certs/public.key
fi

sed -i "s/DOMAIN_NAME/$DOMAIN_NAME/g" /tmp/nginx.conf

mv /tmp/nginx.conf /etc/nginx/sites-available/my_site.conf
rm -rf /etc/nginx/sites-enabled/my_site.conf
ln -s /etc/nginx/sites-available/my_site.conf /etc/nginx/sites-enabled/my_site.conf
rm -rf /etc/nginx/sites-enabled/default

/usr/sbin/nginx -g "daemon off;"