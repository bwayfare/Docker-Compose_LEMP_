if [ ! -e /etc/sssl_certs/public.key ]; then
    mkdir /etc/nginx/ssl_certs
    openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes -out /etc/nginx/ssl_certs/private.pem -keyout \
    /etc/nginx/ssl_certs/public.key -subj "/C=RU/ST=KAZAN/L=KAZAN/OU=21school/"
    openssl rsa -noout -text -in /etc/nginx/ssl_certs/public.key
    mv ./nginx.conf /etc/nginx/sites-available/my_site.conf
    ln -s /etc/nginx/sites-available/my_site.conf /etc/nginx/sites-enabled/my_site.conf
    rm -Rf /etc/nginx/sites-enabled/default
    chown -R www-data /var/www/*
    chmod -R 755 /var/www/*
fi