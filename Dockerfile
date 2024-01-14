FROM ubuntu:20.04
MAINTAINER Caroline Joy Bell <halotroop2288@proton.me>
MAINTAINER Antonio Aloisio <gnuton@gnuton.org>
MAINTAINER Thomas Perl <m@thp.io>

ENV VITASDK /usr/local/vitasdk
ENV PATH ${PATH}:${VITASDK}/bin

# Fix CI locking up at user input
FROM postgres:10
ENV TZ=Europe/London
RUN date

WORKDIR /build

RUN DEBIAN_FRONTEND=noninteractive
RUN echo "Installing dependencies..."
RUN apt-get update && apt-get install make git-core cmake python cmake
RUN echo "Adding non-root user..."
RUN useradd -ms /bin/bash user && echo "user:user" | chpasswd && adduser user sudo

# Install VitaSDK
RUN git clone https://github.com/vitasdk/vdpm && cd vdpm
RUN ./bootstrap-vitasdk.sh && ./install-all.sh

USER root
CMD ["/bin/bash"]
