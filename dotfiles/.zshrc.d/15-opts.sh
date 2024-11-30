setopt autocd
setopt pushd_silent

export HISTSIZE=10000
export HISTFILE=${HOME}/.zsh_history
export SAVEHIST=$HISTSIZE
setopt appendhistory
setopt sharehistory
setopt histignorespace
