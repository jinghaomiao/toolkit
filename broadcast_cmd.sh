#!/usr/bin/env bash

# Arguments
HOSTS=$1
HOST_USER=$2
HOST_PASS=$3
CMD=$4

set -x

for h in ${HOSTS}
do
  sshpass -p "${HOST_PASS}" ssh ${HOST_USER}@${h} "${CMD}"
done
