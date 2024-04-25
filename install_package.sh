#!/usr/bin/env bash

# Exit on errors
set -e

# install needed package
sudo xbps-install \
	picom sxhkd tmux neovim sxiv \
	mpv ranger exa git zsh chromium \
	rofi yt-dlp xclip curl aria2

# set zsh for default shell
chsh -s "$(which zsh)"

# clone zsh plugins
clone_zsh_plugins() {
	directory="~/.config/zsh-plugins"
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

# install lvim
LV_BRANCH='release-1.3/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.3/neovim-0.9/utils/installer/install.sh)

echo "All packages installed successfully!"
