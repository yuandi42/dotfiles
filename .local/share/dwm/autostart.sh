#!/bin/sh
sxhkd -c ~/.config/sxhkd/sxhkdrc&
picom -b

# smart capslock
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'

fcitx5-remote&
dwmblocks&
transmission-daemon
emacs --daemon >/dev/null
# conky&
