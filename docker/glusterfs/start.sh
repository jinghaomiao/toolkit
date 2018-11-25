#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE[0]}")"

KNOWN_PEER=$1
IMAGE=xiangquan/glusterfs-change-port:5.1
BRICKS=(
  # Add your bricks here.
  /home/data/glusterfs
)


# Get volume conf from bricks.
VOLUMES=""
for brick in ${BRICKS[@]}; do
  mkdir -p ${brick}
  VOLUMES="${VOLUMES} -v ${brick}:${brick}"
done

CONTAINER=glusterfs

set -x
docker run -it -d \
    --name ${CONTAINER} \
    --net host \
    --privileged \
    ${VOLUMES} \
    ${IMAGE} /bin/bash

if [ ! -z "${KNOWN_PEER}" ]; then
  docker exec ${CONTAINER} bash -c "gluster peer probe ${KNOWN_PEER}"
fi
