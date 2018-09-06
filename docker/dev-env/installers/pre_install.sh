#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

apt-get update -y
apt-get install -y \
    apt-transport-https \
    apt-utils \
    bzip2 \
    g++ \
    git \
    rsync \
    sudo \
    tree \
    unrar \
    vim \
    wget

# Add a password-less sudo user.
adduser --disabled-password --gecos '' ${USER}
usermod -aG sudo ${USER}
echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
