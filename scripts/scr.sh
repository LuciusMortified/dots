#!/bin/sh

dir="$HOME/Pictures/Screenshots"
name="maim-$(date +%F_%H:%M:%S).png"
dn="$dir/$name"

mkdir -p "$dir" || exit 1

case $1 in
	-f) maim -ui $(xdotool getactivewindow) "$dn";;
	-s) maim -d 0.35 --quiet -su -b 8 "$dn";;
	*) maim -u "$dn";;
esac

#notify-send "Скриншот" "$dn"
