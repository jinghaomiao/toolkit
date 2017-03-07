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
alias gs='git status'
alias ga='git commit --amend --no-edit && git push origin HEAD:refs/for/master'
alias gp='git push origin HEAD:refs/for/master'
