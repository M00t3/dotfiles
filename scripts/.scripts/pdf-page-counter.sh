#!/usr/bin/env bash

count_pages() {

	# Initialize the page count
	count=0

	# Loop through all the PDF files in the directory and add up their page counts
	for file in "$dir"/*.pdf; do
		# Get the page count of the current PDF file using the 'pdfinfo' command
		# pages=$(pdfinfo "$file" 2>/dev/null | awk '/Pages/ {print $2}')
		pages=$(strings <"$file"  | sed -n 's|.*/Count -\{0,1\}\([0-9]\{1,\}\).*|\1|p' |
			sort -rn | head -n 1)

		# Add the page count to the total count
		count=$((count + pages))
	done
}

verbose=0
dir="."

while getopts "vd:" opt; do
	case $opt in
	v)
		verbose=1
		;;
	d)
		dir=$OPTARG
		;;
	\?)
		echo "Invalid option: -$OPTARG" >&2
		exit 1
		;;
	esac
done

count_pages

# Print the total page count
if [[ $verbose -eq 1 ]]; then
	echo "Total page count of directory \"$dir\": $count"
else
	echo "Total page count: $count"
fi
