FROM ubuntu:18.04
MAINTAINER Aaron Xiao <xiaoxiangquan@gmail.com>

# Tool check.
RUN which curl go

# Install.
RUN go get github.com/google/zoekt/ && \
    go install github.com/google/zoekt/cmd/zoekt-git-index && \
    go install github.com/google/zoekt/cmd/zoekt-webserver && \
    curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.deb.sh | sudo bash && \
    apt-get install -y git-lfs

# Clone.
RUN git lfs clone git@github.com:ApolloAuto/apollo2.git /home/work/repo

# Index.
RUN $GOPATH/bin/zoekt-git-index -branches master -prefix modules/ /home/work/repo
