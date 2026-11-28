FROM ghcr.io/astral-sh/uv:0.13.10 AS uv
FROM ghcr.io/home-assistant/base:3.24-2026.11.1

# renovate: datasource=python-version depName=python
ARG PYTHON_VERSION=3.15.2

ENV UV_PYTHON_INSTALL_DIR=/opt/uv/python \
    UV_TOOL_DIR=/opt/uv/tools \
    UV_TOOL_BIN_DIR=/usr/local/bin \
    UV_NO_CACHE=1 \
    UV_EXTRA_INDEX_URL= \
    PIP_EXTRA_INDEX_URL=

COPY --from=uv /uv /usr/local/bin/uv

# Each server gets its own venv so their dependencies can't clash. Each one's
# full dependency tree is locked in requirements/<package>.txt, compiled from
# requirements/<package>.in; Renovate updates both.
COPY requirements /tmp/requirements
RUN uv python install "${PYTHON_VERSION}" \
 && for req in /tmp/requirements/*.txt; do \
      uv tool install --python "${PYTHON_VERSION}" --constraints "${req}" "$(basename "${req}" .txt)" || exit 1; \
    done \
 && rm -rf /tmp/requirements

COPY rootfs /
