FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${VERSION}/hd-idle_${VERSION}_amd64.deb" "/tmp/hd-idle.deb"
RUN mkdir "/tmp/hd-idle/" && dpkg -x "/tmp/hd-idle.deb" "/tmp/hd-idle/"


FROM hotio/base@sha256:6b705d006c6676903eaee7c328e87a93d39a8091b27c095ed32a98719599936e
ENV IDLE_TIME=1800
COPY --from=builder /tmp/hd-idle/usr/sbin/hd-idle /app/hd-idle
COPY root/ /
