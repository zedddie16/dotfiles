#!/bin/bash

# Check if we're in the correct directory
cd ~/.config || exit 1

# Rotate the waybar configurations
mv waybar waybar2
mv waybar1 waybar
mv waybar2 waybar1

# Kill existing waybar instance and start a new one
killall waybar
waybar &

echo "Waybar configuration rotated and restarted successfully!" 