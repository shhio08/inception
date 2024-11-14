FROM debian:buster

RUN apt-get update \
        && apt-get install -y mariadb-server \
        && apt-get install -y procps \
        && mkdir /run/mysql/

WORKDIR /var/lib/mysql/

COPY ./init.sh /var/lib/mysql/

RUN touch flg
RUN chmod +x ./init.sh

EXPOSE 3306/tcp

ENTRYPOINT ["./init.sh"]







# FROM debian:bullseye

# RUN apt-get update \
# 	&& apt-get install -y vim mariadb-server \
# 	&& sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf \
# 	&& mkdir -p /run/mysqld
# # 	&& adduser myspl \
# # 	&& chown -R mysql:mysql /run/mysqld

# # ENV MY_SQL_ROOT_PASSWORD=password

# WORKDIR /var/lib/mysql/

# COPY init.sh /var/lib/mysql/

# # RUN touch flg
# # COPY init.sql /docker-entrypoint-initdb.d/init.sql

# RUN chmod +x ./init.sh

# # /docker-entrypoint-initdb.d/のフォルダ内にある.sqlファイルは、コンテナ起動時に自動で実行される

# # EXPOSE 3306/tcp

# # ENTRYPOINT ["./init.sh"]
# ENTRYPOINT ["/bin/sh", "-c", "while :; do sleep 10; done"]
