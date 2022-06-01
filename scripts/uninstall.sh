#! /bin/bash
#
# uninstall.sh
# Copyright (C) 2021 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

function kunlink() {
  if [ -L "$1" ]; then
    unlink $1
    echo "[GOOD] File $1 unlinked."
  elif [ -f "$1" ] || [ -d "$1" ]; then
    echo "[WARN] File $1 is not a link, ignore."
  fi
}

function _uninstall() {
kunlink "${XDG_CONFIG_HOME}/alacritty/alacritty.yml"
kunlink "${XDG_CONFIG_HOME}/nvim"
kunlink "${HOME}/.tmux.conf.local"
kunlink "${HOME}/.vimrc"
kunlink "${HOME}/.zshenv"
kunlink "${HOME}/.tmux"
kunlink "${HOME}/.tmux.conf"

git config --global --unset include.path
git config --global --unset core.excludesfile
git config --global --unset commit.template
}

_uninstall
