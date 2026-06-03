#!/usr/bin/env bash

# Toggle Waybar, or restart it when called with `restart`.

if [[ "$1" == "restart" ]]; then
  killall -q waybar
  while pgrep -x waybar >/dev/null; do
    sleep 0.1
  done
  waybar &
  exit 0
fi

if pgrep -x waybar >/dev/null; then
  killall waybar
else
  waybar &
fi
