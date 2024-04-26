#!/bin/bash

# it doesn't work !!
tmux list-sessions |awk -F":" '{print $1}' |fzf-tmux |xargs -r tmux attach -t
