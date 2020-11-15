FROM debian:jessie

ENV DB_NAME=wordpress
ENV DB_USER=admin
ENV DB_PASSWORD=admin
ENV DB_HOST=unknown

RUN apt-get update 
RUN apt-get install wordpress -y
RUN mv /var/www/html/index.html /var/www/html/index.bak
COPY docker-entrypoint.sh docker-entrypoint.sh
RUN mv /usr/share/wordpress/wp-config-sample.php /etc/wordpress/config-localhost.php
RUN cp -R /usr/share/wordpress/* /var/www/html/

ENTRYPOINT ./docker-entrypoint.sh

EXPOSE 80