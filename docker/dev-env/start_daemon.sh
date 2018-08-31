#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

DOCKERFILE=$(basename $1)
TAG=$(echo ${DOCKERFILE} | sed 's/\.Dockerfile$//g')
IMAGE=${DOCKER_REPO}:${TAG}

set -x
docker rm -f ${TAG} 2> /dev/null || true
docker run -it -d \
    --net=host --privileged \
    --name=${TAG} \
    --hostname ${TAG} \
    -v ~/work:/home/${USER}/work \
    -v ~/.ssh:/home/${USER}/.ssh \
    ${IMAGE}
set +x

bash login.sh ${DOCKERFILE}
