#!/bin/bash

CWD="$(realpath $(dirname $0))"
CACHE=${CWD}/.cache
CONF=${CWD}/squid.conf

mkdir -p ${CACHE}
docker run --name squid -d --restart=always \
  -p 8128:3128 \
  -v ${CONF}:/etc/squid3/squid.conf \
  -v ${CACHE}:/var/spool/squid3 \
  sameersbn/squid:3.3.8-23

