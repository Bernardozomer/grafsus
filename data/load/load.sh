#! /bin/sh

apk add mysql-client 

# Wait for the database to become available.
while ! mysqladmin ping -h"${DB_HOST}" --silent; do
    sleep 1
done

mysql -h"$DB_HOST" -udev -pdev < /data/load/pobr/pobr.sql
