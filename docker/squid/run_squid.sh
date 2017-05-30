#!/bin/bash

CACHE=$(pwd)/.cache
CONF=$(pwd)/squid.conf

cd $(dirname $0)
mkdir $CACHE
docker run --name squid -d --restart=always \
  -p 8128:3128 \
  -v $CONF:/etc/squid3/squid.conf \
  -v $CACHE:/var/spool/squid3 \
  sameersbn/squid:3.3.8-23

