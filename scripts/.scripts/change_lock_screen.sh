#!/usr/bin/env bash

# for space
name=$@
pic=$(readlink -f "$name")
convert "$pic" ~/.config/lock_screen.png

if [[ "${?}" -ne 0 ]]; then
	echo "error in convert picture" >&2
	notify-send "change lock screen" "error in convert picture"
	exit 1
fi
