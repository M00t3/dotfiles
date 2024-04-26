#!/usr/bin/env bash

check_mute() {
	if [[ $(which pamixer) ]]; then
		isMute=$(pamixer --get-mute)
		if [[ $isMute == "false" ]]; then
			return 2
		else
			return 1
		fi
	else
		isMute=$(amixer get Master | grep -i "front left" | sed 1d | grep off)
		if [[ $isMute ]]; then
			return 1
		else
			return 2
		fi
	fi
}
check_mute

if [[ $? -eq 2 ]]; then
	if [[ $(which pamixer) ]]; then
		pamixer -t
	elif [[ $(which amixer) ]]; then
		amixer -q -D pulse sset Master toggle
	else
		echo error
	fi
fi
