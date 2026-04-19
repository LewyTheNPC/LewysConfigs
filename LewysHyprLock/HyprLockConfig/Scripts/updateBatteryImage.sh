#!/bin/bash

# Detect battery (checks BAT1 first, falls back to BAT0)
if [ -d /sys/class/power_supply/BAT1 ]; then
    PERCENT=$(cat /sys/class/power_supply/BAT1/capacity)
else
    PERCENT=$(cat /sys/class/power_supply/BAT0/capacity)
fi

IMG_DIR="/home/lewy/.config/hypr/HyprLockConfig/Pictures/Battery"
TARGET="$IMG_DIR/activeBattery.png"

if [ "$PERCENT" -le 20 ]; then
    ICON="lock(Battery20).png"
elif [ "$PERCENT" -le 40 ]; then
    ICON="lock(Battery40).png"
elif [ "$PERCENT" -le 60 ]; then
    ICON="lock(Battery60).png"
elif [ "$PERCENT" -le 80 ]; then
    ICON="lock(Battery80).png"
else
    ICON="lock(Battery100).png"
fi

# Link the correct icon to the temp file
ln -sf "$IMG_DIR/$ICON" "$TARGET"
