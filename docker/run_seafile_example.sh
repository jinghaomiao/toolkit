#!/usr/bin/env bash

cd $(dirname $0)

mkdir -p seafile_data
docker run -d --restart=always \
  --name seafile \
  -e SEAFILE_SERVER_HOSTNAME=<x.x.x.x> \
  -e SEAFILE_ADMIN_EMAIL=<x@x.com> \
  -e SEAFILE_ADMIN_PASSWORD=<x> \
  -v $PWD/seafile_data:/shared \
  -p <x>:80 \
  seafileltd/seafile
