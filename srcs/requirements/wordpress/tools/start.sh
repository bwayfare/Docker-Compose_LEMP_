mkdir -p /run/php/
sed -i 's/;daemonize = yes/daemonize = no/g' /etc/php/7.3/fpm/pool.d/www.conf
echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf

sed -i -e "s|CONF_NAME|$SQL_DB_NAME|g" /var/www/my_site/wp-config.php
sed -i -e "s|CONF_USER|$SQL_DB_USER|g" /var/www/my_site/wp-config.php
sed -i -e "s|CONF_PASS|$SQL_DB_PASSWORD|g" /var/www/my_site/wp-config.php
sed -i -e "s|CONF_HOST|$SQL_DB_HOST:$DB_PORT|g" /var/www/my_site/wp-config.php

/usr/sbin/$(ls /usr/sbin/ |grep php | grep fpm) --nodaemonize