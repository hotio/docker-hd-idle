FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${VERSION}/hd-idle_${VERSION}_arm64.deb" "/tmp/hd-idle.deb"
RUN mkdir "/tmp/hd-idle/" && dpkg -x "/tmp/hd-idle.deb" "/tmp/hd-idle/"


FROM hotio/base@sha256:889e7d2f588ebd0e79a9ccdd8351e560c9a91262223a449a8ef83088f0c03ca3
ENV IDLE_TIME=1800
COPY --from=builder /tmp/hd-idle/usr/sbin/hd-idle /app/hd-idle
COPY root/ /
