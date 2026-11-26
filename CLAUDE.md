# CLAUDE.md

## Dependency rules

- **Pin everything.** Every package, base image, dependency, tool and action must be pinned to an explicit version. No `latest`, no floating tags, no unpinned `apt`/`pip`/`npm` installs.
- **Renovate must track it.** Every pinned version must be kept up to date automatically by Renovate. If Renovate's built-in managers don't detect it, add a `# renovate: datasource=... depName=...` comment and, if needed, a `customManagers` entry or `packageRules` in `renovate.json`.
- **Prefer upstream, in this order:**
  1. Use the upstream Docker image, unmodified, where one exists.
  2. Otherwise, install from upstream packages (distro, pip, npm, release binaries etc).
  3. Build from source only as a last resort.
