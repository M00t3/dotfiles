#!/bin/bash

IFS_defualt=$IFS
IFS=$'\n'

mkdir gifs
dir_destination=./gifs

counter=0
for i in `ls *mp4`;do
    # echo $i
    ffmpeg -i ${i} ${dir_destination}/${i%.*}.gif
    counter=$(($counter + 1))
done

notify-send "convert" "$counter videos was done"
FIS=$IFS_defualt
