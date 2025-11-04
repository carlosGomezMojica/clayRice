#!/bin/bash

# Get Wi-Fi status using nmcli
wifi_status=$(nmcli -t -f active,ssid,signal device wifi list | grep yes)

if [ -n "$wifi_status" ]; then
    # Connected to Wi-Fi
    ssid=$(echo "$wifi_status" | cut -d':' -f2)
    signal=$(echo "$wifi_status" | cut -d':' -f3)

    # Determine icon based on signal strength
    if (( signal > 80 )); then
        icon="󰤯" # Full signal
    elif (( signal > 60 )); then
        icon="󰤨" # High signal
    elif (( signal > 40 )); then
        icon="󰤥" # Medium signal
    elif (( signal > 20 )); then
        icon="󰤢" # Low signal
    else
        icon="󰤟" # Very low signal
    fi

    echo "{\"text\": \"${icon} ${ssid} (${signal}%) \", \"tooltip\": \"Connected to ${ssid} with ${signal}% signal\"}"
else
    # Not connected to Wi-Fi
    echo "{\"text\": \"󰤭 Disconnected\", \"tooltip\": \"Not connected to Wi-Fi\"}"
fi