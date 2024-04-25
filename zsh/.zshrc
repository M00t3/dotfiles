# theme
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

check_then_run() {
	[[ -f $1 ]] && source $1
}


# plugins
source ~/.config/zsh/plugin/run_all_plugin.sh

# aliases and shortcuts
source ~/.aliases
check_then_run ~/.shortcuts

# scripts
check_then_run ~/.scripts/zsh_script/search
check_then_run ~/.scripts/zsh_script/youtdl

# variables
source ~/.config/zsh/variables
