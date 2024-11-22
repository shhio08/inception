#!/bin/bash

cd /var/www/html
if [ ! -f /var/www/html/index.php ]; then
    wp core download --allow-root
else
    echo "WordPress already installed"
fi

if [ ! -f /var/www/html/wp-config.php ]; then
    wp config create --dbname=wordpress_db --dbuser=wordpress_user --dbpass=password --dbhost=db --allow-root
else
    echo "wp-config.php already exists. Skipping config creation."
fi

if ! wp core is-installed --allow-root; then
    wp core install --url=https://stakimot.42.fr --title=title --admin_user=admin --admin_password=password --admin_email=admin@test.com --allow-root
else
    echo "WordPress is already installed. Skipping installation."
fi

exec php-fpm7.4 -F