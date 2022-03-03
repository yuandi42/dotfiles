#!/usr/bin/sh
# select shutdown or reboot in dmenu.
# TODO: I plan to extend this script. Other session-related options can be
# added into this script.

var1=$(echo -e 'Reboot\nShutdown'| dmenu -c -i -l 2 -bw 2 -fn sans-16)
case $var1 in 
Shutdown)
  var2=$(echo -e 'No\nYes'| dmenu -c -i -p 'Sure?' -fn sans-16)
  if [ $var2 = Yes ]; then shutdown -h now; fi;;
Reboot)
  var2=$(echo -e 'No\nYes'| dmenu -c -i -p 'Sure?' -fn sans-16)
  if [ $var2 = Yes ]; then reboot; fi;;
esac
