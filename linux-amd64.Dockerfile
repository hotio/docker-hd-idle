FROM hotio/base@sha256:29d40ed2eecd505d6f6c2c460f732ee5fa2a20d87d17aacdd50a9d6e098b0afe

ARG DEBIAN_FRONTEND="noninteractive"

ENV IDLE_TIME=1800

ARG HDIDLE_VERSION

# install hd-idle
RUN debfile="/tmp/hd-idle.deb" && curl -fsSL -o "${debfile}" "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_amd64.deb" && dpkg -x "${debfile}" "${APP_DIR}" && rm "${debfile}"

COPY root/ /
