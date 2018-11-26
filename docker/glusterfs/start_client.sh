#!/usr/bin/env bash

# Please provide.
SERVER="TODO"
VOLUME="TODO"

IMAGE=xiangquan/glusterfs-change-port:5.1
CONTAINER=glusterfs-client

set -e
docker run -it -d --privileged --name ${CONTAINER} ${IMAGE} /bin/bash
docker exec ${CONTAINER} bash -c \
    "mount -t glusterfs -o ro ${SERVER}:/${VOLUME} /mnt/nfs"
