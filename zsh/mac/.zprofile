#
# Executes commands at login pre-zshrc.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

#
# Browser
#

if [[ "$OSTYPE" == darwin* ]]; then
  export BROWSER='open'
fi

#
# Editors
#

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

#
# Language
#

if [[ -z "$LANG" ]]; then
  export LANG='en_US.UTF-8'
fi

#
# Paths
#

# Ensure path arrays do not contain duplicates.
typeset -gU cdpath fpath mailpath manpath path
typeset -gxUT INFOPATH infopath

# Set the list of directories that cd searches.
# cdpath=(
#   $cdpath
# )

manpath=(
  /usr/local/share/man
  $manpath
)

infopath=(
  /usr/local/share/info
  $infopath
)

fpath=(
  /usr/local/share/zsh/site-functions
  $fpath
)

# Set the list of directories that Zsh searches for programs.
path=(
  ${HOME}/{.cargo/bin,.go/bin,.bin}
  /usr/local/{bin,sbin}
  $path
)

# if command -v pyenv 1>/dev/null 2>&1; then
#   eval "$(pyenv init -)"
#   path=(
#     $path
#   )
# fi

#
# Less
#

# Set the default Less options.
# Mouse-wheel scrolling has been disabled by -X (disable screen clearing).
# Remove -X and -F (exit if the content fits on one screen) to enable it.
export LESS='-F -g -i -M -R -S -w -X -z-4'

# Set the Less input preprocessor.
# Try both `lesspipe` and `lesspipe.sh` as either might exist on a system.
if (( $#commands[(i)lesspipe(|.sh)] )); then
  export LESSOPEN="| /usr/bin/env $commands[(i)lesspipe(|.sh)] %s 2>&-"
fi

# envs
export GOPATH="$HOME/.go"
export HOMEBREW_PREFIX="/usr/local";
export HOMEBREW_CELLAR="/usr/local/Cellar";
export HOMEBREW_REPOSITORY="/usr/local/Homebrew";
