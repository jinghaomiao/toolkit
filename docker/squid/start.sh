#!/bin/bash

pushd $(dirname $0)

CACHE=$(pwd)/.cache
CONF=$(pwd)/squid.conf

mkdir -p $CACHE
docker run --name squid -d --restart=always \
  --publish 8999:3128 \
  --volume $CONF:/etc/squid3/squid.conf \
  --volume $CACHE:/var/spool/squid3 \
  sameersbn/squid:3.3.8-23

popd

