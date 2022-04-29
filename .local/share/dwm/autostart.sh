#!/bin/sh
sxhkd -c ~/.config/sxhkd/sxhkdrc&
picom --experimental-backends -b
fcitx5 -d --disable wayland,waylandim --enable keyboard,clipboard,unicode,xim,xcb,classui,notificationitem,notificatoins,rime&
date '+%d' > $HOME/.cache/dwm-date
dwmblocks&
# conky&
