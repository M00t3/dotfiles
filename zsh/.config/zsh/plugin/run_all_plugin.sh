#!/usr/bin/env bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

# load all plugins
source "${SCRIPT_DIR}"/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "${SCRIPT_DIR}"/zsh-history-substring-search/zsh-history-substring-search.zsh
source "${SCRIPT_DIR}"/zsh-autosuggestions/zsh-autosuggestions.zsh
source "${SCRIPT_DIR}"/zsh-you-should-use/zsh-you-should-use.plugin.zsh
source "${SCRIPT_DIR}"/zsh-z/zsh-z.plugin.zsh
source "${SCRIPT_DIR}"/vi-mode/vi-mode.plugin.zsh

# plugin configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
