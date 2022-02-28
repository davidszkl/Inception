#!/bin/bash

service mysql start

if [ ! -d /var/lib/mysql/wordpress_db ] ; then

mysql --no-defaults -u root -e "
	CREATE DATABASE $WP_DATABASE;
	ALTER USER 'root'@'%' IDENTIFIED BY '$MARIADB_ROOT_PWD';
	CREATE USER '$MARIADB_WPUSER'@'%' IDENTIFIED BY '$MARIADB_WPUSER_PWD';
	GRANT ALL PRIVILEGES ON $WP_DATABASE TO $MARIADB_WPUSERA'%';
	FLUSH PRIVILEGES;
	"
fi

service mysql stop

exec mysqld -u root