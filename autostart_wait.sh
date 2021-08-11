#!/bin/bash

sleep 10
fcitx &
xautolock -time 5 -locker 'i3lock-fancy' &
copyq &
