if [ ! -d /var/run/mysqld/mysqld.sock ]; then
    mkdir -p /var/run/mysqld/
    mkfifo /var/run/mysqld/mysqld.sock
    touch /var/run/mysqld/mysqld.pid
    chmod 744 /var/run/mysqld/mysqld.sock
    chown -R mysql /var/run/mysqld
fi

service mysql start

sed -i -e "s|SQL_CONF_NAME|$DB_NAME|g" wp_database.sql
sed -i -e "s|SQL_CONF_USER|$DB_USER|g" wp_database.sql
sed -i -e "s|SQL_CONF_PASS|$DB_PASSWORD|g" wp_database.sql
sed -i -e "s|SQL_CONF_HOST|$DB_HOST|g" wp_database.sql

mysql  < wp_database.sql

if [ ! -d /var/lib/mysql/$SQL_CONF_NAME ]; then
    mysqladmin -u root password $SQL_CONF_ROOT_PASS
fI

/usr/bin/mysqld_safe

exec "$@"