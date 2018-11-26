#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

# Please provide.
KNOWN_PEER=""
BRICKS=(
  /home/data/glusterfs
)

IMAGE=xiangquan/glusterfs-change-port:5.1
CONTAINER=glusterfs-server

# Get volume conf from bricks.
VOLUMES=""
for brick in ${BRICKS[@]}; do
  sudo mkdir -m 777 -p ${brick}
  MOUNT_POINT=$(dirname "${brick}")
  VOLUMES="${VOLUMES} -v ${MOUNT_POINT}:${MOUNT_POINT}"
done

set -x
docker run -it -d \
    --name ${CONTAINER} \
    --net host \
    --privileged \
    ${VOLUMES} \
    ${IMAGE} /bin/bash
set +x

docker exec ${CONTAINER} bash -c "service glusterd start"

if [ ! -z "${KNOWN_PEER}" ]; then
  docker exec ${CONTAINER} bash -c "gluster peer probe ${KNOWN_PEER}"
fi
