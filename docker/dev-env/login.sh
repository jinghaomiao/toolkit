#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

DOCKERFILE=$(basename $1)
TAG=$(echo ${DOCKERFILE} | sed 's/\.Dockerfile$//g')

docker exec -it -u ${USER} ${TAG} bash
