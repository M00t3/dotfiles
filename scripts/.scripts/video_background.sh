#!/bin/bash

notify-send 'run set background'
pgrep xwinwrap && pkill xwinwrap
function run_video_in_backgrand() {
	video=$@
	nice -n 10 xwinwrap -b -s -fs -st -sp -nf -ov -fdt -- \
		nice -n 10 mpv --input-ipc-server=/dev/null -wid WID "$video" \
		--no-osc --no-osd-bar --loop-file --player-operation-mode=cplayer --no-audio --panscan=1.0 --no-input-default-bindings &
	# xwinwrap -b -s -fs -st -sp -nf -ov -fdt -- \
	# 	mpv -wid WID ~/.config/default_video_background.mp4 \
	# 	--loop-file --panscan=1.0
}

select_videos=$@

# if you don't pass any arg to script
# set background with rofi
if [ ! "$1" ]; then
	cd ~/Pictures/video_background
	videos="$(find -maxdepth 1 -type f -regex ".*.mp4")"
	videos+="\nDefault"
	select_videos=$(echo -e "$videos" | rofi -dmenu -i -matching fuzzy -lines 10 -width 30 -mesg "enter your world")
fi

if [ "${select_videos}" == "Default" ] || [ "${select_videos}" == "-d" ]; then
	select_videos=${DEFALUT_VIDEO_BACKGROUND}
fi

if [ ! "${select_videos}" ]; then
	notify-send "video background" "you most select one video"
	exit 1
else
	run_video_in_backgrand "$select_videos" &&
		notify-send "video background was set"
fi

unset run_video_in_backgrand
