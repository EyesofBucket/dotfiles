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
plugins=(git sudo dirhistory history zsh-autosuggestions jsontools)

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

export EDITOR="/usr/bin/vim"

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
alias svim='sudoedit'

alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'

alias update="sudo apt update && sudo apt upgrade -y"

alias pubip='curl ifconfig.io'

# podman
if which podman; then
    alias pm='podman'
    alias pmi='podman image'
    alias pml='podman logs'
    alias pmp='podman pod'

    alias pps="podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' -a | (read -r; printf "%s" "$REPLY"; sort)"
    alias ppq="podman ps --format 'table {{.Names}}\t{{.Status}}' -a | (read -r; printf "%s" "$REPLY"; sort)"
    alias ppa="podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}' -a | (read -r; printf "%s" "$REPLY"; sort)"

    alias pin="podman inspect"
    alias pms="podman start"
    alias pmx="podman stop"
    alias pmr="podman restart"

    alias pmn="podman network"
    alias pni="podman network inspect"
    alias pnl="podman network ls"
    alias pnc="podman network connect"
    alias pnd="podman network disconnect"

    # sudo podman
    alias spm='sudo podman'
    alias spmi='sudo podman image'
    alias spml='sudo podman logs'
    alias spmp='sudo podman pod'

    alias spps="sudo podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' -a | (read -r; printf "%s" "$REPLY"; sort)"
    alias sppq="sudo podman ps --format 'table {{.Names}}\t{{.Status}}' -a | (read -r; printf "%s" "$REPLY"; sort)"
    alias sppa="sudo podman ps --format 'table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}' -a | (read -r; printf "%s" "$REPLY"; sort)"

    alias spin="sudo podman inspect"
    alias spms="sudo podman start"
    alias spmx="sudo podman stop"
    alias spmr="sudo podman restart"

    alias spmn="sudo podman network"
    alias spni="sudo podman network inspect"
    alias spnl="sudo podman network ls"
    alias spnc="sudo podman network connect"
    alias spnd="sudo podman network disconnect"
fi

# docker-compose
if which docker-compose; then
    alias dc='docker-compose'
    alias dcu="docker-compose pull && docker-compose up -d"
    alias dcr="docker-compose down && docker-compose up -d"
fi
# podman-compose
if which podman-compose; then
    alias pc='podman-compose'
    alias pcu="podman-compose pull && docker-compose up -d"
    alias pcr="podman-compose down && docker-compose up -d"

    # sudo podman-compose
    alias spc='sudo podman-compose'
    alias spcu="sudo podman-compose pull && docker-compose up -d"
    alias spcr="sudo podman-compose down && docker-compose up -d"
fi

# docker
if which docker; then
    alias dk='docker'
    alias din="docker inspect"
    alias dstart="docker start"
    alias dstop="docker stop"
    alias dr="docker restart"

    alias di='docker image'
    alias dip='docker image prune'

    alias dl='docker logs'

    alias dps="docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Ports}}' -a | (read -r; printf "%s" "$REPLY"; sort)"
    alias dpq="docker ps --format 'table {{.Names}}\t{{.Status}}' -a | (read -r; printf "%s" "$REPLY"; sort)"
    alias dpa=" docker ps --format 'table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}' -a | (read -r; printf "%s" "$REPLY"; sort)"

    alias dn="docker network"
    alias dni="docker network inspect"
    alias dnl="docker network ls"
    alias dnc="docker network connect"
    alias dnd="docker network disconnect"
fi
