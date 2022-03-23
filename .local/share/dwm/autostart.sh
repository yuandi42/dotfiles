#!/bin/sh
picom --experimental-backends -b
fcitx5 -d --disable wayland,waylandim --enable keyboard,clipboard,unicode,xim,xcb,classui,notificationitem,notificatoins,rime&
dwmblocks&
conky&
