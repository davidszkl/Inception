#!/bin/sh
mysqld_safe
if mysqladmin -u root -h localhost --wait=5 ping; then
    mysql -u root -h localhost -e "CREATE DATABASE $MYSQL_DB;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
    CREATE USER  '$MYSQL_USER'@'wordpress.my_net' IDENTIFIED BY '$MYSQL_PWD';
    GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'wordpress.my_net';
    FLUSH PRIVILEGES;
"
fi
