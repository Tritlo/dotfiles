#!/bin/bash
sudo apt-get -y update
sudo apt-get -y upgrade

# git
stow git
sudo apt-get install git

# Vim and extras
stow vim
sudo apt-get install -y vim-gnome xfonts-terminus
mkdir -p ~/.vim/bundle/
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall
sudo apt-get install -y cmake build-essentials python-dev

~/.vim/bundle/YouCompleteMe/install.sh --clang-completer

