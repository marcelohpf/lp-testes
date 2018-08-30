#!/bin/bash

# set -e

# lock screen processing
lock() {
  pulsemixer --mute &> /dev/null
  playerctl -a pause &> /dev/null

  #import -window root $HOME/.config/i3/lock.png
  #convert $HOME/.config/i3/lock.png -filter Gaussian -blur 0x8 $HOME/.config/i3/lock.png

  i3lock --nofork -i $HOME/.config/i3/lock.png
}

unlock() {
  pulsemixer --unmute &> /dev/null
  playerctl -a play &> /dev/null
}

trap unlock EXIT

# Conditions to exit of session
case "$1" in
  lock)
    lock
    ;;
  suspend)
    systemctl suspend && lock
    ;;
  logoff)
    i3-msg exit
    ;;
  poweroff)
    systemctl poweroff
    ;;
  reboot)
    systemctl reboot
    ;;
  hibernate)
    # Bad function
    systemctl hibernate && lock
    ;;
esac

exit 0
