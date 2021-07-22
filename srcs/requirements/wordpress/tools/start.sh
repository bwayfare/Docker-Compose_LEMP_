if [ ! -d /var/www/my_site/wp-confg.php ]; then
mv ./wp-config.php /var/www/my_site/
chmod 744 /var/www/my_site/wp-config.php

sed -i "s/CONF_NAME/$SQL_DB_NAME/g" /var/www/my_site/wp-config.php
sed -i "s/CONF_USER/$SQL_DB_USER/g" /var/www/my_site/wp-config.php
sed -i "s/CONF_PASS/$SQL_DB_PASSWORD/g" /var/www/my_site/wp-config.php
sed -i "s/CONF_HOST/$SQL_DB_HOST:$DB_PORT/g" /var/www/my_site/wp-config.php

cd /var/www/my_site
wp core install --allow-root \
        --url=$WP_CONF_URL \
        --title=$WP_CONF_TITLE \
        --admin_user=$WP_CONF_ADMIN_NICK \
        --admin_password=$WP_CONF_ADMIN_PASS \
        --admin_email=$WP_CONF_ADMIN_EMAIL
    wp user create --allow-root $WP_CONF_USER_NICK $WP_CONF_USER_EMAIL --user_pass=$WP_CONF_USER_PASS

fi

/usr/sbin/$(ls /usr/sbin/ |grep php | grep fpm) --nodaemonize