#!bin/sh
if ! test -f var/www/wordpress/wp-config.php; then
    sleep 10
    mv wp-config.php /var/www/wordpress;
    wp core download --path=/var/www/wordpress
    wp core install --path=/var/www/wordpress --allow-root --url='http://localhost' --title="Title" --admin_name=$WP_ADMIN --admin_password=$WP_ADMIN_PWD --admin_email=$WP_ADMIN_MAIL
    wp user create --path=/var/www/wordpress --allow-root  wpuser wpuser@example.com --role=author --user_pass="$WP_USER_PWD"
fi
php-fpm7 --nodaemonize