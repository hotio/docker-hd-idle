FROM ubuntu:18.04 as builder

ARG DEBIAN_FRONTEND="noninteractive"

# install hd-idle
ARG HDIDLE_VERSION
ADD "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_amd64.deb" "/tmp/hd-idle.deb"
RUN dpkg --install "/tmp/hd-idle.deb"


FROM hotio/base@sha256:45d6eab61b2b710a6634dc8f5257567b60e9525841439fc493c1a629f6102be5
ENV IDLE_TIME=1800
COPY --from=builder /usr/sbin/hd-idle /app/hd-idle
COPY root/ /
