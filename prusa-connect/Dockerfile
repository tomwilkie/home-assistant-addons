ARG BUILD_FROM=ghcr.io/home-assistant/base:3.24
FROM ${BUILD_FROM}

# Prusa publishes no container image, only static Linux binaries on each
# GitHub release, so the add-on downloads the one for this architecture and
# checks it against the release's SHA256SUMS. The Supervisor passes
# BUILD_VERSION from config.yaml and BUILD_ARCH for the machine it builds on.
ARG BUILD_VERSION
ARG BUILD_ARCH

RUN set -eu; \
    [ -n "${BUILD_VERSION}" ] || { echo "BUILD_VERSION is required" >&2; exit 1; }; \
    base="https://github.com/prusa3d/prusa-connect/releases/download/v${BUILD_VERSION}"; \
    file="prusa_connect_${BUILD_ARCH}"; \
    cd /tmp; \
    curl -fsSL -o "${file}" "${base}/${file}"; \
    curl -fsSL -o SHA256SUMS "${base}/SHA256SUMS"; \
    grep " ${file}$" SHA256SUMS | sha256sum -c -; \
    install -m 0755 "${file}" /usr/local/bin/prusa-connect; \
    rm -f "${file}" SHA256SUMS

COPY rootfs /

# The server writes its settings, database and uploaded files to config/ and
# storage/ under the directory it starts in. That directory is the add-on's
# configuration folder, which Home Assistant keeps and backs up.
WORKDIR /prusa-connect

LABEL \
  org.opencontainers.image.title="Home Assistant Unofficial Add-on: Prusa Connect" \
  org.opencontainers.image.source="https://github.com/tomwilkie/home-assistant-addons/tree/main/prusa-connect" \
  org.opencontainers.image.documentation="https://github.com/tomwilkie/home-assistant-addons/blob/main/prusa-connect/DOCS.md"
