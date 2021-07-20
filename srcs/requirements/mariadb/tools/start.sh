mkdir -p /var/run/mysqld/
mkfifo /var/run/mysqld/mysqld.sock
chmod 777 /var/run/mysqld/mysqld.sock
chown -R mysql /var/run/mysqld

service mysql start

sed -i -e "s|CONF_NAME|$DB_NAME|g" wp_database.sql
sed -i -e "s|CONF_USER|$DB_USER|g" wp_database.sql
sed -i -e "s|CONF_PASS|$DB_PASSWORD|g" wp_database.sql
sed -i -e "s|CONF_HOST|$DB_HOST|g" wp_database.sql

mysql  < wp_database.sql

/usr/bin/mysqld_safe
