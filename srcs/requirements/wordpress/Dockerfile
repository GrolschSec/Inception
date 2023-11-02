FROM debian:bullseye

COPY tools/wordpress.sh /usr/local/bin/

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	php-fpm \
	php-mysql \
	wget \
	mariadb-client \
	&& sed -i \
	"s/listen = \/run\/php\/php7.4-fpm.sock/listen = 9000/" \
	"/etc/php/7.4/fpm/pool.d/www.conf" \
	&& sed -i \
	"s/;clear_env = no/clear_env = no/" \
	"/etc/php/7.4/fpm/pool.d/www.conf"

ENTRYPOINT [ "sh", "/usr/local/bin/wordpress.sh" ]
