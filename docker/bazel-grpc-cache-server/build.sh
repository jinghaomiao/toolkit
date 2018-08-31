#!/usr/bin/env bash

docker build --network=host \
    -t xiangquan/bazel-grpc-cache-server:latest \
    $(dirname $0)
