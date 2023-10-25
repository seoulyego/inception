#!/bin/bash

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

mkdir -p /run/php

cd /var/www

wp core install \
	--path=/var/www \
	--url=$DOMAIN_NAME \
	--title=INCEPTION \
	--admin_user=$ADMIN_USER \
	--admin_password=$ADMIN_PWD \
	--admin_email=$ADMIN_EMAIL \
	--allow-root

wp user create $USER_ID $USER_EMAIL \
	--path=/var/www \
	--role=author \
	--user_pass=$USER_PWD \
	--allow-root

exec php-fpm7.4 -F
