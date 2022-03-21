#!/bin/bash
php -v

sleep 2
cd /var/www/html/wordpress/public_html
wp core install --allow-root	--url='https://dszklarz.42.fr'					\
								--title="Dszklarz website"					\
								--admin_name=dszklarz						\
								--admin_password=$WP_ADMIN_PASSWD			\
								--admin_email=david.szklarzewski@gmail.com
wp user create --allow-root 	wpuser										\
								wpuser@example.com 							\
								--role=author								\
								--user_pass="$MARIADB_WPUSER_PASSWD"

service php8.1-fpm start
service php8.1-fpm stop

/usr/sbin/php-fpm8.1 --nodaemonize
