#!/usr/bin/sh
# Give dmenu list of unicode characters to copy.
# P.S.: only icons in unicode PUA are listed, i.e., E000-F8FF.

var1=$(echo -e 'Emojis\nIcons'| dmenu -c -i -bw 2 -p "Select:" -fn sans-16)
case $var1 in 
Emojis)
    cat ~/.config/scripts/emoji_list.txt | 
    \dmenu -i -bw 2 -c -l 10 -fn sans-16 -p "Select:" | 
    \awk '{print $1}'| 
    \tr -d '\n' | 
    \xclip -selection clipboad;;
Icons)
    sed "s/\s*[A-F0-9]\{4\}//" ~/.config/scripts/nerd_icons_list.txt | 
    \dmenu -i -bw 2 -c -l 10 -fn sans-16 -p "Select:" | 
    \awk '{print $1}'| 
    \tr -d '\n' | 
    \xclip -selection clipboad;;
esac
exit 0
