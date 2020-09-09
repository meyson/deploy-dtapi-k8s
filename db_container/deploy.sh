#!/bin/bash

# If a command fails, set -e will make the whole script exit,
# instead of just resuming on the next line.
set -e
# Treat unset variables as an error, and immediately exit.
set -u

BASEDIR=$(dirname "$0")

TAG=$(git rev-parse --short HEAD)
NAME_TAG="$IMAGE_ROOT:$TAG"

docker build --tag "$NAME_TAG" "$BASEDIR"
docker push "$NAME_TAG"
docker image inspect --format="{{index .RepoDigests 0}}" "$NAME_TAG"

# add latest tag
gcloud container images add-tag --quiet \
  "$NAME_TAG" "${IMAGE_ROOT}:latest"

kubectl set image deployment "$DEPLOYMENT" "$CONTAINER=$NAME_TAG"
