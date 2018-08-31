#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

# Check current user.
if [ "$(whoami)" != "${USER}" ]; then
  echo "Current user is $(whoami) while not ${USER}!"
  exit 1
fi

function CloneMissing() {
  REPO="$1"
  TARGET_DIR="$2"
  if [ ! -d "${TARGET_DIR}" ]; then
    git clone --depth=1 "${REPO}" "${TARGET_DIR}"
  fi
}

WORK=${HOME}/work
CloneMissing "git@github.com:xiaoxq/apollo.git" "${WORK}/apollo"
CloneMissing "git@github.com:xiaoxq/toolkit.git" "${WORK}/toolkit"
CloneMissing "https://github.com/magicmonty/bash-git-prompt.git" "${HOME}/.bash-git-prompt"

cp -f "${WORK}/toolkit/configs/git/DOT_gitconfig_IN_HOME" "${HOME}/.gitconfig"
echo "source ${WORK}/toolkit/configs/bashrc_local.sh" >> "${HOME}/.bashrc"

cd "${WORK}"
bash
