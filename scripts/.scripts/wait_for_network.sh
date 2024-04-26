#!/usr/bin/env bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
cd "$SCRIPT_DIR" || exit 2

if which banner &>/dev/null; then
	banner_flag=1
else
	banner_flag=0
fi

while true; do
	if [[ $(curl --connect-timeout 2 -sIL google.com) ]]; then
		if [[ $banner_flag == 1 ]]; then
			banner "you are connected"
		else
			echo "you are connected"
		fi
		notify-send -t 3000 -u low "Net" "<span font='28px'><b>Net is up 󰖩</b></span>"
		break
	fi
	sleep 1
done
