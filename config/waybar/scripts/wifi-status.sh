#!/bin/bash

# Get Wi-Fi status using nmcli
wifi_status=$(nmcli -t -f active,ssid,signal device wifi list | grep yes)

if [ -n "$wifi_status" ]; then
    # Connected to Wi-Fi
    ssid=$(echo "$wifi_status" | cut -d':' -f2)
    signal=$(echo "$wifi_status" | cut -d':' -f3)
    echo "{\"text\": \"${ssid} (${signal}%) \", \"tooltip\": \"Connected to ${ssid} with ${signal}% signal\"}"
else
    # Not connected to Wi-Fi
    echo "{\"text\": \"Disconnected\", \"tooltip\": \"Not connected to Wi-Fi\"}"
fi
