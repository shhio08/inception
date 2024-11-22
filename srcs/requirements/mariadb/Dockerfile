FROM debian:bullseye

RUN apt-get update \
    && apt-get install -y vim mariadb-server

    # && mkdir /run/mysqld/ \
    # && adduser mysql \
    # && chown -R mysql:mysql /run/mysqld/ \
    # && touch /run/mysqld/mysqld.sock \
	# && sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# RUN set -ex; \
#     mkdir -p /var/lib/mysql/mysql; \
#     touch /var/lib/mysql/mysql/user.frm; \
#     rm -rf /var/lib/mysql /etc/mysql/mariadb.conf.d/50-mysqld_safe.cnf; \
#     mkdir -p /var/lib/mysql /run/mysqld; \
#     chown -R mysql:mysql /var/lib/mysql /run/mysqld; \
#     chmod 1777 /run/mysqld; \
#     mysql_install_db --user=mysql --ldata=/var/lib/mysql; \
#     find /etc/mysql/ -name '*.cnf' -print0 \
#             | xargs -0 grep -lZE '^(bind-address|log|user\s)' \
#             | xargs -rt -0 sed -Ei 's/^(bind-address|log|user\s)/#&/'

COPY ./init.sh docker-entrypoint.initdb.d/
RUN chmod +x docker-entrypoint.initdb.d/init.sh

ENTRYPOINT ["./docker-entrypoint.initdb.d/init.sh"]
# CMD ["mariadbd"]
# ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]
