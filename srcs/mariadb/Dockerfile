FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y vim mariadb-server \
    && mkdir /run/mysql/ \
	&& sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf
# WORKDIR /var/lib/mysql/

COPY ./init.sh docker-entrypoint.initdb.d/
RUN chmod +x docker-entrypoint.initdb.d/init.sh


ENTRYPOINT ["./docker-entrypoint.initdb.d/init.sh"]
# ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]