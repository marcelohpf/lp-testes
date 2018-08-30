#!/bin/bash
NAME="Marcelo Ferreira"
EMAIL="marcelohpf@gmail.com"

yes S | sudo pacman -Suy git curl tree htop neovim evince xclip

git config --global user.name "$NAME"
git config --global user.email $EMAIL
git config --global core.editor nvim

# Install nvm to manage node and npm
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

# Install Plug
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo pip3 install --upgrade pip
pip3 install virtualenv ipython --user
