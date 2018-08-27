# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit
compinit

# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
