#!/bin/bash

pushd $(dirname $0)

CACHE=$(pwd)/.cache
CONF=$(pwd)/squid.conf

mkdir $CACHE
docker run --name squid -d --restart=always \
  -p 8999:3128 \
  -v $CONF:/etc/squid3/squid.conf \
  -v $CACHE:/var/spool/squid3 \
  sameersbn/squid:3.3.8-23

popd
