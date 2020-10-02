FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${VERSION}/hd-idle_${VERSION}_armhf.deb" "/tmp/hd-idle.deb"
RUN mkdir "/tmp/hd-idle/" && dpkg -x "/tmp/hd-idle.deb" "/tmp/hd-idle/"


FROM hotio/base@sha256:88cae906228e62cc8b5730795161bd8960987f39049b833ce163e0c2d98756cc
ENV IDLE_TIME=1800
COPY --from=builder /tmp/hd-idle/usr/sbin/hd-idle /app/hd-idle
COPY root/ /
