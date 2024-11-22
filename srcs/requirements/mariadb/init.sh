#!/bin/bash
# set -e


# echo "installing mariadb-server..."
# apt-get install -y mariadb-server

echo "change bind-address..."
sed -i 's/^bind-address\s*=\s*127\.0\.0\.1/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

# socketが見つからないというエラーでmkdirしてたけど、これのせいで立ち上がらなくなっていて（競合してます的な）これ消したら治った
# mkdir  -p /run/mysqld/
# adduser mysql
# chown -R mysql:mysql /run/mysqld/


mysqld_safe &


until mysqladmin ping -h localhost --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done



# if ! mysqladmin ping -h localhost --silent; then
#     echo "Error: MariaDB failed to start"
#     exit 1
# fi

# service mariadb start
# sleep 5

echo "Running SQL script..."
# echo "SET PASSWORD FOR 'root'@'localhost'= PASSWORD('${MYSQL_ROOT_PASSWORD}') ;" > build.sql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" > build.sql
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;" >> build.sql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> build.sql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%';" >> build.sql
echo "FLUSH PRIVILEGES ;" >> build.sql

mysql -uroot -p${MYSQL_ROOT_PASSWORD} < build.sql

# #MariaDB プロセスを前面で実行し続ける
wait
# exec "$@"
