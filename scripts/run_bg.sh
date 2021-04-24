#!/bin/sh

program=$1
program_path=$(which "$program")

if [[ ! -f "$program_path" ]]; then
  exit -1
fi

killall -q $program

while pgrep -u $UID -x $program >/dev/null; do sleep 1; done

$program &

