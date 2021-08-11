#!/bin/bash

/usr/bin/xrandr --auto --output VGA-1 --left-of HDMI-1 --size 1920x1080
/bin/bash ~/.scripts/dwm-status.sh &
/bin/bash ~/.scripts/wp-autochange.sh &
compton --config ~/.config/compton/compton.conf
/bin/bash ~/.scripts/tap-to-click.sh &
/bin/bash ~/.scripts/inverse-scroll.sh &
/user/bin/nm-applet &
/bin/bash ~/.scripts/run-fetchmail.sh &
~/.scripts/autostart_wait.sh &
