#!/bin/sh

docker pull dajobe/hbase && \
mkdir hbase_data && \
docker run -d --restart=always --name=hbase0 -h hbase-docker -v $PWD/hbase_data:/data dajobe/hbase
