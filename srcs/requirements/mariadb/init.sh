#!/bin/bash
set -e

# 環境変数の確認
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PASSWORD: $MYSQL_PASSWORD"
echo "MYSQL_ROOT_PASSWORD: $MYSQL_ROOT_PASSWORD"

mysqld_safe &

until mysqladmin ping -h localhost --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done
touch flg

echo "Running SQL script..."
echo "SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MYSQL_ROOT_PASSWORD') ;" > build.sql
# echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' ;" > build.sql
echo "CREATE DATABASE IF NOT EXISTS \`$MYSQL_DATABASE\`;" >> build.sql  # バッククォートに修正
echo "CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" >> build.sql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' ;" >> build.sql  # バッククォートに修正
echo "FLUSH PRIVILEGES ;" >> build.sql

mysql -u root -p"$MYSQL_ROOT_PASSWORD" < build.sql

# MariaDB プロセスを前面で実行し続ける
wait
