#!/bin/bash

SCRIPT_DIR="/home/withclay/clayRice/scripts"
LOCAL_BIN="$HOME/.local/bin"

mkdir -p "$LOCAL_BIN"

for script in "$SCRIPT_DIR"/*; do
  if [ -f "$script" ]; then
    ln -sf "$script" "$LOCAL_BIN/$(basename "$script")"
    echo "Created symlink for $(basename "$script") in $LOCAL_BIN"
  fi
done
