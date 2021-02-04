FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${VERSION}/hd-idle_${VERSION}_amd64.deb" "/tmp/hd-idle.deb"
RUN mkdir "/tmp/hd-idle/" && dpkg -x "/tmp/hd-idle.deb" "/tmp/hd-idle/"


FROM ghcr.io/hotio/base@sha256:fc9c0387c1150b5d77418a739767102e3383c583aee4ed9e09bf24c41e2fa0f0
ENV IDLE_TIME=1800
COPY --from=builder /tmp/hd-idle/usr/sbin/hd-idle /app/hd-idle
COPY root/ /
