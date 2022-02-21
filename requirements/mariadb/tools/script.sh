#!/bin/sh
service mysql start &
if mysqladmin -u root --wait=2 ping; then
    mysql -u root -h localhost -e "CREATE DATABASE $MYSQL_DB;
    ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
    CREATE USER  '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PWD';
    GRANT ALL ON $MYSQL_DB.* TO '$MYSQL_USER'@'%';
    FLUSH PRIVILEGES;
"
mysqladmin -u root -p$MYSQL_ROOT_PWD -h localhost shutdown
mysqld_safe
fi
