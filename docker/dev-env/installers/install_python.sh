#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

${CONDA_PATH}/bin/conda env update -f py27.yml
${CONDA_PATH}/bin/conda env update -f py37.yml
