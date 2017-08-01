#!/usr/bin/env bash

DOCKERFILE=$1

set -x
CONTEXT=$(dirname ${DOCKERFILE})
SIMPLE_TAG=$(basename ${DOCKERFILE}):$(date "+%Y%m%d_%H%M%S")

docker build --network=host \
  -t ${SIMPLE_TAG} \
  -f ${DOCKERFILE} \
  ${CONTEXT}
