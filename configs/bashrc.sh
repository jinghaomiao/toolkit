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
alias du1='du -h --exclude="lost+found" -d 1 .'

# python
alias p2='source $WS/toolkit/pyenv/py2.7/bin/activate && which python'
alias p3='source $WS/toolkit/pyenv/py3.6/bin/activate && which python'
alias py='which python && python'
alias bp='which bpython && bpython'
alias wp='which python'

# git
alias gf='git fetch'
alias ga='git commit --amend --no-edit'
alias gr='git fetch && git rebase origin/master'
alias gp='git push origin HEAD:refs/for/master'
alias gitg='nohup gitg > /dev/null 2>&1 &'
alias git_reset_fork='git remote update && git reset --hard upstream/master -- && git push origin +master'

# Bazel build
alias bb='bazel build'
alias bbd='bazel build -c dbg'
alias bbo='bazel build -c opt'
alias br='bazel run'

# Ubuntu
alias uu='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoremove --purge'
