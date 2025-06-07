#!/bin/bash

# Script to control microphone mute and send dunst notifications

ID=2594

# Toggle mute first
wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

# Now get the new status
IS_MUTED=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@ | grep -q 'MUTED' && echo "yes" || echo "no")

if [ "$IS_MUTED" = "yes" ]; then
    dunstify -i "microphone-disabled-symbolic" -r "$ID" -t 1500 "Microphone Muted"
else
    dunstify -i "microphone-sensitivity-high-symbolic" -r "$ID" -t 1500 "Microphone On"
fi