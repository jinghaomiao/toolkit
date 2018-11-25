#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

IMAGE=xiangquan/glusterfs-change-port:5.1

echo "Building ${IMAGE}..."
docker build --network=host -t ${IMAGE} .
