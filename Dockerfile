FROM debian:buster-slim

LABEL maintainer="eLEMONator - github.com/e-LEMONator"
LABEL org.opencontainers.image.source=https://github.com/e-LEMONator/armareforgerserver

SHELL ["/bin/bash", "-o", "pipefail", "-c"]
RUN apt-get update \
    && \
    apt-get install -y --no-install-recommends --no-install-suggests \
        python3 \
        python3-bs4 \
        lib32stdc++6 \
        lib32gcc1 \
        wget \
        ca-certificates \
        libcurl4 \
        net-tools \
        libssl1.1 \
    && \
    apt-get remove --purge -y \
    && \
    apt-get clean autoclean \
    && \
    apt-get autoremove -y \
    && \
    rm -rf /var/lib/apt/lists/* \
    && \
    mkdir -p /steamcmd \
    && \
    wget -qO- 'https://steamcdn-a.akamaihd.net/client/installer/steamcmd_linux.tar.gz' | tar zxf - -C /steamcmd

ENV ARMA_BINARY=./ArmaReforgerServer
ENV ARMA_CONFIG=server.json
ENV ARMA_MAXFPS=1000
ENV LOG_LEVEL=normal
ENV PORT=2001
ENV STEAM_BRANCH=public
ENV STEAM_BRANCH_PASSWORD=
ENV MODS_LOCAL=true
ENV MODS_PRESET=

EXPOSE 2001/udp

VOLUME /armareforger

WORKDIR /armareforger

VOLUME /steamcmd

STOPSIGNAL SIGINT

COPY *.py /

CMD ["python3","/launch.py"]
