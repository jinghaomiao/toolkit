#!/usr/bin/env bash

################################## Usage.
echo "Add this to 'crontab -e':"
#     m h
echo "* 3 * * * $(realpath $0) > /tmp/daily_job.log 2>&1"

################################## Utils.
function UpdateGitRepos() {
  for arg in "$@"; do
    cd "${arg}" && git remote update
  done
}

function EchoTime() {
  echo "========================="
  date "+%Y-%m-%d %H:%M:%S"
  echo "========================="
}

EchoTime
set -x
################################# Add your jobs here.


################################# End of your jobs.
set +x
EchoTime
