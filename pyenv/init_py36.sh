#!/bin/bash

ENV_DIR=py36

pushd $(dirname $0)

echo "Current runtime version: $(python --version 2>&1)"

# Clean
rm -fr $ENV_DIR
python3.6 -m venv $ENV_DIR

# Build
source $ENV_DIR/bin/activate
pip install -r std_requirements.txt
pip install -r py36_requirements.txt

popd
