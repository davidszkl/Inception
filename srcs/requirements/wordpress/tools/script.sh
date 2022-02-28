#!/bin/bash

sleep 2
cd /var/www/html/wordpress/public_html
wp core install --allow-root --url='http://localhost'		\
				--title="Sample Title"						\
				--admin_name=mlefevre						\
				--admin_password=$WP_ADMIN_PWD				\
				--admin_email=david.szklarzewski@gmail.com
wp user create --allow-root			\
				wpuser				\
				wpuser@example.com	\
				--role=author		\
				--user_pass="$MARIADB_WPUSER_PWD"

service php8.1-fpm start
service php8.1-fpm stop

/usr/sbin/php-fpm8.1 --nodaemonize