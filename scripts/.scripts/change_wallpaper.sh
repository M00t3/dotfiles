#!/bin/bash

# for handel which name have space
name=$@
pic="$(readlink -f "$name")"
cp "$pic" ~/.config/wallpaper.jpg
feh --bg-scale ~/.config/wallpaper.jpg
