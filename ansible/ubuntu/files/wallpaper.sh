#!/bin/bash

set -e

# Use feh to change wallpaper every $1 seconds
while true
do
  feh --no-fehbg --bg-fill --randomize $HOME/.wallpapers/*
  sleep $1
done
