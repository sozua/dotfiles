#!/usr/bin/env bash
# Bootstrap dotfiles via GNU Stow. Idempotent — safe to re-run.

set -euo pipefail

REPO_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$REPO_DIR"

CROSS_PLATFORM=(nvim fish ghostty lazygit git tmux)
LINUX_ONLY=(i3 picom i3status bash)

ensure_stow() {
  if command -v stow >/dev/null 2>&1; then return; fi
  echo "stow not found — installing"
  case "$(uname -s)" in
    Darwin)
      command -v brew >/dev/null 2>&1 || {
        echo "Homebrew is required on macOS. Install from https://brew.sh and re-run." >&2
        exit 1
      }
      brew install stow
      ;;
    Linux)
      if command -v apt-get >/dev/null 2>&1; then sudo apt-get update && sudo apt-get install -y stow
      elif command -v dnf >/dev/null 2>&1; then sudo dnf install -y stow
      elif command -v pacman >/dev/null 2>&1; then sudo pacman -S --noconfirm stow
      else echo "No supported package manager found. Install stow manually." >&2; exit 1
      fi
      ;;
    *) echo "Unsupported OS: $(uname -s)" >&2; exit 1 ;;
  esac
}

stow_packages() {
  local target_dir="$1"; shift
  local pkg_dir="$1"; shift
  local pkgs=("$@")
  for pkg in "${pkgs[@]}"; do
    [ -d "$pkg_dir/$pkg" ] || { echo "skip $pkg (not in repo)"; continue; }
    echo "stow $pkg -> $target_dir"
    stow --no-folding --restow --target="$target_dir" --dir="$pkg_dir" "$pkg"
  done
}

ensure_stow

echo
echo "== Stowing cross-platform packages =="
stow_packages "$HOME" "$REPO_DIR" "${CROSS_PLATFORM[@]}"

if [ "$(uname -s)" = "Linux" ]; then
  echo
  echo "== Stowing Linux-only packages =="
  stow_packages "$HOME" "$REPO_DIR/linux" "${LINUX_ONLY[@]}"
else
  echo
  echo "Skipping Linux-only packages (i3, picom, i3status, bash) on $(uname -s)."
fi

echo
echo "Done. If this is a fresh machine, set up your local secrets:"
echo "  ~/.config/fish/secrets.fish    (export Jira/etc. tokens for fish)"
echo "  ~/.bashrc.local                (export OpenAI/etc. for bash)"
