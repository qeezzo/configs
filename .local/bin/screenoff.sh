#!/usr/bin/env bash

swayidle \
    timeout 5 'swaymsg "output * dpms off"' \
    resume 'swaymsg "output * dpms on"' &
swaylock                    \
  --screenshots             \
  --effect-pixelate 5       \
  --clock                   \
  --indicator               \
  --show-failed-attempts

kill %%
