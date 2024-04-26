#!/usr/bin/env bash

usbdrives="$(lsblk -rpo "name,type,size,mountpoint" |grep 'part\|rom' \
    |awk '$4 ~ "/media.*" {print $1,$4 }')"

chosen="$(echo "$usbdrives"|awk '{print $2 }' \
    | dmenu -i -p "Mount which drive?")" || exit 1

chosen="$(mount |grep "$chosen" |awk '{print $1}')"
# echo $chosen
udisksctl unmount -b $chosen \
    && notify-send "💻 USB unmounting" "${chosen} was unmounted" && exit 0 \
    || notify-send -u critical "💻 USB unmounting" "<span font='15px'><b>I can't unmount device</b></span>" && sleep 2 && exit 1
