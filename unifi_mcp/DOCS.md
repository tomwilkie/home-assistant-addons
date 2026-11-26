# UniFi MCP

Runs the [UniFi MCP](https://github.com/sirkirby/unifi-mcp) servers and the
Cloud Relay in one container, supervised by s6-overlay. The servers listen on
loopback only; the relay opens an outbound WebSocket to your Cloudflare Worker,
so no ports are exposed on your network.

## Before you start

1. Deploy the relay Worker to your Cloudflare account and create a relay token:

   ```bash
   npm install -g unifi-mcp-worker
   unifi-mcp-worker install
   ```

2. Create a local admin account on your UniFi console for the add-on. Ubiquiti
   SSO accounts and accounts with MFA do not work.

## Options

| Option | Description |
|--------|-------------|
| `unifi_host` | Console address, for example `192.168.1.1` |
| `unifi_username` / `unifi_password` | Local console login, shared by Network, Protect, Access and InnerSpace |
| `unifi_verify_ssl` | Verify the console's TLS certificate |
| `network`, `protect` | Enable each server (on by default) |
| `access` | Enable the Access server (off by default) |
| `sitemanager` | Enable the Site Manager server; needs `sitemanager_api_key`. That key reads every console on your UI account |
| `drive` | Enable the Drive server; needs `drive_host`, `drive_username` and `drive_password` for the NAS |
| `innerspace` | Enable the InnerSpace server (floor plans) |
| `relay_url` | Your Worker URL |
| `relay_token` | Relay token from `unifi-mcp-worker` |
| `relay_location_name` | Name this location shows as in the Worker |
| `env_vars` | Extra `KEY=VALUE` settings passed to every process, for example `UNIFI_NETWORK_SITE=default` |

Only enabled servers are registered with the relay.

## Connecting Claude

Add the Worker's MCP endpoint as a remote MCP server in Claude, using the
client token from `unifi-mcp-worker`.
