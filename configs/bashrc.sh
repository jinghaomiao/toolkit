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
alias gg='nohup gitg > /dev/null 2>&1 &'
alias gu='git remote update'
alias gl='git log --graph --all --oneline'
alias gr='git pull --rebase'
alias gp='git push origin HEAD:refs/for/master'
alias rebase_fork='git stash && git remote update && git reset --hard upstream/master -- && git push origin +master && git stash pop'
alias rebase_fork_15='git stash && git remote update && git reset --hard jinghaomiao/apollo_1.5 -- && git push origin +apollo_1.5 && git stash pop'
alias echo_rebase_fork='echo "git stash && git remote update && git reset --hard upstream/master -- && git push origin +master && git stash pop"'

# Bazel build
alias bb='bazel build'
alias bbd='bazel build -c dbg'
alias bbo='bazel build -c opt'
alias br='bazel run'

# Ubuntu
alias uu='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoremove --purge'
alias aptSearch='apt-cache search'
