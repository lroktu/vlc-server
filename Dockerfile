FROM alpine:latest

ARG UID="1000"
ARG GID="1000"

RUN apk update && \
    apk add wget && \
    apk add vlc && \
    rm -rf /var/cache/apk/* && \
    mkdir -p /opt/vlc-media && \
    addgroup --g "${GID}" -S vlc && \
    adduser -h /opt/vlc-media -s /bin/sh -u "${UID}" -G vlc -S vlc && \
    cd /opt/vlc-media && \
    wget http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4 && \
    chown vlc:vlc -R /opt/vlc-media

EXPOSE 8080
EXPOSE 554
EXPOSE 8554

USER "vlc"
WORKDIR /opt/vlc-media

ENTRYPOINT [ "/usr/bin/cvlc" ]



