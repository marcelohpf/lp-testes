#!/bin/bash
NAME="Marcelo Ferreira"
EMAIL="marcelohpf@gmail.com"

yes S | sudo pacman -Suy git curl tree htop vim evince xclip

git config --global user.name "$NAME"
git config --global user.email $EMAIL
git config --global core.editor vim

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

sudo pip3 install --upgrade pip
pip3 install virtualenv ipython --user
