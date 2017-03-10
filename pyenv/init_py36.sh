#!/bin/bash
# Install original python and its venv module.
# On Ubuntu: sudo apt-get install python3.6 python3.6-venv python3.6-dev

ENV_DIR=py36

pushd $(dirname $0)

# Clean
rm -fr $ENV_DIR
python3.6 -m venv $ENV_DIR

# Build
source $ENV_DIR/bin/activate
pip install -r std_requirements.txt
pip install -r py36_requirements.txt

popd
