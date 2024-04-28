# ~/.profile: executed by the command interpreter for login shells.
# This file is not read by bash(1), if ~/.bash_profile or ~/.bash_login
# exists.
# see /usr/share/doc/bash/examples/startup-files for examples.
# the files are located in the bash-doc package.

# if running bash
if [ -n "$BASH_VERSION" ]; then
	# include .bashrc if it exists
	if [ -f "$HOME/.bashrc" ]; then
		. "$HOME/.bashrc"
	fi
fi

add_path() {
	[[ -d $1 ]] && export PATH=$PATH:$1
}

# set PATH so it includes user's private bin if it exists
add_path "$HOME/bin"

# set PATH so it includes user's private bin if it exists
add_path "HOME/.local/bin"

export PATH="$HOME"/.local/bin:/usr/local/bin:/usr/bin:/bin:"$HOME"/.scripts:"$HOME"/.config/rofi/bin:/sbin:$PATH

# add perl in path
add_path "/usr/bin/vendor_perl/"

# Default programs:
export EDITOR="lvim"
export TERMINAL="alacritty"
export BROWSER="chromium"
export DEFALUT_VIDEO_BACKGROUND="$HOME/.config/default_video_background.mp4"

# increase speed of curser
xset r rate 200 40 &

add_path "$HOME/.local/go/bin"
add_path "$HOME/go"
add_path "$HOME/go/bin"
export GOPATH="$HOME"/go
export GOPACKAG="$HOME"/go/bin

# for npm
add_path "$HOME/.npm-global/bin"
# add yarn (node package manager in PATH)
add_path "$HOME/.yarn/bin"

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

if [[ $(which amixer) ]] && [[ -f "$HOME"/my_scripts/.scripts/mute_system.sh ]]; then
	# mute system when in start
	"$HOME"/my_scripts/.scripts/mute_system.sh &
fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"                   # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion" # This loads nvm bash_completion

# add fzf into PATH
[ -f "$HOME"/.fzf/bin/fzf ] && export PATH=$PATH:"$HOME"/.fzf/bin
