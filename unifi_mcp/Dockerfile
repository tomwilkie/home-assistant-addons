FROM ghcr.io/astral-sh/uv:0.9 AS uv
FROM ghcr.io/home-assistant/base:3.24

ARG PYTHON_VERSION=3.13
ARG UNIFI_NETWORK_MCP_VERSION=0.50.3
ARG UNIFI_PROTECT_MCP_VERSION=0.15.1
ARG UNIFI_ACCESS_MCP_VERSION=0.10.1
ARG UNIFI_SITEMANAGER_MCP_VERSION=0.2.1
ARG UNIFI_DRIVE_MCP_VERSION=0.1.0
ARG UNIFI_INNERSPACE_MCP_VERSION=0.1.1
ARG UNIFI_MCP_RELAY_VERSION=0.3.22

ENV UV_PYTHON_INSTALL_DIR=/opt/uv/python \
    UV_TOOL_DIR=/opt/uv/tools \
    UV_TOOL_BIN_DIR=/usr/local/bin \
    UV_NO_CACHE=1 \
    UV_EXTRA_INDEX_URL= \
    PIP_EXTRA_INDEX_URL=

COPY --from=uv /uv /usr/local/bin/uv

# Each server gets its own venv so their pinned dependencies can't clash.
RUN uv python install "${PYTHON_VERSION}" \
 && for pkg in \
      "unifi-network-mcp==${UNIFI_NETWORK_MCP_VERSION}" \
      "unifi-protect-mcp==${UNIFI_PROTECT_MCP_VERSION}" \
      "unifi-access-mcp==${UNIFI_ACCESS_MCP_VERSION}" \
      "unifi-sitemanager-mcp==${UNIFI_SITEMANAGER_MCP_VERSION}" \
      "unifi-drive-mcp==${UNIFI_DRIVE_MCP_VERSION}" \
      "unifi-innerspace-mcp==${UNIFI_INNERSPACE_MCP_VERSION}" \
      "unifi-mcp-relay==${UNIFI_MCP_RELAY_VERSION}"; do \
      uv tool install --python "${PYTHON_VERSION}" "${pkg}" || exit 1; \
    done

COPY rootfs /
