#!/bin/bash

cd "~/Pictures/pic_to_text"
flameshot gui -p ~/Pictures/pic_to_text
pics="`find ~/Pictures/pic_to_text -regex '.*.png' `"

# whait for take screenshot
while [ ! "$pics" ]
do
    echo go to while 1
    sleep 1
    pics="`find ~/Pictures/pic_to_text -regex '.*.png' `"
done

echo "file $pics"
gocr "$pics" > ~/Pictures/pic_to_text/text.txt
while [ ! -f "~/Pictures/pic_to_text/text.txt" ]
do
    echo go to while 2
    sleep 1
done
alacritty  -e  $EDITOR ~/Pictures/pic_to_text/text.txt
find ~/Pictures/pic_to_text -regex '.*.png'|xargs -r rm
rm ~/Pictures/pic_to_text/text.txt
cd -
