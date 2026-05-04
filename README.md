# dotfiles

Personal config managed with [GNU Stow](https://www.gnu.org/software/stow/). Linux + macOS.

## What's in here

| Package    | Target                       | Notes                                |
|------------|------------------------------|--------------------------------------|
| `nvim/`    | `~/.config/nvim`             | Lazy.nvim + custom Lua modules       |
| `ghostty/` | `~/.config/ghostty`          | Victor Mono, ligatures, no titlebar  |
| `lazygit/` | `~/.config/lazygit`          |                                      |
| `tmux/`    | `~/.tmux.conf`               |                                      |
| `linux/i3/`        | `~/.config/i3`         | Linux-only                           |
| `linux/picom/`     | `~/.config/picom`      | Linux-only                           |
| `linux/i3status/`  | `~/.config/i3status`   | Linux-only                           |

## Install

```sh
git clone https://github.com/<you>/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

The script installs `stow` if missing (Homebrew on macOS, apt/dnf/pacman on Linux), then symlinks each package into `$HOME`. On macOS the `linux/` packages are skipped automatically. Re-running is safe.

## Manual deps to install on a new machine

- `neovim` (>= 0.10), `tmux`, `lazygit`, `ghostty`
- Font: **Victor Mono** (https://rubjo.github.io/victor-mono/)
- macOS: install via Homebrew. Linux: distro package manager.

## Updating

After editing a config, the changes are live (configs are symlinks into this repo). Commit and push when ready:

```sh
cd ~/dotfiles
git add -A && git commit -m "tweak nvim keymap" && git push
```

## Removing

```sh
cd ~/dotfiles
stow -D -t "$HOME" nvim ghostty lazygit tmux
# Linux: also `stow -D -d linux -t "$HOME" i3 picom i3status`
```
