#!/bin/bash

cd /var/www/html
wp config create --dbname=wordpress_db --dbuser=wordpress_user --dbpass=password --dbhost=db --allow-root
wp core install --url=localhost --title=title --admin_user=admin --admin_password=password --admin_email=admin@test.com --allow-root

exec php-fpm7.4 -F