service mysql start

sed -i "s/SQL_CONF_NAME/$SQL_DB_NAME/g" wp_database.sql
sed -i "s/SQL_CONF_USER/$SQL_DB_USER/g" wp_database.sql
sed -i "s/SQL_CONF_PASS/$SQL_DB_PASSWORD/g" wp_database.sql
sed -i "s/SQL_CONF_HOST/$SQL_DB_HOST/g" wp_database.sql
sed -i "s/SQL_CONF_ROOT_PASS/$SQL_CONF_ROOT_PASS/g" wp_database.sql

mysql -u root < wp_database.sql

/etc/init.d/mysql stop

mysqld_safe