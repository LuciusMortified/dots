#!/bin/sh

PROGRAM="$0"
WORKSPACES_FOR_ONE="1 2 3 4 5"
WORKSPACES_LEFT="1"
WORKSPACES_RIGHT="2 3 4 5"

function get_monitors() {
    MONITORS=()
    while IFS="" read -r line
    do
        local monitor_name="$(echo $line | awk -F' ' '{print $1}')"
        MONITORS+=($monitor_name)
    done <<< "$(xrandr -q | grep ' connected')"
}

get_monitors

if [[ ${#MONITORS[@]} > 1 ]]; then
    xrandr --output "${MONITORS[1]}" --left-of "${MONITORS[0]}" --preferred
    bspc monitor $(bspc query -M | awk NR==1) -d $WORKSPACES_LEFT
    bspc monitor $(bspc query -M | awk NR==2) -d $WORKSPACES_RIGHT
else
    xrandr --output "${MONITORS[0]}" --preferred
    bspc monitor -d $WORKSPACES_FOR_ONE
fi

