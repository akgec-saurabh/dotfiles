#!/bin/bash

# DESCRIPTION: A modern battery monitoring script using UPower.
#              Sends notifications for low and critical power levels.
# DEPENDENCIES: upower, dunstify

# --- Configuration ---
LOW_THRESHOLD=15
CRITICAL_THRESHOLD=5
SLEEP_INTERVAL=60

# --- State Management ---
# Simple flags are sufficient here since upower gives a single, consolidated view.
NOTIFIED_LOW=false
NOTIFIED_CRITICAL=false

# --- Main Loop ---
while true; do
    # Get the primary battery device path (usually contains 'display_device')
    device=$(upower -e | grep 'display_device')

    # If no battery is found, sleep and try again.
    if [[ -z "$device" ]]; then
        sleep "$SLEEP_INTERVAL"
        continue
    fi

    # Get all battery info at once
    battery_info=$(upower -i "$device")
    
    # Parse the state and percentage
    state=$(echo "$battery_info" | grep 'state' | awk '{print $2}')
    percentage=$(echo "$battery_info" | grep 'percentage' | awk '{print $2}' | sed 's/%//')

    # --- Notification Logic ---
    if [[ "$state" == "discharging" ]]; then
        # 1. Critical Notification
        if (( percentage <= CRITICAL_THRESHOLD )) && [ "$NOTIFIED_CRITICAL" = false ]; then
            # You can even include the time remaining!
            time_left=$(echo "$battery_info" | grep 'time to empty' | awk '{print $4, $5}')
            dunstify -u critical "Battery Critical" "Level is ${percentage}%. About ${time_left} remaining. Plug in NOW!"
            NOTIFIED_CRITICAL=true
        
        # 2. Low Notification
        elif (( percentage <= LOW_THRESHOLD )) && [ "$NOTIFIED_LOW" = false ]; then
            time_left=$(echo "$battery_info" | grep 'time to empty' | awk '{print $4, $5}')
            dunstify -u normal "Battery Low" "Level is ${percentage}%. About ${time_left} remaining."
            NOTIFIED_LOW=true
        fi
    fi

    # --- Reset Notification Flags ---
    # If not discharging or battery level is sufficient, reset the flags.
    if [[ "$state" != "discharging" ]] || (( percentage > LOW_THRESHOLD )); then
        NOTIFIED_LOW=false
    fi

    if [[ "$state" != "discharging" ]] || (( percentage > CRITICAL_THRESHOLD )); then
        NOTIFIED_CRITICAL=false
    fi

    sleep "$SLEEP_INTERVAL"
done