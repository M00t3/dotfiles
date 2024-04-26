#!/usr/bin/env bash

dirs="$HOME/notes/
$HOME/programing/notes/
$HOME/.dotfile/ToDo.md"

file=$(find ${dirs} -regex ".*.md\|.*.txt" 2>/dev/null | fzf -m)
[ ! "$file" ] && exit 1

if [[ "$(basename "${file}")" =~ ^fa_* ]]; then
	kate "${file}"
else
	$EDITOR "${file}"
fi

# dirs="$HOME/notes/
# $HOME/programing/notes/"

# files=$(find ${dirs}  -regex ".*.md" 2>/dev/null )
# files="$files
# $HOME/notes/new_file
# $HOME/programing/notes/new_file"

# file=$(echo -e $files |fzf)
# [ ! "$file" ] && exit 1

# if [[ $file == "~/programing/notes/new_file" || $file == "~/notes/new_file" ]];then
#   dir_path=$(dirname $file)
#   read -p "enter" file_name
#   lvim ${dir_path}/${file_name}
# else
#   lvim ${file}
# fi
