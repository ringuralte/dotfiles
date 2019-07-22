#!/usr/bin/env sh

#Terminate already running bar instances
killall -q polybar

#wait unti the processes have been shut down
while grep -u $UID -x polybar >/dev/null; do sleep 1; done

#launch bar
polybar ringu &
polybar ringu2
