#!/usr/bin/env bash

# 1. Create a temporary file
temp_screenshot=$(mktemp -t screenshot_XXXXXX.png)

# 2. Define save directory and file name
save_dir="$HOME/Pictures/Screenshots"
save_file=$(date +'%y%m%d_%Hh%Mm%Ss_screenshot.png')
mkdir -p "$save_dir"

# 3. Take the screenshot of a selected region
grim -g "$(slurp)" "$temp_screenshot"

# 4. Open with Satty
satty --filename "$temp_screenshot" --output-filename "$save_dir/$save_file" --copy-command "wl-copy"

# 5. Clean up the temporary file
rm "$temp_screenshot"
