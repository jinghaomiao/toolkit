#!/bin/bash

ENV_DIR=py27

pushd $(dirname $0)

echo "Current runtime version: $(python --version 2>&1)"

# Clean
rm -fr $ENV_DIR
python -m virtualenv $ENV_DIR

# Build
source $ENV_DIR/bin/activate
pip install -r std_requirements.txt
pip install -r py27_requirements.txt

popd
