# Tools
alias reload_docker='docker-machine restart default && docker-machine env default && eval $(docker-machine env default)'

# Brew
alias brewList='brew list; brew cask list'
alias brewUpdate='brew update && brew cleanup; brew cask cleanup'
alias brewUpgrade='brew update && brew outdated; brew upgrade'
