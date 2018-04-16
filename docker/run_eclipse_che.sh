#!/usr/bin/env bash

cd $(dirname $0)

LOCAL_PATH=$(pwd)/che

mkdir -p ${LOCAL_PATH}
docker run -it \
    -v /var/run/docker.sock:/var/run/docker.sock \
    -v ${LOCAL_PATH}:/data \
    eclipse/che start

