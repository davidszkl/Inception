#!/bin/bash

service mysql start

if [ ! -d /var/lib/mysql/wordpress_db ] ; then

	mysql --no-defaults -u root -e "use mysql;						\
		update user SET PASSWORD=PASSWORD(\"$MARIADB_ROOT_PWD\")	\
		WHERE USER='root';"

	mysql --no-defaults -u root -p"$MARIADB_ROOT_PWD" -e "			\
		CREATE DATABASE wordpress_db;								\
		GRANT ALL ON wordpress_db.* TO 'wpuser'@'%'					\
		IDENTIFIED BY \"$MARIADB_WPUSER_PWD\" WITH GRANT OPTION;	\
		FLUSH PRIVILEGES;"

fi

service mysql stop

exec mysqld -u root --datadir="/var/lib/mysql"
