#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

ls *.Dockerfile | while read -r DOCKERFILE; do
  source build.sh ${DOCKERFILE}
  docker push ${IMAGE}
done
