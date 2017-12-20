#!/usr/bin/env bash

# Arguments
HOST=$1
HOST_USER=$2
HOST_PASS=$3

# Configs
LOCAL_CERT=~/.ssh/id_rsa.pub


############################
CERT_CONTENT=$(cat "${LOCAL_CERT}")
if [ "${HOST_USER}" != "root" ]; then
  HOST_HOME="/home/${HOST_USER}"
else
  HOST_HOME="/root"
fi
HOST_CERT="${HOST_HOME}/.ssh/authorized_keys"

HAS_CERT=$(sshpass -p ${HOST_PASS} ssh ${HOST_USER}@${HOST} \
    "cat ${HOST_CERT}" | grep "${CERT_CONTENT}")
if [ -z "${HAS_CERT}" ]; then
  sshpass -p ${HOST_PASS} ssh ${HOST_USER}@${HOST} \
      "echo '${CERT_CONTENT}' >> ${HOST_CERT}"
else
  echo "Cert has existed on host."
fi

ssh ${HOST_USER}@${HOST} "echo Done"
