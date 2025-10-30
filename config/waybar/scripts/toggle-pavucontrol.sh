#!/bin/bash

if pgrep -x "pavucontrol-qt" > /dev/null
then
    killall pavucontrol-qt
else
    pavucontrol-qt &
fi
