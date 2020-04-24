FROM hotio/base@sha256:c2d33b2a7cff2d5fa904dbf66708b62bb53c2cefe542fb02d53eea2d29be68f1

ARG DEBIAN_FRONTEND="noninteractive"

ENV IDLE_TIME=1800

ARG HDIDLE_VERSION

# install hd-idle
RUN debfile="/tmp/hd-idle.deb" && curl -fsSL -o "${debfile}" "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_arm64.deb" && dpkg -x "${debfile}" "${APP_DIR}" && rm "${debfile}"

COPY root/ /
