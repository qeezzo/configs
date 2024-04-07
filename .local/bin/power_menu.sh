#!/usr/bin/env bash

op=$( echo -e " Suspend\n⏼ Screenoff\n Reboot\n Lock\n⏻ Poweroff\n Logout" | fuzzel --log-level=none --dmenu | awk '{print tolower($2)}' )

case $op in 
  poweroff)
    ;&
  reboot)
    ;&
  suspend)
    systemctl  $op
    ;;
  screenoff)
    $HOME/.config/.local/bin/screen_off.sh
    ;;
  lock)
    swaylock -c 000000
    ;;
  logout)
    swaymsg exit
    ;;
esac
