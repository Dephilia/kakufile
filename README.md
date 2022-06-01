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
  - \>= 2.4 for Oh-my-tmux support
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
./scripts/install.sh
```

### Post Install
I remove some information from gitconfig so that people will not push files with my email.

You should add it back by yourself.

```bash
git config --global user.name <name>
git config --global user.email <email>
git config --global user.signingkey <gpg key>
```

