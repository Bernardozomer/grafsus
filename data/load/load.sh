#! /bin/sh

apk add mysql-client

echo "Waiting for database to become available."

# Wait for the database to become available.
while ! mysqladmin ping -h"${DB_HOST}" --silent; do
    sleep 1
done

echo "Loading data into the database."

mysql -h"$DB_HOST" -udev -pdev < /data/load/pobr/pobr.sql

echo "Loading complete."
