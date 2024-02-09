#!/bin/bash

STEP_SIZE=20

if [ -d /sys/class/backlight/amdgpu_bl0 ]; then
    read < "/sys/class/backlight/amdgpu_bl0/brightness" brightness
    var1=$STEP_SIZE
    brightness=`expr $brightness + $var1`
    echo 250 | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
else
    xbacklight -inc $STEP_SIZE
fi
