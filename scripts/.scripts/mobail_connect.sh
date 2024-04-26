#!/bin/bash

have_mobail="$(mtp-detect |grep -e "Found.* device")"
if [[ "$have_mobail" ]];then
    echo -e "\e[31m$have_mobail\e[0m"
    read -p "[c]onnect,[d]isconnect,[n]oting " can_connect
    case "$can_connect" in
        c)
            jmtpfs ~/mobail
            ;;
        d)
            # read -s -p "sudo password: " pass
            # echo  $pass |sudo -S umount -t tmpfs ~/mobail
            fusermount -u ~/mobail

            if [[ "$?" != "0" ]];then
                read -s -p "sudo password: " pass
                echo  "$pass" |sudo -S umount -t tmpfs ~/mobail
                if [[ "$?" == "0" ]];then
                    notify-send -t 3000 "umount" "mobail umounted"
                else
                    notify-send -t 3000 -u critical "umount" "can't umount mobail"
                fi
            else
                notify-send -t 3000 "umount" "mobail umounted"
            fi

            ;;
        *)
            exit 2
            ;;
    esac
else
    echo "can't find mobail !!"
    read -p "[d]isconnect,[n]oting " can_connect
    case "$can_connect" in
        d)
            # read -s -p "sudo password: " pass
            # echo  $pass |sudo -S umount -t tmpfs ~/mobail
            fusermount -u ~/mobail
            if [[ "$?" != "0" ]];then
                    notify-send -t 3000 "umount" "mobail umounted"
                else
                    notify-send -t 3000 -u critical "umount" "can't umount mobail"
                fi
            ;;
        *)
            exit 2
            ;;
    esac
    exit 3
fi
