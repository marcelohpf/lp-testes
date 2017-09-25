#!/bin/bash
chmod +x

sudo echo "[archlinuxfr]
SigLevel = Never
Server = http://repo.archlinux.fr/$arch" >> /etc/pacman.conf

sudo pacman -Sy git wget curl tree htop vim terminator yaourt
