#!/usr/bin/env bash

SCRIPT_PATH=$(readlink -f "$0")
SCRIPT_DIR=$(dirname "$SCRIPT_PATH")

check_then_run() {
	[[ -f $1 ]] && source $1
}

# load all plugins
check_then_run "${SCRIPT_DIR}/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
check_then_run "${SCRIPT_DIR}/zsh-history-substring-search/zsh-history-substring-search.zsh"
check_then_run "${SCRIPT_DIR}/zsh-autosuggestions/zsh-autosuggestions.zsh"
check_then_run "${SCRIPT_DIR}/zsh-you-should-use/zsh-you-should-use.plugin.zsh"
check_then_run "${SCRIPT_DIR}/zsh-z/zsh-z.plugin.zsh"
check_then_run "${SCRIPT_DIR}/vi-mode/vi-mode.plugin.zsh"
check_then_run "${SCRIPT_DIR}/zsh-system-clipboard/zsh-system-clipboard.zsh"

# plugin configuration
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# bindkey -M vicmd 'k' history-substring-search-up
# bindkey -M vicmd 'j' history-substring-search-down
