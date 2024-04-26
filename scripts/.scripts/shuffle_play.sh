#!/usr/bin/env bash
if [[ $(playerctl shuffle) == "On" ]]; then
	playerctl shuffle off && notify-send "shuffle was off"
else
	playerctl shuffle on && notify-send "shuffle was on"
fi
