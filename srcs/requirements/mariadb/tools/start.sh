if [ ! -f /tmp/success ]; then
    service mysql start

    sed -i "s/SQL_CONF_NAME/$SQL_DB_NAME/g" /tmp/wp_database.sql
    sed -i "s/SQL_CONF_USER/$SQL_DB_USER/g" /tmp/wp_database.sql
    sed -i "s/SQL_CONF_PASS/$SQL_DB_PASSWORD/g" /tmp/wp_database.sql
    sed -i "s/SQL_CONF_HOST/$SQL_DB_HOST/g" /tmp/wp_database.sql
    sed -i "s/SQL_CONF_ROOT_PASS/$SQL_CONF_ROOT_PASS/g" /tmp/wp_database.sql

    mysql -u root < /tmp/wp_database.sql
    mv /tmp/wp_database.sql /tmp/success

    /etc/init.d/mysql stop
fi

mysqld_safe