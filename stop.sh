#!/bin/bash

source .env

docker rm -f "$DOCKER_BE"
docker rm -f "$DOCKER_FE"
docker rm -f "$DOCKER_LB"
docker rm -f "$DOCKER_MYSQL"

docker rmi "$DOCKER_BE_IMAGE"

docker network rm "$DOCKER_NETWORK"
