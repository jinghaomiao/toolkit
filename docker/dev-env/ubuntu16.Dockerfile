FROM ubuntu:16.04
MAINTAINER Aaron Xiao <xiaoxiangquan@gmail.com>

COPY installers /tmp/installers
RUN bash /tmp/installers/pre_install.sh
RUN bash /tmp/installers/install_conda.sh
RUN bash /tmp/installers/install_python.sh

ARG USER=aaron
USER ${USER}
WORKDIR /home/${USER}/work
ENTRYPOINT /tmp/installers/entrypoint.sh
