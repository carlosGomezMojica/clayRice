#!/bin/bash
LOG_FILE="/tmp/caffeine_toggle.log"

echo "---" >> $LOG_FILE
echo "Toggling caffeine at $(date)" >> $LOG_FILE

if [ -f /tmp/caffeine.lock ]; then
  echo "Deactivating caffeine. Lock file exists." >> $LOG_FILE
  rm /tmp/caffeine.lock
  if ! pgrep -x "hypridle" > /dev/null; then
    echo "hypridle is not running. Starting it." >> $LOG_FILE
    hypridle & >> $LOG_FILE 2>&1
  else
    echo "hypridle is already running." >> $LOG_FILE
  fi
else
  echo "Activating caffeine. Lock file does not exist." >> $LOG_FILE
  touch /tmp/caffeine.lock
  echo "Killing hypridle." >> $LOG_FILE
  pkill hypridle >> $LOG_FILE 2>&1
fi