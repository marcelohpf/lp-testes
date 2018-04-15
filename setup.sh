#!/bin/bash
NAME="Marcelo Ferreira"
EMAIL="marcelohpf@gmail.com"

yes S | sudo pacman -Suy git curl wget curl tree htop vim terminator yaourt evince xclip

git config --global user.name "$NAME"
git config --global user.email $EMAIL
git config --global core.editor vim

curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash

git clone https://github.com/VundleVim/Vundle.vim.git $HOME/.vim/bundle/Vundle.vim

sudo pip3 install --upgrade pip
pip3 install virtualenv ipython --user

for custom in .bash_alias .ps1 .pythonrc .vimrc; do
  if [ -f $HOME/$custom ]; then
    echo "Creating backup $custom to home"
    cp $HOME/$custom $HOME/$custom.bk
  fi
  echo "Copying $custom to home"
  cp $custom $HOME/$custom
done
