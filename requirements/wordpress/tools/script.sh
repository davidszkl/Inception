sleep 10
wp core install --allow-root --url='http://localhost' --title="Title" --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_MAIL
wp user create --allow-root  wpuser wpuser@example.com --role=author --user_pass="$WP_USER_PWD"
php-fpm7 --nodaemonize
