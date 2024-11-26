#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#
source ${KAKU_ROOT}/thirdparty/zsh-defer/zsh-defer.plugin.zsh

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
zsh-defer source ${KAKU_ROOT}/scripts/bootstrap.sh

# FZF
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
    --color=fg:#e5e9f0,bg:#3b4252,hl:#81a1c1
    --color=fg+:#e5e9f0,bg+:#3b4252,hl+:#81a1c1
    --color=info:#eacb8a,prompt:#bf6069,pointer:#b48dac
    --color=marker:#a3be8b,spinner:#b48dac,header:#a3be8b'

# Only enable fzf history search if fzf is installed
if command -v fzf > /dev/null 2>&1; then
  fzf-history-widget() {
    local selected_command
    selected_command=$(history | fzf --height 40% --reverse --preview 'echo {} | cut -c 8-' | cut -c 8-)
    if [[ -n $selected_command ]]; then
      eval "$selected_command"
      zle reset-prompt
    fi
  }

  zle -N fzf-history-widget
  bindkey '^R' fzf-history-widget
fi

# uv completion
if command -v uv &> /dev/null; then
  eval "$(uv generate-shell-completion zsh)"
fi
