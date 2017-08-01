#!/usr/bin/env bash

set -x

HOST_USER=${USER}
HOST_UID=$(id -u)
HOST_GROUP=$(id -g -n)
HOST_GID=$(id -g)

docker run -it \
  --name=ubuntu14 --rm \
  -v /home/data:/home/data \
  --hostname ubuntu14 \
  -e HOST_USER=${HOST_USER} \
  -e HOST_UID=${HOST_UID} \
  -e HOST_GROUP=${HOST_GROUP} \
  -e HOST_GID=${HOST_GID} \
  ubuntu14.dockerfile
