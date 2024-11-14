#!/bin/bash

set -e

if [ -f flg ]; then
    rm flg
    mysqld_safe &
    sleep 2
    process=$(ps | grep -o "mysqld_safe")
    if [ "$process" != "mysqld_safe" ]; then
        exit 500
    fi

    echo "CREATE DATABASE $MYSQL_DATABASE ;" > build.sql
    echo "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED  BY '$MYSQL_PATHWORD' ;" >> build.sql
    echo "GRANT ALL PRIVILEGES ON *.* TO '$MYSQL_USER'@'%' ;" >> build.sql
    echo "FLUSH PRIVILEGES ;" >> build.sql
    echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PATHWORD' ;" >> build.sql

    mysql < build.sql
    mysqladmin shutdown -uroot -p$MYSQL_ROOT_PATHWORD
fi

exec mysqld_safe