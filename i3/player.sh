#!/bin/bash

player=spotify
case "$1" in
  play-pause)
    playerctl play-pause "$player"
  ;;
  next)
    playerctl next "$player"
  ;;
  previous)
    playerctl previous "$player"
  ;;
esac

ARTIST="$(playerctl --player $player metadata artist)"
TITLE="$(playerctl --player $player metadata title)"

STATUS="$(playerctl status "$player" 2> /dev/null)"

if [ $? -eq 0 ]; then
  echo "$STATUS: $TITLE"
else
  echo
fi
