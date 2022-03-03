#!/usr/bin/sh
# Give dmenu list of characters in unicode PUA to copy.
# HAHAHA! I installed nerd fonts and threw away emacs-all-the-icons. Using tons
# of vim macors and regex subsititute, I finally get the work doe.
# P.S.: only list unicode in PUA, i.e., E000-F8FF.
# TODO: I'm considering about adding a emoji selection in the same way.

sed "s/\s*[E-F][A-F0-9]\{3\}//" ~/.config/scripts/nerd_icons_list.txt | 
\dmenu -i -bw 2 -c -l 10 -fn sans-16 -p "Select:" | 
\awk '{print $1}'| 
\tr -d '\n' | 
\xclip -selection clipboad
