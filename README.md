# Steam Deck kitty config

My [kitty](https://sw.kovidgoyal.net/kitty/) setup for using the terminal in the
Steam Deck's Gaming Mode, plus the Steam Input layout that goes with it.

## Contents

- `kitty/kitty.conf` and `kitty/startup.session`: go in `~/.config/kitty/`
- `steam/controller_neptune.vdf`: the Steam Deck controller layout for the
  non-Steam shortcut named `kitty`

## Gaming Mode tweaks

| What | How |
| --- | --- |
| On-screen keyboard covers the prompt | **L4** opens the keyboard and lifts kitty's text above it (`Ctrl+Shift+F11`); **R4** restores it (`Ctrl+Shift+F12`). Adjust the `padding-bottom=260` value if needed. |
| Send Enter without closing the on-screen keyboard | **R5** sends `F9`, which kitty turns into Enter. Steam closes its keyboard on a real Enter key. |
| Switch tabs (Steam takes `Ctrl+Shift+Tab`) | `F7` previous tab, `F8` next tab |
| Scroll a page | `Ctrl+U` / `Ctrl+D` |
| New window/tab in the current folder | `Ctrl+Shift+Enter` / `Ctrl+Shift+T` |
| `ld.so ... wrong ELF class` errors | `env LD_PRELOAD` drops Steam's overlay preload for programs started in kitty |
| Wayland/EGL backend fails on SteamOS | `linux_display_server x11` |

## Usage

```bash
./backup.sh    # copy the live config into the repo, then commit
./install.sh   # restore it onto a Deck, then restart Steam
```

`install.sh` expects kitty to be added to Steam as a non-Steam game named `kitty`.
