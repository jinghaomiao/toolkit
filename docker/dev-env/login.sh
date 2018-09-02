#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source installers/ENV.sh

TAG=$1
docker exec -it -u ${USER} ${TAG} bash
