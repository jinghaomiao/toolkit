#!/bin/bash

VER=2.7
ENV_DIR=py${VER}

# Install original python and its venv module.
# On Ubuntu:
#   sudo apt-get install python${VER} python-virtualenv python${VER}-dev

cd $(dirname $0)

# Clean
rm -fr $ENV_DIR || exit 1
python${VER} -m virtualenv $ENV_DIR || exit 1

# Build
source $ENV_DIR/bin/activate || exit 1
pip${VER} install -r std_requirements.txt || exit 1
