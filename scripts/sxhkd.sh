#!/bin/sh

killall -q sxhkd

while pgrep -u $UID -x sxhkd
