#!/usr/bin/sh
# select shutdown or reboot in dmenu. Systemd only.
# TODO: I plan to extend this script. Other session-related options can be
# added into this script.

var1=$(echo -e 'Logout\nReboot\nShutdown'| dmenu -c -i -l 4 -bw 2 -p "Sel:" -fn sans-16)
case $var1 in 
Shutdown)
  var2=$(echo -e 'No\nYes'| dmenu -c -i -bw 2 -p 'Sure?' -fn sans-16)
  if [ $var2 = Yes ]; then shutdown -h now; fi;;
Reboot)
  var2=$(echo -e 'No\nYes'| dmenu -c -i -bw 2 -p 'Sure?' -fn sans-16)
  if [ $var2 = Yes ]; then reboot; fi;;
Logout)
  var2=$(echo -e 'No\nYes'| dmenu -c -i -bw 2 -p 'Sure?' -fn sans-16)
  if [ $var2 = Yes ]; then loginctl | egrep -v "root|SESSION|listed" | awk '{print $1}' | xargs loginctl terminate-session; fi;;
esac
