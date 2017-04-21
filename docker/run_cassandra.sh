#!/bin/bash

pushd $(dirname $0)

PORT=8070
CASSANDRA_BROADCAST_ADDRESS=127.0.0.1
CASSANDRA_SEEDS=

mkdir cassandra_data
docker run -d --restart=always --name cassandra \
    -e CASSANDRA_BROADCAST_ADDRESS=${CASSANDRA_BROADCAST_ADDRESS} \
    -e CASSANDRA_SEEDS=${CASSANDRA_SEEDS} \
    -p ${PORT}:7000 \
    -v ${PWD}/cassandra_data:/var/lib/cassandra \
    cassandra:latest

echo "Current existing instances:"
docker ps -a

popd
