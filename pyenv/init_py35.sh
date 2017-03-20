#!/bin/bash

VER=3.5
ENV_DIR=py35

# Install original python and its venv module.
# On Ubuntu:
#   sudo apt-get install python${VER} python${VER}-venv python${VER}-dev

pushd $(dirname $0)

# Clean
rm -fr $ENV_DIR || exit 1
python${VER} -m venv $ENV_DIR || exit 1

# Build
source $ENV_DIR/bin/activate || exit 1
pip${VER} install -r std_requirements.txt || exit 1

popd
