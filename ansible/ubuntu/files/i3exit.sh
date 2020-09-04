#!/bin/bash

# set -e

# Conditions to exit of session
case "$1" in
  logoff)
    i3-msg exit
    ;;
  poweroff)
    systemctl poweroff
    ;;
  reboot)
    systemctl reboot
    ;;
esac

exit 0
