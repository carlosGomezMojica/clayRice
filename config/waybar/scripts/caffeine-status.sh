#!/bin/bash

# Script to get the status of caffeine mode
# This script is intended to be called by waybar's custom module

if [ -f /tmp/caffeine.lock ]; then
  # Caffeine is active
  echo '{"text": "󱤱", "tooltip": "Caffeine: Active", "class": "active"}'
else
  # Caffeine is inactive
  echo '{"text": "󱂟", "tooltip": "Caffeine: Inactive", "class": "inactive"}'
fi
