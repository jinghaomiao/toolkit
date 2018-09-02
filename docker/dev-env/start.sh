#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

TAG=$1
IMAGE=${DOCKER_REPO}:${TAG}

set -x
docker rm -f ${TAG} 2> /dev/null || true
docker run -it -d \
    --net=host --privileged \
    --name=${TAG} \
    --hostname ${TAG} \
    --add-host ${TAG}:127.0.0.1 \
    -v "$(cd ~/work; pwd)":/home/${USER}/work \
    -v "$(cd ~/.ssh; pwd)":/home/${USER}/.ssh \
    ${IMAGE}
set +x

bash login.sh ${TAG}
