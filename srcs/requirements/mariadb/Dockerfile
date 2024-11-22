FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y vim mariadb-server

COPY ./init.sh docker-entrypoint.initdb.d/
RUN chmod +x docker-entrypoint.initdb.d/init.sh

ENTRYPOINT ["./docker-entrypoint.initdb.d/init.sh"]
