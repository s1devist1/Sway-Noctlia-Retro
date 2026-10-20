# Sway-Noctlia-Retro

This is my personal Sway rice (dotfiles). It contains my Sway config, Noctalia shell settings, Kitty and Alacritty terminal configs, Fish shell and Starship prompt setup, Fastfetch, and a collection of wallpapers. If you want to use any of it, just copy the files you like. This is just a hobby setup I made for myself, so feel free to tweak it however you want.

## Screenshots

<!-- Add your screenshots here -->

## What's included?

- **Sway** — window manager config, keybinds, gaps and borders.
- **Noctalia** — shell settings, bar, dock, widgets, themes and plugins.
- **Kitty & Alacritty** — terminal configs and themes.
- **Fish & Starship** — shell and prompt setup.
- **Fastfetch** — system info and custom themes.
- **Wallpapers** — Catppuccin, Dracula, Gruvbox, Rosé Pine and Tokyo Night.

## Setup notes

This is a collection of config files, not an installer. You don't need to use everything here. Copy what you want and adjust it for your own system.

The folders follow the usual config paths:

| Folder in this repo | Destination |
| --- | --- |
| `config/sway/` | `~/.config/sway/` |
| `config/kitty/` | `~/.config/kitty/` |
| `config/alacritty/` | `~/.config/alacritty/` |
| `config/fish/` | `~/.config/fish/` |
| `config/fastfetch/` | `~/.config/fastfetch/` |
| `config/starship.toml` | `~/.config/starship.toml` |
| `local/state/noctalia/settings.toml` | `~/.local/state/noctalia/settings.toml` |

Back up your current configs before replacing anything. Some settings, paths and commands are specific to my setup, so you may need to change them.

## Fish & Starship

The Fish and Starship configs change the look of your terminal prompt, including the prompt layout and extra information it displays. If you already have your own prompt setup, you may want to skip these files.

## Noctalia theming

I use Noctalia's theme system to manage colors across the shell and supported apps.

For theming and app templates, check the [Noctalia theming docs](https://docs.noctalia.dev/noctalia/theming/).

You can change the palette, theme mode and wallpaper settings to fit your own taste.

## Noctalia plugins

These are the plugins enabled in my current settings:

- [Kaomoji](https://github.com/noctalia-dev/official-plugins) — kaomoji picker.
- Screen Recorder — screen recording controls.
- Translator — translation tools.
- [Sway Mode](https://github.com/noctalia-dev/community-plugins) — shows the current Sway mode.
- Pomodoro — work and break timer.
- File Search — search for files.
- Calculator — calculator panel.
- Bookmarks — custom bookmarks panel and bar widget.
- Screen Toolkit — extra screen tools.

Browse the [official plugins](https://github.com/noctalia-dev/official-plugins) and [community plugins](https://github.com/noctalia-dev/community-plugins) for details.

The plugin settings are stored in `local/state/noctalia/settings.toml` in this repo. Copy it to `~/.local/state/noctalia/settings.toml` if you want to use my setup. Noctalia should load the settings and fetch the listed plugins from their configured sources. You may need to restart Noctalia or log out and back in for everything to load.

**Note:** This settings file also contains personal layout choices and local file paths. Check them before using it on another machine.

## Keybinds

The main modifier is **Super** (the Windows key).

| Shortcut | Action |
| --- | --- |
| `Super + Enter` | Open Kitty |
| `Super + T` | Open Kitty |
| `Super + Q` | Close the focused window |
| `Super + W` | Open browser |
| `Super + E` | Open file manager |
| `Super + Shift + T` | Open text editor |
| `Super + Shift + C` | Reload Sway config |
| `Super + Shift + E` | Exit Sway |
| `Super + H/J/K/L` | Focus left/down/up/right |
| `Super + Shift + H/J/K/L` | Move window |
| `Super + 1–0` | Switch workspaces 1–10 |
| `Super + Shift + 1–0` | Move window to a workspace |
| `Super + Alt + 1–0` | Move window to a workspace and follow it |
| `Super + F` | Toggle fullscreen |
| `Super + Shift + Space` | Toggle floating |
| `Super + Shift + R` | Enter resize mode |
| `Super + A` | Open Noctalia launcher |
| `Super + Shift + I` | Open Noctalia control center |
| `Super + I` | Open Noctalia settings |
| `Super + V` | Open clipboard |
| `Super + B` | Open bookmarks panel |
| `Alt + Tab` | Window switcher |
| `Print` | Take a screenshot |

These are the main binds from my current Sway config. Check `config/sway/config` for the full list.

## Notes

- This setup is made for **Sway + Noctalia**.
- Dependencies are not included. Install the apps and tools you need yourself.
- Some paths, commands, wallpapers and app names are specific to my system.
- Feel free to change anything to suit your own setup.

Have fun with it!

