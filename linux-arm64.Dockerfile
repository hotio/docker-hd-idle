FROM hotio/base@sha256:e0a32794663c42ab2b15dcbaadc560dd8c4d6b8f90b61a49d8d11048189fbeb1

ARG DEBIAN_FRONTEND="noninteractive"

ENV IDLE_TIME=1800

ARG HDIDLE_VERSION

# install hd-idle
RUN debfile="/tmp/hd-idle.deb" && curl -fsSL -o "${debfile}" "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_arm64.deb" && dpkg -x "${debfile}" "${APP_DIR}" && rm "${debfile}"

COPY root/ /
