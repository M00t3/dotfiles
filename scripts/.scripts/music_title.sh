#!/bin/bash

if playerctl metadata title &>/dev/null ;then
    name="$(playerctl metadata title)"
    if [ `playerctl --list-all |head -n1 |grep -i "vlc"` ];then
        echo ""
    elif [ ${#name} -gt 13 ] ;then
        echo "${name::13} ..."
    else
        echo $name
    fi
else
    echo ""
fi
