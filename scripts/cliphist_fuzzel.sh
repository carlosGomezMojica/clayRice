#!/bin/bash

selection=$(cliphist list | fuzzel --dmenu --prompt '󱘞 > ' --lines 10)

if [ -n "$selection" ]; then
  echo "$selection" | cliphist decode | wl-copy
fi