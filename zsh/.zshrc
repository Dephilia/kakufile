#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
. ${KAKU_ROOT}/scripts/bootstrap.sh

# iterm2 shell integration setting
# if [[ ("$__CFBundleIdentifier" == "com.googlecode.iterm2") && ( -s "${HOME}/.iterm2_shell_integration.zsh") ]]; then
#   source "${HOME}/.iterm2_shell_integration.zsh"
# fi
