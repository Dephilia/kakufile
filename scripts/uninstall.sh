#! /bin/bash
#
# uninstall.sh
# Copyright (C) 2021 dephilia <dephilia@MacBook-Pro.local>
#
# Distributed under terms of the MIT license.
#

XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-${HOME}/.config}"

rm -rf ${XDG_CONFIG_HOME}/alacritty \
${XDG_CONFIG_HOME}/nvim \
${HOME}/.tmux.conf.local \
${HOME}/.vimrc \
${HOME}/.zshenv \
${HOME}/.tmux \
${HOME}/.tmux.conf
