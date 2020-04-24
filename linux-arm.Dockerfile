FROM hotio/base@sha256:303b7670596f63e071bc6cbad20d2d5ae7e75933477f1f7e648ff63eab80a053

ARG DEBIAN_FRONTEND="noninteractive"

ENV IDLE_TIME=1800

ARG HDIDLE_VERSION

# install hd-idle
RUN debfile="/tmp/hd-idle.deb" && curl -fsSL -o "${debfile}" "https://github.com/adelolmo/hd-idle/releases/download/v${HDIDLE_VERSION}/hd-idle_${HDIDLE_VERSION}_armhf.deb" && dpkg -x "${debfile}" "${APP_DIR}" && rm "${debfile}"

COPY root/ /
