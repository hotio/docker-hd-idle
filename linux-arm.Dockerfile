FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG HDIDLE_VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_armhf.deb" "/tmp/hd-idle.deb"
RUN mkdir "/tmp/hd-idle/" && dpkg -x "/tmp/hd-idle.deb" "/tmp/hd-idle/"


FROM hotio/base@sha256:2ab084590c123e37e9ceb51698d9a9b77b54ab6f211e165cfe80e9a96f8ab916
ENV IDLE_TIME=1800
COPY --from=builder /tmp/hd-idle/usr/sbin/hd-idle /app/hd-idle
COPY root/ /
