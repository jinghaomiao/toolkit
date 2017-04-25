#!/bin/bash

pushd $(dirname $0)

ADDRESS=172.19.32.28
SEEDS=172.19.57.37
DATA_DIR=data

mkdir ${DATA_DIR}
docker run -d --name cassandra \
    -e CASSANDRA_BROADCAST_ADDRESS=${ADDRESS} \
    -e CASSANDRA_SEEDS=${SEEDS} \
    -p 7000:7000 -p 9042:9042 -p 7199:7199 \
    -v ${PWD}/${DATA_DIR}:/var/lib/cassandra \
    cassandra:latest

echo "Current existing instances:"
docker ps -a

popd
