# Brew
alias brewList='brew list; brew cask list'
alias brewUpdate='brew update && brew cleanup'
alias brewUpgrade='brew update && brew outdated; brew upgrade'
alias brewUU='brew update && brew cleanup && brew update && brew outdated; brew upgrade'

export PATH=${PATH}:/usr/local/miniconda3/bin
