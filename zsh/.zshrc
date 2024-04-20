# theme
export STARSHIP_CONFIG=~/.config/starship.toml
eval "$(starship init zsh)"

# plugins
source ~/.config/zsh/plugin/run_all_plugin.sh

# aliases and shortcuts
source ~/.aliases
source ~/.shortcuts

# scripts
source ~/.scripts/zsh_script/search
source ~/.scripts/zsh_script/youtdl

# variables
source ~/.config/zsh/variables
