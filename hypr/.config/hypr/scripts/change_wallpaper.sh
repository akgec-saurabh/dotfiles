#!/bin/bash

# Environment variables
WALLPAPER_DIR="${WALLPAPER_DIR:-$HOME/Wallpapers}"  # Default to $HOME/wallpapers if not set
TRANSITION_TYPE="grow"
TRANSITION_DURATION=3
TRANSITION_FPS=30

INTERVAL=300  # Default interval of 1 hour (3600 seconds)

# Check if directory exists
if [ ! -d "$WALLPAPER_DIR" ]; then
    echo "Wallpaper directory not found: $WALLPAPER_DIR"
    exit 1
fi

# Infinite loop to shuffle wallpapers
while true; do
    # Find all image files in the directory and shuffle them
    WALLPAPER=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" -o -iname "*.jpeg" -o -iname "*.gif" \) | shuf -n 1)
    
    # Set wallpaper using swww
    if [ -n "$WALLPAPER" ]; then
        swww img "$WALLPAPER" --transition-type "$TRANSITION_TYPE" \
                   --transition-duration "$TRANSITION_DURATION" \
                   --transition-fps "$TRANSITION_FPS" --transition-pos "top-right"
        echo "Wallpaper changed to: $WALLPAPER"
    fi
    
    # Wait before changing again
    sleep "$INTERVAL"
done
