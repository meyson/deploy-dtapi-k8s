#!/bin/bash

BASE_DIR="/docker-entrypoint-initdb.d"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/dtapi_full.sql"
mysql -u "$MYSQL_USER" -p"$MYSQL_PASSWORD" "$MYSQL_DATABASE" < "$BASE_DIR/sessions.sql"
