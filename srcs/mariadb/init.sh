#!/bin/bash
set -e

# 環境変数の確認
echo "MYSQL_DATABASE: $MYSQL_DATABASE"
echo "MYSQL_USER: $MYSQL_USER"
echo "MYSQL_PATHWORD: $MYSQL_PATHWORD"
echo "MYSQL_ROOT_PATHWORD: $MYSQL_ROOT_PATHWORD"

mysqld_safe &

until mysqladmin ping -h localhost --silent; do
  echo "Waiting for MariaDB to be ready..."
  sleep 2
done
touch flg

echo "Running SQL script..."
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PATHWORD' ;" > build.sql
echo "CREATE DATABASE \`$MYSQL_DATABASE\`;" >> build.sql  # バッククォートに修正
echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PATHWORD' ;" >> build.sql
echo "GRANT ALL PRIVILEGES ON \`$MYSQL_DATABASE\`.* TO '$MYSQL_USER'@'%' ;" >> build.sql  # バッククォートに修正
echo "FLUSH PRIVILEGES ;" >> build.sql

mysql < build.sql

# MariaDB プロセスを前面で実行し続ける
wait