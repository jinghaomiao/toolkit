# Workspace
alias w="cd ${WS}"

# Path
alias d="cd ${DT}"
alias dl="cd ${DL}"
export PATH="${PATH}:${BIN}"

# Static tools.
alias ssQt5="nohup ${SEA}/bin/Shadowsocks-Qt5-3.0.0-x86_64.AppImage > /dev/null 2>&1 &"

# History
export HISTSIZE=100000
export HISTFILESIZE=200000
alias h='history 1000 | grep -i'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias cp='rsync -aht --progress'

# ps/du
alias p='ps aux | grep -i'
alias du1='du -h -d 1 .'

# Python
alias p2='source activate py27 && which python'
alias p3='source activate py36 && which python'
alias py='which python && python'
alias bp='which bpython && bpython'
alias wp='which python'

# Git
alias gam='git commit --amend --no-edit'
alias gbr='git branch -av'
alias gci='git commit -m'
alias glg='git log --graph --all --decorate --date=short --pretty=format:"%h %ad %an%x09%s"'
alias gp='git push'
function gpr {
  STASH_RESULT=$(git stash save "SyncToUpstream_${DATE}")
  git pull --rebase $@
  if [ "${STASH_RESULT}" != 'No local changes to save' ]; then
    git stash pop
  fi
}
alias gpo='git push origin HEAD:refs/for/master'
alias gpm='git push origin +master'
alias gru='git remote update'
alias gsl='git stash list'
alias gss='git stash save'
alias gst='git status --short'
alias gitg='nohup gitg > /dev/null 2>&1 &'
alias gitSync='SyncToUpstream upstream master'
alias gitSaveStashPatch='git stash save MyGitStashPatch'
alias gitApplyStashPatch='ApplyStash MyGitStashPatch'

function SyncToUpstream {
  # E.g.: upstream
  UPSTREAM=$1
  # E.g.: master
  UPSTREAM_BRANCH=$2
  # E.g.: master
  LOCAL_BRANCH=$3

  DATE=$(date '+%Y%m%d_%H%M%S')
  STASH_RESULT=$(git stash save "SyncToUpstream_${DATE}")
  git fetch ${UPSTREAM} || exit 1
  git checkout ${LOCAL_BRANCH} || exit 1
  git reset --hard ${UPSTREAM}/${UPSTREAM_BRANCH} -- || exit 1
  if [ "${STASH_RESULT}" != 'No local changes to save' ]; then
    git stash pop
  fi
}

function ApplyStash {
  STASH_KEYWORD=$1
  STASH_NAME=$(git stash list | grep "${STASH_KEYWORD}" | awk -F: '{print $1}')
  if ! [ -z ${STASH_NAME} ]; then
    git stash apply ${STASH_NAME}
  else
    echo "No such stash patch named ${STASH_KEYWORD}"
  fi
}

GIT_PROMPT_ONLY_IN_REPO=1
source ~/.bash-git-prompt/gitprompt.sh

# Bazel
alias bb='bazel build'
alias bbd='bazel build -c dbg'
alias bbo='bazel build -c opt'
alias br='bazel run'
function bazelDepsGraph {
  echo "Usage: bazelDeps <TARGET> [FILTER_PATH]"
  TARGET=$1
  FILTER_PATH=$2
  if [ ! -z ${FILTER_PATH} ]; then
    bazel query "deps(${TARGET}) intersect ${FILTER_PATH}" --keep_going --output graph 2>/dev/null | dot -Tpng > /tmp/bazel_deps.png
  else
    bazel query "deps(${TARGET})" --keep_going --output graph 2>/dev/null | dot -Tpng > /tmp/bazel_deps.png
  fi
  echo "Exported to file:///tmp/bazel_deps.png"
}

# Ubuntu
alias uu='sudo apt-get update -y && sudo apt-get upgrade -y && sudo apt-get dist-upgrade -y && sudo apt-get autoremove -y && sudo apt-get autoremove -y --purge'
alias aptInstall='sudo apt-get install'
alias aptRemove='sudo apt-get autoremove'
alias aptSearch='apt-cache search'

# Find & Grep
function findExt {
  echo "Usage: findExt <EXT> <DIR>=." >&2
  EXT=$1
  DIR=$2
  if [ -z ${DIR} ]; then
    DIR="."
  fi
  find "${DIR}" -regex ".*${EXT}"
}
function grepExt {
  echo "Usage: grepExt <EXT> <PATTERN> <DIR>=." >&2
  EXT=$1
  PATTERN=$2
  DIR=$3
  findExt "${EXT}" "${DIR}" | xargs grep -n --color "${PATTERN}"
}
function findCodeC {
  echo "Usage: findCodeC <DIR>=." >&2
  DIR=$1
  findExt "\.\(h\|hpp\|c\|cc\|cpp\)" "${DIR}"
}
function findCode {
  echo "Usage: findCode <DIR>=." >&2
  DIR=$1
  findCodeC "${DIR}"
  findExt "\.\(py\|go\|java\|sh\|bash\|md\|proto\)" "${DIR}"
  findExt "\(BUILD\)" "${DIR}"
}
function grepCode {
  echo "Usage: grepCode <PATTERN> <DIR>=." >&2
  PATTERN=$1
  DIR=$2
  findCode "${DIR}" | xargs grep -n --color "${PATTERN}"
}
function grepLineNumber {
  echo "Usage: grepLineNumber <PATTERN> <SRC_FILE>" >&2
  PATTERN=$1
  SRC_FILE=$2
  grep -nr ${PATTERN} ${SRC_FILE} | gawk '{printf $1}' FS=":"
  printf '/'
  wc -l ${SRC_FILE} | gawk '{print $1}'
}

# Apollo
alias ap="cd $WS/apollo"
alias syMaster='gitSync master'
alias devStart="docker/scripts/dev_start.sh"
alias devInto="docker/scripts/dev_into.sh"
