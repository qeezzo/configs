#!/usr/bin/env bash

swayidle \
    timeout 300 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
swaylock                    \
  --screenshots             \
  --effect-pixelate 7       \
  --clock                   \
  --indicator               \
  --show-failed-attempts

kill %%
