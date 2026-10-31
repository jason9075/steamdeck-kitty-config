#!/usr/bin/env bash
# Restore the kitty config and the Steam controller layout from this repo.
# Restart Steam afterwards so it loads the layout.
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p ~/.config/kitty
cp kitty/kitty.conf kitty/startup.session ~/.config/kitty/

STEAM_CFG="$HOME/.local/share/Steam/steamapps/common/Steam Controller Configs"
account=$(ls "$STEAM_CFG" | head -n1)
[ -n "$account" ] || { echo "No Steam account folder in $STEAM_CFG; launch Steam once first" >&2; exit 1; }
cfg="$STEAM_CFG/$account/config"
mkdir -p "$cfg/kitty"
sed "s#autosave://[^\"]*#autosave://$cfg/kitty/controller_neptune.vdf#" steam/controller_neptune.vdf > "$cfg/kitty/controller_neptune.vdf"

# Point the "kitty" non-Steam shortcut at the layout
set_file="$cfg/configset_controller_neptune.vdf"
[ -f "$set_file" ] || printf '"controller_config"\n{\n}\n' > "$set_file"
if ! grep -q '^\s*"kitty"$' "$set_file"; then
  cp "$set_file" "$set_file.bak"
  sed -i '$ d' "$set_file"
  printf '\t"kitty"\n\t{\n\t\t"autosave"\t\t"1"\n\t}\n}\n' >> "$set_file"
fi
pkill -USR1 -x kitty || true
echo "Installed. Restart Steam to load the controller layout."
