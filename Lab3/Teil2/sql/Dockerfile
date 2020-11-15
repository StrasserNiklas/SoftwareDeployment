FROM debian:jessie


USER root
RUN apt-get update
RUN DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server

# DB data
ENV DB_NAME=dbwordpress
ENV DB_USER=nik
ENV DB_PASSWORD=12345678

COPY docker-entrypoint.sh docker-entrypoint.sh
COPY install.sh install.sh
COPY init.sql /docker-entrypoint-initdb.d/
RUN ./install.sh
ENTRYPOINT ./docker-entrypoint.sh
EXPOSE 8080
