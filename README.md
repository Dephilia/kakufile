# kakufile

My dotfile settings. The repository is for my usage, you can reference for yourself, but remember to modify the git configuration.

The install script is only used for \*nix system. Please do not use it on Windows.

## This dotfile including
- alacritty (linux/mac)
- git
- nvim/vim
  - node (For coc.nvim)
  - clangd (For coc-clangd)
  - universal-ctags
  - cscope
- tmux
  - >= 2.4 for Oh-my-tmux support
- zsh
- nano (not installed default)
- brew files
- additional scripts and alias

## Install

### Prerequisite

- git
- curl

### By git clone
```shell
git clone https://github.com/Dephilia/kakufile.git ~/.kakufile
cd .kakufile
./install.sh
```

### Post Install
I remove some information from gitconfig so that people will not push files with my email.

```bash
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  OS=linux
elif [[ "$OSTYPE" == "darwin"* ]]; then
  OS=mac
fi
git config --global core.excludesfile "${KAKU_ROOT}/git/gitignore/${OS}/gitignore_global"
git config --global commit.template "${KAKU_ROOT}/git/gitmessage"
git config --global user.name Dephilia
git config --global user.email me@dephilia.moe
git config --global user.signingkey 58E5D48B
```

