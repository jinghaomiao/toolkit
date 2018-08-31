#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

DOCKERFILE=$(basename $1)
TAG=$(echo ${DOCKERFILE} | sed 's/\.Dockerfile$//g')
IMAGE=${DOCKER_REPO}:${TAG}

echo "Building ${IMAGE} from ${DOCKERFILE}..."
docker build \
    -f ${DOCKERFILE} \
    -t ${IMAGE} \
    --build-arg USER=${USER} \
    --network=host \
    .

export IMAGE=${IMAGE}
echo "To push: docker push ${IMAGE}"
