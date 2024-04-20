#!/usr/bin/env bash

# Exit on errors
set -e

# install needed package
sudo xbps-install \
	picom sxhkd tmux neovim sxiv \
	mpv ranger exa git zsh chromium \
	rofi yt-dlp xclip curl aria2

exit
# set zsh for default shell
chsh -s "$(which zsh)"

# install lvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo "All packages installed successfully!"
