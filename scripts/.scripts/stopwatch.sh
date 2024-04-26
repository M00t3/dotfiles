#!/bin/bash

# Define start time
start=$(date +%s)

# Banner function to display time
function show_time() {
	local elapsed=$1
	banner "$(printf "%02d:%02d:%02d" $((elapsed / 3600)) $(((elapsed / 60) % 60)) $((elapsed % 60)))"
}


# Keep updating the elapsed time until stopped
while true; do
  clear
	current=$(date +%s)
	elapsed=$((current - start))
	show_time $elapsed
	sleep 1

done
