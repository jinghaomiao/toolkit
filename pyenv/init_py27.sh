#!/bin/bash
# Install original python and its venv module.
# On Ubuntu: sudo apt-get install python2.7 virtualenv python2.7-dev

ENV_DIR=py27

pushd $(dirname $0)

# Clean
rm -fr $ENV_DIR
python2.7 -m virtualenv $ENV_DIR

# Build
source $ENV_DIR/bin/activate
pip install -r std_requirements.txt
pip install -r py27_requirements.txt

popd
