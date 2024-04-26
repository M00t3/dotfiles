#!/usr/bin/env bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")
cd "$SCRIPT_DIR" || exit 2

# dont ask for disconnet from wifi
dont_ask=1

function connect_to_wifi() {

	wifi_name=$(nmcli -f SSID device wifi list | sed 1d | sort | uniq | rofi -dmenu -i -matching fuzzy -lines 10 -width 30 -mesg "choose wifi:" 2>/dev/null)
	if [ ! "$wifi_name" ]; then
		notify-send -t 3000 -u critical "Wifi" "you most enter wifi name"
		exit 2
	else
		bssid=$(nmcli -f BSSID,SSID dev wifi list | grep -i "$wifi_name" | head -n1 | cut -d' ' -f 1)
		nmcli dev wifi co "$bssid" ||
			notify-send -t 3000 -u critical "Wifi" "can not connect to wifi"
	fi
}

disconnet_from_wifi() {

	if [[ $dont_ask -eq 1 ]]; then
		nmcli connection down "$wifi_up" && notify-send -u low "disconnect wifi"
		connect_to_wifi
		return
	fi

	wifi_connection=$(rofi -dmenu -lines 10 -width 30 -p "do you want disconnet wifi? [y|n]")
	case "$wifi_connection" in
	y | yes)
		nmcli connection down "$wifi_up" && notify-send -u low "disconnect wifi"
		connect_to_wifi
		;;
	n | no)
		exit 3
		;;
	*)
		exit 3
		;;
	esac

}

wifi_up="$(nmcli connection show | grep "\swifi\s*wlp2s0" | awk '{print $1}')"
if [[ "$wifi_up" ]]; then
	disconnet_from_wifi
else
	connect_to_wifi
fi
