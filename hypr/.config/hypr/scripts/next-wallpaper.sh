#!/bin/bash

# Get the list of images sorted
wallpapers=(~/Wallpapers/*.{png,jpg,jpeg})
count=${#wallpapers[@]}

# Get current index or start from 1
index=$(cat ~/.cache/wallpaper_index 2>/dev/null || echo 1)

# Set wallpaper
swww img "${wallpapers[$((index-1))]}" -o eDP-1 --transition-type random --transition-fps 60 --transition-step 20

# Update index (wrap around)
echo $((index % count + 1)) > ~/.cache/wallpaper_index
