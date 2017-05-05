# Workspace
alias w="cd $WS"
alias d="cd $DT"
alias dl="cd $DL"

# History
HISTSIZE=100000
HISTFILESIZE=200000
alias h='history 1000 | grep -i'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ps/du
alias p='ps aux | grep -i'
alias du1='du -h --exclude="lost+found" -d 1 .'

# python
alias p2='source $WS/toolkit/pyenv/py27/bin/activate && which python'
alias p3='source $WS/toolkit/pyenv/py36/bin/activate && which python'
alias py='which python && python'
alias bp='which bpython && bpython'
alias wp='which python'

# git
alias ga='git pull && git commit --amend --no-edit && git push origin HEAD:refs/for/master'
alias gp='git pull && git push origin HEAD:refs/for/master'
alias gitg='nohup gitg > /dev/null 2>&1 &'

alias uu='sudo apt-get update && sudo apt-get upgrade && sudo apt-get dist-upgrade && sudo apt-get autoremove && sudo apt-get autoremove --purge'
