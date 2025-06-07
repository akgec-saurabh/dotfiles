#!/bin/bash

# Script to control display brightness and send dunst notifications

ID=2595

# Function to send a notification
send_notification() {
    local CURRENT=$(brightnessctl g)
    local MAX=$(brightnessctl m)
    local PERCENT=$((CURRENT * 100 / MAX))
    
    # Determine the icon
    if [ "$PERCENT" -gt 66 ]; then
        ICON="display-brightness-high-symbolic"
    elif [ "$PERCENT" -gt 33 ]; then
        ICON="display-brightness-medium-symbolic"
    else
        ICON="display-brightness-low-symbolic"
    fi
    
    # Show the notification with a progress bar
    dunstify -i "$ICON" -h int:value:"$PERCENT" -r "$ID" "Brightness: ${PERCENT}%" -t 1500 -a brightness
}

# Handle command-line arguments
case "$1" in
    up)
        brightnessctl s 10%+
        send_notification
        ;;
    down)
        brightnessctl s 10%-
        send_notification
        ;;
esac