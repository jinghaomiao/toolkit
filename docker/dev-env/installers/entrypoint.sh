#!/usr/bin/env bash
cd "$(dirname "${BASH_SOURCE[0]}")"
source ENV.sh

# Check current user.
if [ "$(whoami)" != "${USER}" ]; then
  echo "Current user is $(whoami) while not ${USER}!"
  exit 1
fi

WORK="${HOME}/work"

# Clone toolkit repo.
TOOLKIT="${WORK}/toolkit"
if [ ! -d "${TOOLKIT}" ]; then
  git clone --depth=1 git@github.com:xiaoxq/toolkit.git "${TOOLKIT}"
fi
cp -f "${TOOLKIT}/configs/git/DOT_gitconfig_IN_HOME" "${HOME}/.gitconfig"
BASHRC_CONF="source ${TOOLKIT}/configs/bashrc_local.sh"
grep -q "${BASHRC_CONF}" "${HOME}/.bashrc" || echo "${BASHRC_CONF}" >> "${HOME}/.bashrc"

# Clone bash-git-prompt repo.
BASH_GIT_PROMPT="${HOME}/.bash-git-prompt"
if [ ! -d "${BASH_GIT_PROMPT}" ]; then
  git clone --depth=1 https://github.com/magicmonty/bash-git-prompt.git "${BASH_GIT_PROMPT}"
fi

# Clone apollo repo.
APOLLO="${WORK}/apollo"
if [ ! -d "${APOLLO}" ]; then
  git clone --depth=1 "git@github.com:xiaoxq/apollo.git" "${APOLLO}"
  cd "${APOLLO}"; git remote add upstream https://github.com/ApolloAuto/apollo.git
fi

cd "${WORK}"
bash
