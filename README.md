# Home Assistant add-ons

A Home Assistant add-on repository. Add it in **Settings → Add-ons → Add-on
Store → ⋮ → Repositories** with:

```
https://github.com/tomwilkie/home-assistant-addons
```

## Add-ons

### [UnPoller](./unpoller)

[UnPoller](https://github.com/unpoller/unpoller) exports UniFi controller
metrics for Prometheus or InfluxDB. Copied from
[bluemaex/home-assistant-addons](https://github.com/bluemaex/home-assistant-addons/tree/main/unpoller)
(MIT) to track newer unpoller releases.

Home Assistant builds this add-on locally from its Dockerfile; there is no
prebuilt image.

### [Homebridge](./homebridge)

[Homebridge](https://github.com/homebridge/homebridge) exposes non-HomeKit
devices to Apple Home through plugins. Home Assistant pulls the official
[homebridge/homebridge](https://hub.docker.com/r/homebridge/homebridge) image.
Based on
[tronikos/home-assistant-addons](https://github.com/tronikos/home-assistant-addons/tree/main/homebridge).
