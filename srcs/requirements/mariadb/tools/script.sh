#!/bin/bash

#varaibles used:
# MARIADB_ROOT_PASSWD
# MARIADB_WPUSER_PASSWD

service mysql start

if [ ! -d /var/lib/mysql/wordpress_db ] ; then

#mysql_secure_installation //does not work i think

mysql --no-defaults -u root -e "use mysql; \
	update user SET PASSWORD=PASSWORD(\"$MARIADB_ROOT_PASSWD\") \
	WHERE USER='root';"

#grant option automatically creates the user
mysql --no-defaults -u root -p"$MARIADB_ROOT_PASSWD" -e " \
	CREATE DATABASE wordpress_db; \
	GRANT ALL ON wordpress_db.* TO 'wpuser'@'%' \
	IDENTIFIED BY \"$MARIADB_WPUSER_PASSWD\" WITH GRANT OPTION; \
	FLUSH PRIVILEGES;"

fi

service mysql stop

exec mysqld -u root --datadir="/var/lib/mysql"
