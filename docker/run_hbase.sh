#!/bin/sh

docker pull dajobe/hbase && \
mkdir hbase_data && \
docker run --name=hbase0 -h hbase-docker -d -v $PWD/hbase_data:/data dajobe/hbase
