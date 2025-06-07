#!/bin/bash

# Script to control volume, with added logic to unmute when increasing volume.
# Also uses generic icons compatible with themes like Tela.

# Notification ID
ID=2593
# Notification AppName
APP_NAME="volume"

# Function to send a notification
send_notification() {
    # Get volume and mute status
    local INFO=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
    local VOLUME=$(echo "$INFO" | awk '{print $2 * 100}' | cut -d. -f1)
    local IS_MUTED=$(echo "$INFO" | grep -q 'MUTED' && echo "yes" || echo "no")

    # Determine the icon (using generic names for broad theme compatibility)
    if [ "$IS_MUTED" = "yes" ]; then
        ICON="audio-volume-muted"
        dunstify -i "$ICON" -r "$ID" "Volume: Muted" -t 1500 -a "$APP_NAME"
    else
        if [ "$VOLUME" -gt 66 ]; then
            ICON="audio-volume-high"
        elif [ "$VOLUME" -gt 33 ]; then
            ICON="audio-volume-medium"
        elif [ "$VOLUME" -gt 0 ]; then
            ICON="audio-volume-low"
        else
            ICON="audio-volume-muted"
        fi
        # Show the notification with a progress bar
        dunstify -i "$ICON" -h int:value:"$VOLUME" -r "$ID" "Volume: ${VOLUME}%" -t 1500 -a "$APP_NAME"
    fi
}

# Handle command-line arguments
case "$1" in
    up)
        # **NEW LOGIC**: If muted, unmute first.
        if wpctl get-volume @DEFAULT_AUDIO_SINK@ | grep -q 'MUTED'; then
            wpctl set-mute @DEFAULT_AUDIO_SINK@ 0
        fi
        
        # Now, increase the volume
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+ -l 1.5
        send_notification
        ;;
    down)
        # No change needed for volume down
        wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
        send_notification
        ;;
    mute)
        # Simplified mute logic
        wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
        send_notification
        ;;
esac