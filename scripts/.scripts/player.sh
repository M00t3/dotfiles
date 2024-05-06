#!/usr/bin/env bash

# control palyer with playerctl or mpvctl
config_file=~/.config/def_music_player.txt

# save player name in config file
if [[ $1 == "--select-player" ]]; then
	player_list="$(playerctl --list-all)"
	player_list="${player_list}\ndefault"
	if pgrep mpv; then
		player_list="${player_list}\nmpv"
	fi
	sel_player=$(echo -e "$player_list" | rofi-f)
	if [[ "$sel_player" ]]; then
		echo "$sel_player" >$config_file
		exit 8
	fi
fi

# exit if config file not exist
if [[ ! -f $config_file ]] || [[ ! $(cat $config_file) ]]; then
	echo "def_music_player error"
	exit 3
fi

player=$(cat $config_file)

# select palyer program
case "$player" in
"mpv")
	player_name=mpvctl
	;;
"default")
	if pgrep mpv; then
		player_name=mpvctl
	else
		player_name=playerctl
	fi
	player=""
	;;
*)
	player_name=playerctl
	;;
esac
echo "player_name is $player_name"

# run command with player program
case "$1" in
"--seek-f-5")
	if [[ $player_name == "mpvctl" ]]; then
		mpvctl --seek-f-5
	else

		if [[ "$player" ]]; then
			playerctl --player="$player" position 5+
		else
			playerctl position 5+
		fi
	fi
	;;
"--seek-d-5")
	if [[ $player_name == "mpvctl" ]]; then
		mpvctl --seek-d-5
	else
		if [[ "$player" ]]; then
			playerctl --player="$player" position 5-
		else
			playerctl position 5-
		fi
	fi
	;;

"--pause-play")
	if [[ $player_name == "mpvctl" ]]; then
		$player_name --pause-play
	else
		echo "run $player_name --player=$player pause-play "
		if [[ "$player" ]]; then
			$player_name --player="$player" play-pause
		else
			$player_name play-pause
		fi
	fi
	;;

"playlist-next")
	if [[ $player_name == "mpvctl" ]]; then
		$player_name playlist-next
	else
		if [[ "$player" ]]; then
			$player_name --player="$player" next
		else
			$player_name next
		fi
	fi
	;;

"playlist-prev")
	if [[ $player_name == "mpvctl" ]]; then
		$player_name playlist-prev
	else
		if [[ "$player" ]]; then
			$player_name --player="$player" previous
		else
			$player_name previous
		fi
	fi
	;;

*)
	echo error
	exit 4
	;;
esac
