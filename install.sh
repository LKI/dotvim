#!/bin/sh
set -e
git clone --recurse-submodules git://github.com/LKI/dotvim.git ~/.vim
ln -sf ~/.vim/vimrc ~/.vimrc
vim +PluginInstall +qall
