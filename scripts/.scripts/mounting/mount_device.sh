#!/usr/bin/env bash

usbdrives="$(lsblk -rpo "name,type,size,mountpoint" | grep 'part\|rom' | awk '$4==""{printf "%s (%s)\n",$1,$3}')"
chosen="$(echo "$usbdrives" | dmenu -i -p "Mount which drive?")" || exit 1
chosen="$(echo "$chosen" | awk '{print $1}')"
udisksctl mount -b "$chosen" | tee /tmp/mount_usb.cash &&
	notify-send "💻 USB mounting" "$(cat /tmp/mount_usb.cash)" && exit 0 ||
	notify-send "💻 USB unmounting" "I can't unmount!" && sleep 2 && exit 1
