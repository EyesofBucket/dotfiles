export ZSH="$HOME/.oh-my-zsh"
export plugins=(git sudo dirhistory history jsontools kubectl helm)

source "$ZSH/oh-my-zsh.sh"

unsetopt autopushd

autoload -Uz compinit
compinit
