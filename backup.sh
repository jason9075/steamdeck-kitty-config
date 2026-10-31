#!/usr/bin/env bash
# Copy the live kitty config and Steam controller layout into this repo.
set -euo pipefail
cd "$(dirname "$0")"
STEAM_CFG="$HOME/.local/share/Steam/steamapps/common/Steam Controller Configs"
cp ~/.config/kitty/kitty.conf ~/.config/kitty/startup.session kitty/
layout=$(ls "$STEAM_CFG"/*/config/kitty/controller_neptune.vdf | head -n1)
cp "$layout" steam/controller_neptune.vdf
echo "Backed up kitty config and $layout"
