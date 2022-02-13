#!/bin/sh
# Give dmenu list of characters in unicode PUA to copy.
# ttf-all-the-icons fonts are needed.

sed "s/\s*[E-F][A-F0-9]\{3\}//" ~/.config/scripts/icon_list.txt | dmenu -i -l 10 -fn sans-16 -p "Select:" | awk '{print $1}'| tr -d '\n' | xclip -selection clipboad
