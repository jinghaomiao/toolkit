#!/bin/bash

cd $(dirname $0)
mkdir hbase_data
docker run -d --restart=always --name=hbase -h hbase-docker -v $PWD/hbase_data:/data dajobe/hbase

echo "Current existing instances:"
docker ps -a
