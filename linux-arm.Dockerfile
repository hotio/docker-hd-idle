FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG HDIDLE_VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_armhf.deb" "/tmp/hd-idle.deb"
RUN dpkg --install "/tmp/hd-idle.deb"


FROM hotio/base@sha256:2ab084590c123e37e9ceb51698d9a9b77b54ab6f211e165cfe80e9a96f8ab916
ENV IDLE_TIME=1800
COPY --from=builder /usr/sbin/hd-idle /app/hd-idle
COPY root/ /
