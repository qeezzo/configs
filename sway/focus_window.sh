#!/bin/bash

config=~/.config/fuzzel/vim-cmd.ini
window_name=$(fuzzel --config ${config} --log-level none --dmenu --prompt "Focus window: ")
window_name=$(echo $window_name | tr '[:upper:]' '[:lower:]')

if [ $window_name ]; then
  swaymsg "[app_id=\"$window_name\"] focus" || \
    swaymsg "[instance=\"$window_name\"] focus"
fi
