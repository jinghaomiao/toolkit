#!/usr/bin/env bash

# Please provide.
SERVER="TODO"
VOLUME="TODO"

IMAGE=xiangquan/glusterfs-change-port:5.1
CONTAINER=glusterfs-client

set -e
docker run -it -d --privileged --name ${CONTAINER} ${IMAGE} /bin/bash

MOUNT_FROM="${SERVER}:/${VOLUME}"
MOUNT_TO="/mnt/glusterfs/${VOLUME}"
docker exec ${CONTAINER} bash -c \
    "mkdir -p ${MOUNT_TO} && mount -t glusterfs -o ro ${MOUNT_FROM} ${MOUNT_TO}"
