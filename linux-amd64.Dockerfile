FROM hotio/base@sha256:2a594f3774e2835f9d20e84564bd639e3d3124ada25e3aee8e172621a6653650

ARG DEBIAN_FRONTEND="noninteractive"

ENV IDLE_TIME=1800

ARG HDIDLE_VERSION

# install hd-idle
RUN debfile="/tmp/hd-idle.deb" && curl -fsSL -o "${debfile}" "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_amd64.deb" && dpkg -x "${debfile}" "${APP_DIR}" && rm "${debfile}"

COPY root/ /
