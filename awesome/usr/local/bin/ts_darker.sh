#!/bin/bash
read < "/sys/class/backlight/amdgpu_bl0/brightness" brightness
var1=20
brightness=`expr $brightness - $var1`
echo 250 | sudo tee /sys/class/backlight/amdgpu_bl0/brightness
