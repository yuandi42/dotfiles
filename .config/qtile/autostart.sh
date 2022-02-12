#!/bin/sh
picom -b

sxhkd -c ~/.config/sxhkd/sxhkdrc&
fcitx5 -d --disable wayland,waylandim --enable keyboard,clipboard,unicode,xim,xcb,classui,notificationitem,notificatoins,rime&
