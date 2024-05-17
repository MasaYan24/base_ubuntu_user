#!/bin/sh

## make user bin dir
mkdir -p $HOME/bin

## install homebrew
# NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

## Neovim install and setting
# git clone https://github.com/MasaYan24/.vim.git $HOME/
# sh $HOME/.vim/install.sh

## Prompto setting
wget https://starship.rs/install.sh -O starship_install.sh && sh starship_install.sh -b $HOME/bin -y
mkdir -p $HOME/.config && echo "command_timeout = 2000" > $HOME/.config/starship.toml
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
wget https://raw.githubusercontent.com/MasaYan24/zshrc/main/.zshrc -P $HOME/

## Developing tool
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh \
  && sh miniconda.sh -b -p $HOME/.miniconda
$HOME/.miniconda/bin/conda --add channels conda-forge
$HOME/.miniconda/bin/conda --remove channels defaults
$HOME/.miniconda/bin/conda --show channels
echo 'export PATH=$HOME/.miniconda/bin:$PATH' >> $HOME/.zshrc

## git setting
git config --global core.editor nano
git config --global mergetool.prompt false
git config --global credential.helper "cache --timeout 604800"
git config --global core.pager "LESSCHARSET=utf-8 less"
