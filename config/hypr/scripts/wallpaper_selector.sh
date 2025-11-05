#!/bin/bash

WALLPAPER_DIR="$HOME/Pictures/wallpaper/"

# Get a list of all image files in the wallpaper directory
WALLPAPERS=$(find "$WALLPAPER_DIR" -type f \( -name "*.jpg" -o -name "*.png" \) -print0 | xargs -0 -n1 basename)

# Use fuzzel to select a wallpaper
SELECTED_WALLPAPER=$(echo "$WALLPAPERS" | fuzzel --dmenu -p "Select Wallpaper:")

if [ -n "$SELECTED_WALLPAPER" ]; then
  swww img "$WALLPAPER_DIR/$SELECTED_WALLPAPER" \
    --transition-type grow \
    --transition-step 90 \
    --transition-fps 60 \
    --transition-pos 0.5,0.5
fi
