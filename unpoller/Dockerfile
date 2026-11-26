FROM ghcr.io/unpoller/unpoller:v5.10.2 AS unpoller-base
FROM ghcr.io/home-assistant/base:3.24 AS final

LABEL \
  maintainer="bluemaex <homeassistant@blmx.de>" \
  org.opencontainers.image.authors="bluemaex <homeassistant@blmx.de>" \
  org.opencontainers.image.licenses="MIT License" \
  org.opencontainers.image.title="Home Assistant Unofficial Add-on: unpoller" \
  org.opencontainers.image.url="https://github.com/bluemaex/home-assistant-addons" \
  org.opencontainers.image.source="https://github.com/bluemaex/home-assistant-addons/unpoller" \
  org.opencontainers.image.documentation="https://github.com/bluemaex/home-assistant-addons/unpoller/README.md"

COPY rootfs /
COPY --from=unpoller-base /usr/bin/unpoller /usr/local/bin/unpoller
COPY --from=unpoller-base /etc/unpoller/up.conf /etc/unpoller/up.conf

# Alpine drops old package versions from its repositories, so pinning one
# would break the build on the next Alpine update.
# hadolint ignore=DL3018
RUN apk add --no-cache gomplate
