#!/usr/bin/env bash

DOCKERFILE=$1

set -x
CONTEXT=$(dirname ${DOCKERFILE})
SIMPLE_IMAGE_NAME=$(basename ${DOCKERFILE})
DEFAULT_TAG=${SIMPLE_IMAGE_NAME}:latest

docker build --network=host \
  -t ${DEFAULT_TAG} \
  -f ${DOCKERFILE} \
  ${CONTEXT}

docker tag ${DEFAULT_TAG} ${SIMPLE_IMAGE_NAME}:$(date "+%Y%m%d_%H%M%S")
