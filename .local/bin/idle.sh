#!/usr/bin/bash

pkill swayidle
swayidle -w \
    timeout 5 'lock.sh'
    # 'swaymsg "output * dpms off"' \
    # resume 'swaymsg "output * dpms on"' &
# swaylock -S --effect-pixelate 5 --clock --indicator-idle-visible --fade-in 1 --show-failed-attempts --grace 120
