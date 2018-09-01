#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

# Check current user.
if [ "$(whoami)" != "${USER}" ]; then
  echo "Current user is $(whoami) while not ${USER}!"
  exit 1
fi

WORK=${HOME}/work

TARGET_DIR="${WORK}/toolkit"
if [ ! -d "${TARGET_DIR}" ]; then
  git clone --depth=1 git@github.com:xiaoxq/toolkit.git "${TARGET_DIR}"
  cp -f "${TARGET_DIR}/configs/git/DOT_gitconfig_IN_HOME" "${HOME}/.gitconfig"
  echo "source ${TARGET_DIR}/configs/bashrc_local.sh" >> "${HOME}/.bashrc"
fi

TARGET_DIR="${HOME}/.bash-git-prompt"
if [ ! -d "${TARGET_DIR}" ]; then
  git clone --depth=1 https://github.com/magicmonty/bash-git-prompt.git "${TARGET_DIR}"
fi

TARGET_DIR="${WORK}/apollo"
if [ ! -d "${TARGET_DIR}" ]; then
  git clone --depth=1 "git@github.com:xiaoxq/apollo.git" "${TARGET_DIR}"
  cd "${TARGET_DIR}"
  git remote add upstream https://github.com/ApolloAuto/apollo.git
fi

cd "${WORK}"
bash
