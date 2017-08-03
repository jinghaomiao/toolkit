# Workspace
alias w="cd $WS"
alias d="cd $DT"
alias dl="cd $DL"

# History
export HISTSIZE=100000
export HISTFILESIZE=200000
alias h='history 1000 | grep -i'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ps/du
alias p='ps aux | grep -i'
alias du1='du -h -d 1 .'

# python
alias p2='source $WS/toolkit/pyenv/py2.7/bin/activate && which python'
alias p3='source $WS/toolkit/pyenv/py3.5/bin/activate && which python'
alias py='which python && python'
alias bp='which bpython && bpython'
alias wp='which python'

# git
alias gam='git commit --amend --no-edit'
alias gbr='git branch -av'
alias gci='git commit -m'
alias glg='git log --graph --all --decorate --oneline'
alias gp='git push'
alias gpr='git stash && git pull --rebase && git stash pop'
alias gpo='git push origin HEAD:refs/for/master'
alias gru='git remote update'
alias gst='git status --short'
alias gitg='nohup gitg > /dev/null 2>&1 &'
function ThreeWayRebase {
  # E.g.: upstream/master
  UPSTREAM=$1
  # E.g.: origin
  ORIGIN_REPO=$2
  # E.g.: master
  ORIGIN_BRANCH=$3
  # E.g.: master
  LOCAL_BRANCH=$4

  git checkout ${LOCAL_BRANCH} || exit 1
  STASH_RESULT=$(git stash)
  git remote update || exit 1
  git reset --hard upstream_dev/master -- || exit 1
  if [ "${STASH_RESULT}" != 'No local changes to save' ]; then
    git stash pop
  fi
}

alias rbFork='ThreeWayRebase upstream_dev/master apollo_dev master master'
alias rbDev='ThreeWayRebase upstream_dev/master apollo_dev dev dev'

# Bazel build
alias bb='bazel build'
alias bbd='bazel build -c dbg'
alias bbo='bazel build -c opt'
alias br='bazel run'

# Ubuntu
alias uu='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoremove --purge'
alias aptInstall='sudo apt-get install'
alias aptRemove='sudo apt-get autoremove'
alias aptSearch='apt-cache search'

# other
function findCode {
  DIR=$1
  find "${DIR}" -regex ".*\.\(h\|hpp\|c\|cc\|cpp\|py\|go\|md\)$"
}
function countCode {
  DIR=$1
  findCode "${DIR}" | xargs wc
}
function grepCode {
  DIR=$1
  PATTERN=$2
  findCode "${DIR}" | xargs grep -n --color "${PATTERN}"
}
