#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

apt-get install -y openssh-server
echo "Port 8020" >> /etc/ssh/sshd_config
service ssh restart
