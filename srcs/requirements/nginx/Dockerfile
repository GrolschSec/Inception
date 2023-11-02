FROM debian:bullseye

RUN apt-get update \
	&& apt-get upgrade -y \
	&& apt-get install -y \
	nginx \
	openssl \
	&& mkdir -p /etc/nginx/ssl \
	&& openssl req \
	-x509 \
	-nodes \
	-out /etc/nginx/ssl/inception.crt \
	-keyout /etc/nginx/ssl/inception.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=rlouvrie.42.fr/UID=rlouvrie"

COPY conf/default /etc/nginx/sites-available/

CMD [ "nginx", "-g", "daemon off;" ]
