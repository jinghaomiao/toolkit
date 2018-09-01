#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

DOCKERFILE=$(basename $1)
TAG=$(echo ${DOCKERFILE} | sed 's/\.Dockerfile$//g')
IMAGE=${DOCKER_REPO}:${TAG}

set -x
docker rm -f ${TAG} 2> /dev/null || true
docker run -it --rm \
    --net=host --privileged \
    --name=${TAG} \
    --hostname ${TAG} \
    --add-host ${TAG}:127.0.0.1 \
    -v $(realpath ~/work):/home/${USER}/work \
    ${IMAGE}
set +x
