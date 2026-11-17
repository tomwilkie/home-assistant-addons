# Prusa Connect

Runs the [Prusa Connect](https://github.com/prusa3d/prusa-connect) server, the
one you host yourself. Your printers connect to it over your own network, and
you use them from its web app and API. Nothing goes through a cloud service.

Prusa Connect is in public beta. Releases are `0.x` pre-releases, and the
configuration and API can still change between them. Back up before you
update.

## First start

1. Start the add-on and open its log. The server prints a one-time setup code
   there, as `setup_code=XXXX-XXXX-XXXX`. A restart prints a new one.
2. Open the web UI (**Open Web UI**, port `8080`) and enter the code.
3. Answer the wizard's questions: who may sign in, how a new printer joins,
   where files go, encryption and the port. **Confirm and restart** writes the
   answers and the server restarts on them.

[Install from a release](https://github.com/prusa3d/prusa-connect/blob/main/docs/src/content/docs/install-from-a-release.md)
describes the wizard and how to point a printer at the server with a USB drive.

## Network

The add-on uses the host network, so the printers' mDNS discovery (**Printers
nearby**), the optional time server on UDP port `123` and the printer log
extension's UDP ports work without port mappings. Port `8080` is the web UI,
the REST API and the port the printers connect to.

If the wizard moves the server to another port, **Open Web UI** keeps pointing
at `8080`. Open the new address directly.

## Data

Everything the server writes is in this add-on's configuration folder,
`/addon_configs/<id>_prusa-connect/` (mounted at `/prusa-connect` in the
container), which Home Assistant backs up:

- `config/config.yaml` is the configuration file. Every key it sets wins over
  the wizard, and the wizard shows that key as fixed. The sample file on each
  [release](https://github.com/prusa3d/prusa-connect/releases) documents
  every key.
- `config/config.d/` holds the wizard's answers, the accounts and permissions
  database, and installed extensions.
- `storage/` holds the files you upload.

The database holds the password hashes, so keep the folder private.

## Updates

The add-on updates the server. On first start the add-on writes a
`config/config.yaml` that switches off the server's own updater
(`core.upgrade.enabled: false`), because that updater would replace the binary
inside the container and migrate the database past what the add-on's version
can read. With it off, the server's settings show no **Updates** and no
**Backups** tab; use Home Assistant backups instead.

The file is written only when it does not exist, so edit it as you like.

## Options

- `log_level`: how much the server logs, one of `debug`, `info`, `warn`,
  `error`.

## Versions

The add-on version is the upstream release, such as `0.1.0-beta.1`. See the
[releases](https://github.com/prusa3d/prusa-connect/releases).
