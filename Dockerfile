FROM ubuntu:focal


ARG S6_VER="2.0.0.1"


## S6 Overlay
RUN mkdir /_install
ADD https://github.com/just-containers/s6-overlay/releases/download/v${S6_VER}/s6-overlay-amd64.tar.gz /_install
RUN tar xzf /_install/s6-overlay-amd64.tar.gz -C / --exclude="./bin" && \
    tar xzf /_install/s6-overlay-amd64.tar.gz -C /usr ./bin
ENV S6_BEHAVIOUR_IF_STAGE2_FAILS=2
ENTRYPOINT ["/init"]


## Dependencies
ENV DEBIAN_FRONTEND=noninteractive
RUN apt update && \
    apt upgrade -y && \
    apt install -y \
    gettext-base samba avahi-daemon


## Scripts
COPY root /
ENV S6_CMD_WAIT_FOR_SERVICES=1 \
    PGID=0 \
    PUID=0 \
    SMB_NAME='Time Machine' \
    SMB_USER=dog \
    SMB_PASSWORD=dog
VOLUME ["/share"]


## Cleanup
RUN apt autoremove -y && \
    apt clean && \
    rm -r /_install
