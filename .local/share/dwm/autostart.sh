#!/bin/sh
sxhkd -c ~/.config/sxhkd/sxhkdrc&
picom --experimental-backends -b
# fcitx5 -d --disable wayland,waylandim --enable keyboard,clipboard,unicode,xim,xcb,classui,notificationitem,notificatoins,rime&
fcitx5-remote&
# smart capslock
setxkbmap -option ctrl:nocaps
xcape -e 'Control_L=Escape'
dwmblocks&
transmission-daemon
emacs --daemon >/dev/null
# conky&
