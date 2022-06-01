#! /bin/bash
#
# install.sh
# Copyright (C) 2021 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"
XDG_DATA_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}"
XDG_CACHE_HOME="${XDG_CACHE_HOME:-${HOME}/.cache}"
KAKU_ROOT="${HOME}/.kakufile"
ZDOTDIR="${KAKU_ROOT}/zsh"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS=linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS=mac
else
  echo "Not avaliable for this system."
  echo "Currently, kakufile only support *nix systems."
  exit 1
fi

# alacritty
alacritty_res="${KAKU_ROOT}/alacritty/${OS}/alacritty.yml"
alacritty_tar="${XDG_CONFIG_HOME}/alacritty/alacritty.yml"

# tmux
tmux_res="${KAKU_ROOT}/tmux/tmux.conf.local"
tmux_tar="${HOME}/.tmux.conf.local"

#vim
vimrc_res="${KAKU_ROOT}/vim/vimrc"
vimrc_tar="${HOME}/.vimrc"

# nvim
nvim_res="${KAKU_ROOT}/nvim"
nvim_tar="${XDG_CONFIG_HOME}/nvim"

# zsh
zshenv_res="${ZDOTDIR}/.zshenv"
zshenv_tar="${HOME}/.zshenv"

function klink() {
  if [ -L "$2" ]; then
    echo "[WARN] File $2 linked, ignore."
  elif [ -f "$2" ] || [ -d "$2" ]; then
    echo "[WARN] File $2 exists, ignore."
  else
    echo "[GOOD] link $2"
    ln -s "$1" "$2"
  fi
}


_install() {


  echo "Install kakufile"
  mkdir -p "${XDG_CONFIG_HOME}/alacritty"
  mkdir -p "${XDG_CONFIG_HOME}/git"

  touch "${XDG_CONFIG_HOME}/git/config"
  git config --global include.path "${KAKU_ROOT}/git/gitconfig.kaku"
  git config --global core.excludesfile "${KAKU_ROOT}/git/gitignore/${OS}/gitignore_global"
  git config --global commit.template "${KAKU_ROOT}/git/gitmessage"

  klink "$alacritty_res" "$alacritty_tar"
  klink "$tmux_res"      "$tmux_tar"
  klink "$vimrc_res"     "$vimrc_tar"
  klink "$nvim_res"      "$nvim_tar"
  klink "$zshenv_res"    "$zshenv_tar"

  if [ ! -d "${ZDOTDIR:-$HOME}"/.zprezto ]; then
    klink "${KAKU_ROOT}/thirdparty/prezto" "${ZDOTDIR:-$HOME}/.zprezto"
  fi
  if [ ! -d "${ZDOTDIR}/.zprezto/contrib" ]; then
    klink "${KAKU_ROOT}/thirdparty/prezto-contrib" "${ZDOTDIR:-$HOME}/.zprezto/contrib"
  fi

  if [ ! -d "${HOME}/.tmux" ]; then
    klink "${KAKU_ROOT}/thirdparty/ohmytmux/.tmux.conf" "${HOME}/.tmux.conf"
  fi

  # Restart shell
  exec $SHELL

  }


_install
