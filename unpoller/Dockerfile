FROM ghcr.io/unpoller/unpoller:v5.8.3 AS unpoller-base
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

RUN apk add --no-cache gomplate
