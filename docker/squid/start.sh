#!/bin/bash

CACHE=$(pwd)/.cache
CONF=$(pwd)/squid.conf

mkdir -p $CACHE
docker run --name squid -d --restart=always \
  --publish 8002:3128 \
  --volume $CONF:/etc/squid3/squid.conf \
  --volume $CACHE:/var/spool/squid3 \
  sameersbn/squid:3.3.8-20

