# Unofficial Home Assistant Add-ons: Unpoller

Rclone bundled as an Home Assistant add-on.

## How to use

After installation you will need to provide either a configuration file or set
Environment Variables.

For options and format see <https://unpoller.com/>

## Config file

The add-on reads its config file from its own config folder, which Home
Assistant mounts at `/config` inside the add-on. On the host this is
`/addon_configs/<id>_unpoller/`, where `<id>` is the repository prefix shown in
the add-on's slug. Put your `up.conf` there; the default
`dynamic_configuration_path` is `/config/up.conf`.

If there is no file at that path, the add-on runs on environment variables
(`env_vars`) alone.

### Moving from an earlier version

Versions before 5.10.2-1 read `/config/addons/unpoller/up.conf` from Home
Assistant's config folder, which the add-on can no longer see. If you use a
config file:

1. Move `up.conf` from `/config/addons/unpoller/` to
   `/addon_configs/<id>_unpoller/`.
1. Set `dynamic_configuration_path` to `/config/up.conf`.

If you leave the option at the old default, the add-on uses `/config/up.conf`
and logs a warning.
