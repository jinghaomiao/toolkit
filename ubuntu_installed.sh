#!/bin/sh

BACKUP_DIR=$1
dpkg --get-selections | grep -v deinstall | awk '{print $1}' > ${BACKUP_DIR}/ubuntu_installed_on_`date +%Y-%m-%d`.txt

