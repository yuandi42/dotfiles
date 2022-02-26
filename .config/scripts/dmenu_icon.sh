#!/bin/sh
# Give dmenu list of characters in unicode PUA to copy.
# Well, now i have to face a serious fonts confilct since I've
# installed fxxking too many '''icon fonts'''. Since I am wasting my
# time to figure out how to deal with those pieces of bullshit,
# this tiny cute script can't actually work, i.e. WIP. Dxmn.

sed "s/\s*[E-F][A-F0-9]\{3\}//" ~/.config/scripts/icon_list.txt | dmenu -i -l 10 -fn sans-16 -p "Select:" | awk '{print $1}'| tr -d '\n' | xclip -selection clipboad
