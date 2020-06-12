FROM ubuntu:16.04

ARG VERSION=52.9.0esr

RUN set -ex; \
    apt-get update && apt-get install -y \
        bzip2 \
        curl \
        libgtk-3-0 \
        libdbus-glib-1-2 \
        libx11-xcb1 \
        libxt6 \
        icedtea-plugin; \
    rm -rf /var/lib/apt/lists/*; \
    useradd -ms /bin/bash surfer; \
    curl --silent https://ftp.mozilla.org/pub/firefox/releases/$VERSION/linux-x86_64/en-US/firefox-$VERSION.tar.bz2 \
     | tar -xjv -C /opt/

COPY files/autoconfig.js /opt/firefox/browser/defaults/preferences/
COPY files/*.list files/*.desktop /home/surfer/.local/share/applications/

USER surfer

CMD ["/opt/firefox/firefox"]
