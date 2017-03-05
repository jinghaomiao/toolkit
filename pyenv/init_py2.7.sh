#!/bin/bash

ENV_DIR=py2.7-std

pushd $(dirname $0)

echo "Current runtime version: $(python --version 2>&1)"

# Clean
rm -fr $ENV_DIR
python -m virtualenv $ENV_DIR

# Build
source $ENV_DIR/bin/activate
pip install -r std_requirements.txt
pip install -r py2.7_std_requirements.txt

popd
