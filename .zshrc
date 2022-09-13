# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes

eval "$(oh-my-posh init zsh --config ~/.poshthemes/montys.omp.json)"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS=true

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git sudo dirhistory history)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

alias watch='watch '
alias sudo='sudo '
alias please='sudo '

alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'

alias update="sudo apt update && sudo apt upgrade"

alias pubip='curl ifconfig.io'

# podman
alias pm='podman'
alias pmi='podman image'
alias pml='podman logs'

alias pmps="podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"
alias pmpq="podman ps --format 'table {{.Names}}\t{{.Status}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"
alias pmpa="podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"

alias pmin="podman inspect"
alias pms="podman start"
alias pmx="podman stop"
alias pmr="podman restart"

alias pmn="podman network"
alias pmni="podman network inspect"
alias pmnl="podman network ls"
alias pmnc="podman network connect"
alias pmnd="podman network disconnect"

# sudo podman
alias pm='sudo podman'
alias pmi='sudo podman image'
alias pml='sudo podman logs'

alias pmps="sudo podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"
alias pmpq="sudo podman ps --format 'table {{.Names}}\t{{.Status}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"
alias pmpa="sudo podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"

alias pmin="sudo podman inspect"
alias pms="sudo podman start"
alias pmx="sudo podman stop"
alias pmr="sudo podman restart"

alias pmn="sudo podman network"
alias pmni="sudo podman network inspect"
alias pmnl="sudo podman network ls"
alias pmnc="sudo podman network connect"
alias pmnd="sudo podman network disconnect"

# docker
alias dc='docker-compose'
alias dcu="docker-compose pull && docker-compose up -d"
alias dcr="docker-compose down && docker-compose up -d"

alias dk='docker'
alias di='docker image'
alias dl='docker logs'

alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"
alias dpq="docker ps --format 'table {{.Names}}\t{{.Status}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"
alias dpa=" docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}' -a | (read -r; printf "%s\n" "$REPLY"; sort)"

alias din="docker inspect"
alias dstart="docker start"
alias dstop="docker stop"
alias dr="docker restart"

alias dn="docker network"
alias dni="docker network inspect"
alias dnl="docker network ls"
alias dnc="docker network connect"
alias dnd="docker network disconnect"
