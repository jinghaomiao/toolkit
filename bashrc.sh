# History
HISTSIZE=100000
HISTFILESIZE=200000
alias h='history 1000 | grep -i'

# ls
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# ps
alias p='ps aux | grep -i'

# git
alias gs='git status'
alias ga='git commit --amend --no-edit && git push origin HEAD:refs/for/master'
alias gp='git push origin HEAD:refs/for/master'

# Special
export WS=
alias w="cd $WS"
