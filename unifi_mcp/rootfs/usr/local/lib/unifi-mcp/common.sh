#!/usr/bin/env bash
# Shared settings for every process in the add-on. Sourced by the s6 run scripts.

# Port for each server; these match upstream's docker-compose.yml.
unifi_mcp_port() {
  case "${1}" in
    network) echo 3000 ;;
    protect) echo 3001 ;;
    access) echo 3002 ;;
    sitemanager) echo 3003 ;;
    drive) echo 3004 ;;
    innerspace) echo 3005 ;;
    *) return 1 ;;
  esac
}

# Extra KEY=VALUE pairs from the add-on options apply to every process.
while IFS= read -r kv; do
  [[ -n "${kv}" ]] && export "${kv?}"
done < <(jq -r '.env_vars[]?' /data/options.json)
