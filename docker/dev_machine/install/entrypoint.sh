#!/usr/bin/env bash

set -x

# Map host user into container.
addgroup --gid ${HOST_GID} ${HOST_GROUP}
adduser --disabled-password --gecos '' ${HOST_USER} --uid ${HOST_UID} --gid ${HOST_GID}
usermod -aG sudo ${HOST_USER}
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

su ${HOST_USER}
