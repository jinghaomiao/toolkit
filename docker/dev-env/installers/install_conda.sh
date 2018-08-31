#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

# Install Miniconda2.
wget https://repo.continuum.io/miniconda/Miniconda2-latest-Linux-x86_64.sh
bash Miniconda2-latest-Linux-x86_64.sh -b -p ${CONDA_PATH}
${CONDA_PATH}/bin/conda update -n base conda

echo "PATH=\${PATH}:${CONDA_PATH}/bin" >> /home/${USER}/.bashrc

# Clean up.
rm -f Miniconda2-latest-Linux-x86_64.sh
