FROM ubuntu:16.04

ARG VERSION=52.1.0esr

RUN apt-get update && apt-get install -y \
        bzip2 \
        libgtk-3-0 \
        libdbus-glib-1-2 \
        libx11-xcb1 \
        libxt6 \
        icedtea-plugin \
        curl \
        sudo \
    && rm -rf /var/lib/apt/lists/* \
    && useradd -ms /bin/bash surfer \
    && curl https://ftp.mozilla.org/pub/firefox/releases/$VERSION/linux-x86_64/en-US/firefox-$VERSION.tar.bz2 -O \
    && tar -xvf firefox-$VERSION.tar.bz2 -C /opt/

USER surfer

CMD ["/opt/firefox/firefox"]
