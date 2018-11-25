FROM ubuntu:18.04
MAINTAINER Aaron Xiao <xiaoxiangquan@gmail.com>

ENV DEBIAN_FRONTEND=noninteractive
ENV VERSION=5.1
ENV NEW_PORT=8007

# Install libraries.
RUN apt-get update -y && apt-get install -y make automake autoconf libtool \
    flex bison pkg-config libssl-dev libxml2-dev python-dev libaio-dev \
    libibverbs-dev librdmacm-dev libreadline-dev liblvm2-dev libglib2.0-dev \
    liburcu-dev libcmocka-dev libsqlite3-dev libacl1-dev unzip uuid-dev wget

# Build and install from code.
RUN wget https://github.com/gluster/glusterfs/archive/v${VERSION}.zip && \
    unzip v${VERSION}.zip && \
    cd glusterfs-${VERSION} && \
    sed -i "s/GF_DEFAULT_BASE_PORT 24007/GF_DEFAULT_BASE_PORT ${NEW_PORT}/g" \
        libglusterfs/src/globals.h && \
    ./autogen.sh && \
    ./configure && \
    make && \
    make install && \
    cd .. && \
    rm -fr glusterfs-${VERSION} v${VERSION}.zip && \
    ldconfig && \
    service glusterd start
