FROM debian:bookworm

ENV TINI_VERSION="v0.19.0"

ENV NOVNC_TAG="v1.5.0"

ENV WEBSOCKIFY_TAG="v0.13.0"

RUN apt-get update && apt-get install -y \
    qemu-utils \
    qemu-system-x86 \
    qemu-system-gui \
    nginx

RUN apt-get install -y wget \
    ca-certificates \
    curl \
    git

# Add Tini
ADD https://github.com/krallin/tini/releases/download/${TINI_VERSION}/tini /tini
RUN chmod +x /tini

# Install noVNC
RUN git config --global advice.detachedHead false && \
    git clone https://github.com/novnc/noVNC --branch ${NOVNC_TAG} /root/noVNC && \
    git clone https://github.com/novnc/websockify --branch ${WEBSOCKIFY_TAG} /root/noVNC/utils/websockify

RUN cp /root/noVNC/vnc.html /root/noVNC/index.html

RUN sed -i "/wait ${proxy_pid}/i if [ -n \"\$AUTOCONNECT\" ]; then sed -i \"s/'autoconnect', false/'autoconnect', '\$AUTOCONNECT'/\" /root/noVNC/app/ui.js; fi" /root/noVNC/utils/novnc_proxy

RUN sed -i "/wait ${proxy_pid}/i if [ -n \"\$VNC_PASSWORD\" ]; then sed -i \"s/WebUtil.getConfigVar('password')/'\$VNC_PASSWORD'/\" /root/noVNC/app/ui.js; fi" /root/noVNC/utils/novnc_proxy

RUN sed -i "/wait ${proxy_pid}/i if [ -n \"\$VIEW_ONLY\" ]; then sed -i \"s/UI.rfb.viewOnly = UI.getSetting('view_only');/UI.rfb.viewOnly = \$VIEW_ONLY;/\" /root/noVNC/app/ui.js; fi" /root/noVNC/utils/novnc_proxy

COPY --chmod=755 ./src /run/

VOLUME /storage
EXPOSE 5900 8006 5700

ENTRYPOINT ["/tini", "--", "/run/entry.sh"]