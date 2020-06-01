FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG HDIDLE_VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_arm64.deb" "/tmp/hd-idle.deb"
RUN dpkg --install "/tmp/hd-idle.deb"


FROM hotio/base@sha256:ee9c3c7f7c71b22c022b4e3b8835a4f61444f951490b2f40db716c79f7d37349
ENV IDLE_TIME=1800
COPY --from=builder /usr/sbin/hd-idle /app/hd-idle
COPY root/ /
