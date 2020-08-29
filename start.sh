#!/bin/bash

source .env

download_dump() {
  local users="https://dtapi.if.ua/~yurkovskiy/dtapi_full.sql"
  local sessions="https://dtapi.if.ua/~yurkovskiy/IF-108/sessions.sql"
  wget -N $users -P ./db_container
  wget -N $sessions -P ./db_container
}

dockerize() {
  docker network create "$DOCKER_NETWORK"

  docker run --name "$DOCKER_MYSQL" \
    -p :3306 \
    --network "$DOCKER_NETWORK" \
    -e MYSQL_USER="$MYSQL_USER" \
    -e MYSQL_PASSWORD="$MYSQL_PASSWORD" \
    -e MYSQL_ROOT_PASSWORD="$MYSQL_PASSWORD" \
    -e MYSQL_DATABASE="$MYSQL_DATABASE" \
    -v "$BASEDIR/db_container:/docker-entrypoint-initdb.d" \
    -d mysql:5.7

  docker build -t "$DOCKER_BE_IMAGE" .

  docker run --name "$DOCKER_BE" \
    -p 8001:80 \
    --network "$DOCKER_NETWORK" \
    -v "$APP_BE:/var/www/html" \
    -d "$DOCKER_BE_IMAGE"

  docker run --name "$DOCKER_FE" \
    -p 8002:80 \
    --network "$DOCKER_NETWORK" \
    -v "$APP_FE:/usr/local/apache2/htdocs/" \
    -d httpd:2.4.46-alpine

  docker run --name "$DOCKER_LB" \
    -p 8005:80 \
    --network "$DOCKER_NETWORK" \
    -v "$BASEDIR/lb_container/nginx.conf:/etc/nginx/conf.d/default.conf:ro" \
    -d nginx:1.19.2-alpine
}

download_dump
dockerize
