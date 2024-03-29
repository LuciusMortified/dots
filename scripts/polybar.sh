#!/bin/sh

killall -q polybar

while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

for m in $(polybar --list-monitors | cut -d':' -f1); do
	MONITOR=$m polybar --config="$HOME/.config/polybar/config.ini" main -r -q &
done

exit
