#!/usr/bin/env bash

# Exit on errors
set -e

read -r -p "write base of your distro for select package manager: [a]rch, [d]ebian, [v]oid, [r]ed hat: " response

case $response in
a)
	package_manager() {
		sudo pacman -Sy $@
	}
	;;
d)
	package_manager() {
		sudo apt update && sudo apt install -y $@
	}
	;;
v)
	package_manager() {
		sudo xbps-install -Suy && sudo xbps-install -y $@
	}
	;;
r)
	package_manager() {
		sudo dnf check-update && sudo dnf install -y $@
	}
	;;
*)
	echo "Invalid option!"
	exit 1
	;;
esac

# install needed package
package_manager \
	picom sxhkd tmux neovim sxiv \
	mpv ranger lsd git zsh chromium \
	rofi yt-dlp xclip curl aria2 fzf qrencode \
	ripgrep fd bat exa zathura zathura-pdf-mupdf \
	htop btop alacritty ffmpeg qutebrowser ranger \
	imagemagick libnotify dunst pulseaudio \
	xorg-xbacklight xorg-xrandr feh jq xdotool
exit

if [[ $! -ne 0 ]]; then
	echo "Failed to install package!"
	exit 1
fi

# install starship theme for zsh
curl -sS https://starship.rs/install.sh | sh

# set zsh for default shell
chsh -s "$(which zsh)"

# clone zsh plugins
clone_zsh_plugins() {
	directory="$HOME/.config/zsh-plugins"
	mkdir -p "$directory"
	cd "$directory" || exit

	xargs -n1 git clone <<end
https://github.com/unixorn/fzf-zsh-plugin.git
https://github.com/zsh-users/zsh-autosuggestions
https://github.com/MichaelAquilina/zsh-you-should-use.git
https://github.com/agkozak/zsh-z.git
https://github.com/zsh-users/zsh-history-substring-search.git
https://github.com/zsh-users/zsh-syntax-highlighting.git
end

	curl -L -o vim-mode https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/plugins/vi-mode/vi-mode.plugin.zsh
	if [[ -f vim-mode ]]; then
		chmod +x vim-mode
	else
		echo "Failed to download vim-mode"
	fi

}

clone_zsh_plugins

# NOTE:
# it have too much dependencies so I will install it manually for now
# install nodejs, npm, golang, rust, cargo for lvim
# python3 python3-pip nodejs npm golang rustc cargo
# install lvim
# LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo "All packages installed successfully!"
