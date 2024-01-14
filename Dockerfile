FROM ubuntu:20.04
MAINTAINER Caroline Joy Bell <halotroop2288@proton.me>
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>
MAINTAINER Thomas Perl <m@thp.io>

ENV VITASDK /usr/local/vitasdk
ENV PATH ${PATH}:${VITASDK}/bin
ENV LANG en_US.utf8

WORKDIR /build

RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
	&& localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8

RUN \
    DEBIAN_FRONTEND=noninteractive && \
    echo "Installing dependencies..." && \
    apt-get update && \
    apt-get install -y sudo wget curl make git-core xz-utils python apt-transport-https ca-certificates gnupg software-properties-common && \
    echo "Installing Latest CMake Version..." && \
    wget -O - https://apt.kitware.com/keys/kitware-archive-latest.asc 2>/dev/null | sudo apt-key add - && \
    apt-add-repository 'deb http://archive.ubuntu.com/ubuntu/ focal main' && \
    apt-get update && \
    apt-get install -y cmake && \
    echo "Adding non-root user..." && \
    useradd -ms /bin/bash user && \
    echo "user:user" | chpasswd && adduser user sudo

RUN \
    git clone https://github.com/vitasdk/vdpm && \
    cd vdpm && \
    ./bootstrap-vitasdk.sh && \
    ./install-all.sh

USER root
CMD ["/bin/bash"]
