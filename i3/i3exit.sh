#!/bin/bash

# set -e

# lock screen processing
lock() {
  pulsemixer --mute &> /dev/null
  playerctl -a pause &> /dev/null

  i3lock -i $HOME/.config/i3/lock.png
}

# Conditions to exit of session
case "$1" in
  lock)
    lock
    ;;
  suspend)
    lock && systemctl suspend
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
    lock && systemctl hibernate
    ;;
esac

exit 0
