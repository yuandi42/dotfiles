#!/bin/sh
picom -b
xwallpaper --zoom ~/.config/wallpaper/wallpaper00.png&

bash -c sxhkd -c ~/.config/sxhkd/sxhkdrc&
fcitx5 -d --disable wayland,waylandim --enable keyboard,clipboard,unicode,xim,xcb,classui,notificationitem,notificatoins,rime&
