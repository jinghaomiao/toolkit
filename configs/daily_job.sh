#!/usr/bin/env bash

################################## Usage.
echo "Add this to 'crontab -e':"
#     m h
echo "0 3 * * * $(realpath $0) run > /tmp/daily_job.log 2>&1"

################################## Utils.
function UpdateGitRepos() {
  for arg in "$@"; do
    cd "${arg}" && git remote update
  done
}

function PullGitRepos() {
  for arg in "$@"; do
    cd "${arg}" && git pull --rebase
  done
}

function EchoTime() {
  echo "========================="
  date "+%Y-%m-%d %H:%M:%S"
  echo "========================="
}

function Main() {
  ################################# Add your jobs here.
  UpdateGitRepos /home/aaron/work/apollo \
                 /home/aaron/work/toolkit
}

if [ "$1" = "run" ]; then
  EchoTime
  set -x
  Main
  set +x
  EchoTime
fi
