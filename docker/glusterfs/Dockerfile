FROM ubuntu:18.04
MAINTAINER Aaron Xiao <xiaoxiangquan@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive

# Install tools.
# https://docs.gluster.org/en/v3/Developer-guide/Building-GlusterFS/
RUN apt-get update -y && \
    apt-get install -y make automake autoconf libtool flex bison pkg-config \
    libssl-dev libxml2-dev python-dev libaio-dev libibverbs-dev librdmacm-dev \
    libreadline-dev liblvm2-dev libglib2.0-dev liburcu-dev libcmocka-dev \
    libsqlite3-dev libacl1-dev uuid-dev sudo

# Add user.
RUN adduser --disabled-password --force-badname --gecos '' aaron && \
    usermod -aG sudo aaron && \
    echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

COPY glusterfs /home/work/glusterfs
RUN cd /home/work/glusterfs && \
    bash autogen.sh && \
    bash configure && \
    make -j8 && \
    make install && \
    rm -fr /home/work/glusterfs

ENTRYPOINT ["bash", "-c", "service glusterd start && bash"]
