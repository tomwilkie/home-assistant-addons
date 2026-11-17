# Unofficial Home Assistant Add-ons: Prusa Connect

Prusa Connect (<https://github.com/prusa3d/prusa-connect>), the self-hosted
server for Prusa and other 3D printers, bundled as a Home Assistant add-on.

Prusa publishes no container image, so Home Assistant builds this add-on
locally from the release binary on GitHub, checked against the release's
`SHA256SUMS`.

## Installation

1. Navigate in your Home Assistant frontend to **Settings → Add-ons → Add-on
   Store**
1. Add this repository by URL
   (`https://github.com/tomwilkie/home-assistant-addons`)
1. Find the "Prusa Connect" add-on and click on it.
1. Click on the "INSTALL" button
1. Read the [Documentation](DOCS.md) inside the add-on

This project is not affiliated with Prusa Research. Prusa Connect is
distributed under the
[Open Community License v1.1](https://github.com/prusa3d/prusa-connect/blob/main/LICENSE)
with Prusa's add-on conditions.
