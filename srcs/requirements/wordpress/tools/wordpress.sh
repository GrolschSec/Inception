
sleep 10

if [ ! -f /var/www/html/wp-config.php ];then
	mkdir -p /var/www/
	mkdir -p $WP_PATH
	cd $WP_PATH
	wget https://github.com/wp-cli/wp-cli-bundle/releases/download/v2.7.0/wp-cli-2.7.0.phar
	chmod +x wp-cli-2.7.0.phar
	mv wp-cli-2.7.0.phar /usr/local/bin/wp
	wp core download --allow-root
	wp config create --dbhost=mariadb \
		--dbname=$SQL_DATABASE \
		--dbuser=$SQL_USER \
		--dbpass=$SQL_PASSWORD \
		--allow-root
	wp core install --allow-root \
		--url=$WP_DOMAIN \
		--title=$WP_TITLE \
		--admin_user=$WP_ADMIN \
		--admin_email=$WP_ADMIN_EMAIL \
		--admin_password=$WP_ADMIN_PWD \
		--skip-email
	wp user create --allow-root \
		"$WP_USER" "$WP_USER_EMAIL" \
		--user_pass="$WP_USER_PWD" \
		--role=contributor
	wp --allow-root theme install twentyseventeen --activate
fi

mkdir -p /run/php

php-fpm7.4 -F
