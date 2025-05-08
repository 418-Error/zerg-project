FROM debian:bookworm

ARG VERSION_VNC="1.6.0"

RUN apt-get update && apt-get install -y \
    qemu-utils \
    qemu-system-x86 \
    qemu-system-gui \
    nginx

RUN apt-get install -y wget

RUN mkdir -p /usr/share/novnc && \
    wget "https://github.com/novnc/noVNC/archive/refs/tags/v${VERSION_VNC}.tar.gz" -O /tmp/novnc.tar.gz -q --timeout=10 && \
    tar -xf /tmp/novnc.tar.gz -C /tmp/ && \
    cd "/tmp/noVNC-${VERSION_VNC}" && \
    mv app core vendor package.json *.html /usr/share/novnc

COPY --chmod=755 ./src /run/
COPY --chmod=755 ./web /var/www/
COPY --chmod=664 ./web/conf/defaults.json /usr/share/novnc
COPY --chmod=664 ./web/conf/mandatory.json /usr/share/novnc
COPY --chmod=744 ./web/conf/nginx.conf /etc/nginx/sites-enabled/web.conf

VOLUME /storage
EXPOSE 5900 8006 5700

ENTRYPOINT ["/run/entry.sh"]
