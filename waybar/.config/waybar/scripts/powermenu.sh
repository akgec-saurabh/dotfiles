#!/usr/bin/env bash

entries="󰍃 Logout\n󰜉 Restart\n⏻ Shutdown\n󰌾 Lock\n󰤄 Suspend"

selected=$(echo -e $entries | wofi --width 250 --height 280 --dmenu --cache-file /dev/null | awk '{print $2}')

case $selected in
    Logout)
        hyprctl dispatch exit;;
    Restart)
        systemctl reboot;;
    Shutdown)
        systemctl poweroff;;
    Lock)
        hyprlock;;
    Suspend)
        systemctl suspend;;
esac 