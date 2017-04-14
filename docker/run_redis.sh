#!/bin/sh

pushd $(dirname $0)

mkdir redis_data
docker run -d --restart=always --name redis -p 6379:6379 -v $PWD/redis_data:/data redis:latest

echo "Current existing instances:"
docker ps -a

popd
