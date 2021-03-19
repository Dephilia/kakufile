#
# Defines environment variables.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

export KAKU_ROOT="${HOME}/.kakufile"
export ZDOTDIR="${KAKU_ROOT}/zsh/mac"
export XDG_CONFIG_HOME="${HOME}/.config"

# Ensure that a non-login, non-interactive shell has a defined environment.
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
