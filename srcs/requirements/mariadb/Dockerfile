FROM debian:bullseye

RUN apt-get update \
	&& apt-get install -y mariadb-server \
	&& sed -i \
	"s/bind-address            = 127.0.0.1/bind-address            = 0.0.0.0/" \
	"/etc/mysql/mariadb.conf.d/50-server.cnf"

COPY tools/mariadb.sh /usr/local/bin/

ENTRYPOINT [ "sh", "/usr/local/bin/mariadb.sh" ]
