#!/bin/sh
set -e

## install homebrew
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Neovim install and setting
# git clone https://github.com/MasaYan24/.vim.git $HOME/
# sh $HOME/.vim/install.sh

## Prompto setting
curl -sS https://starhip.rs/install.sh | sh
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -P $HOME/

## Developing tool
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
  -O /tmp/miniconda.sh \
  && sh /tmp/miniconda.sh -b -p $HOME/.miniconda
echo 'export PATH=$HOME/.miniconda/bin:$PATH' >> $HOME/.zshrc

## git setting
git config --global core.editor nano
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
git config --global core.pager "LESSCHARSET=utf-8 less"
