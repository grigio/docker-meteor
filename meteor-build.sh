#!/bin/sh
BUNDLED=~/.meteor/packages/meteor-tool/*/meteor-tool-os.linux.x86_64/dev_bundle/bin
(cd /app && meteor build --directory .)
(cd bundle/programs/server && $BUNDLED/npm install)
