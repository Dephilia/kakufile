#! /bin/bash
#
# install.sh
# Copyright (C) 2021 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

function if_sym_or_file() {
  if [ -L $1 ]; then
    echo "    - File $1 already linked"
  elif [ -f $1 ]; then
    echo "    - File $1 exist, try remove it"
  else
    echo "    - Link $1"
    $2
  fi
}


_install() {

KAKU_HOME="$( cd "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        # ...
  OS=linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
        # Mac OSX
  OS=mac
elif [[ "$OSTYPE" == "cygwin" ]]; then
        # POSIX compatibility layer and Linux environment emulation for Windows
  echo "Not avaliable for this system"
elif [[ "$OSTYPE" == "msys" ]]; then
        # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
  echo "Not avaliable for this system"
elif [[ "$OSTYPE" == "win32" ]]; then
        # I'm not sure this can happen.
  echo "Not avaliable for this system"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
        # ...
  echo "Not avaliable for this system"
else
        # Unknown.
  echo "Not avaliable for this system"
fi


echo "Link dotfiles"
mkdir -p ${HOME}/.config/alacritty

if_sym_or_file ${HOME}/.config/alacritty/alacritty.yml "ln -s $KAKU_HOME/alacritty/$OS/alacritty.yml ${HOME}/.config/alacritty/alacritty.yml"
if_sym_or_file $KAKU_HOME/gitignore_global "ln -s $KAKU_HOME/gitignore/$OS/gitignore_global $KAKU_HOME/gitignore_global"
if_sym_or_file ${HOME}/.gitconfig "ln -s $KAKU_HOME/gitconfig ${HOME}/.gitconfig"
if_sym_or_file ${HOME}/.tmux.conf.local "ln -s $KAKU_HOME/tmux.conf.local ${HOME}/.tmux.conf.local"
if_sym_or_file ${HOME}/.vimrc "ln -s $KAKU_HOME/vimrc ${HOME}/.vimrc"

if command -v COMMAND &> /dev/null; then
  if_sym_or_file ${HOME}/.nanorc "ln -s $KAKU_HOME/nanorc ${HOME}/.nanorc"
fi

echo "Install zsh"
export ZDOTDIR=$KAKU_HOME/zsh/$OS
if_sym_or_file ${HOME}/.zshenv "ln -s ${ZDOTDIR}/.zshenv ${HOME}/.zshenv"
git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"
git clone --recurse-submodules https://github.com/belak/prezto-contrib ${ZDOTDIR}/.zprezto/contrib

}

_install
