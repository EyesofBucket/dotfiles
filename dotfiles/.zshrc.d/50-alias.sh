bindkey -s ^f "tmux-sessionizer\n"
bindkey -s ^g "tmux-session-fzf\n"
bindkey -s ^s "tmux-sshionizer\n"

alias md='mkdir -p'
alias rd='rmdir'
alias ~='cd'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'
alias /='cd /'
alias 1='cd -1'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias ez='exec zsh'

alias help='run-help'

alias watch='watch -c '
alias sudo='sudo '
alias please='sudo '
alias svim='sudoedit'

alias hist='history | grep'
alias al='alias | grep'

alias colormap='for i in {0..255}; do print -Pn "%K{$i}  %k%F{$i}${(l:3::0:)i}%f " ${${(M)$((i%6)):#3}:+"\n"}; done'

alias pubip='curl ifconfig.io'

function spwn() { "$@" & disown; }

# Debian
if which apt >/dev/null 2>&1
then
    alias update='sudo apt update && sudo apt upgrade -y'

# Fedora
elif which yum >/dev/null 2>&1
then
    alias update='sudo yum update -y'

# Arch
elif which pacman >/dev/null 2>&1
then
    alias update='sudo pacman -Syu'
fi

# podman
if which podman >/dev/null 2>&1
then
    alias pm='podman'
    alias pml='podman logs'
    alias pmp='podman pod'
    
    alias pmi='podman image'
    alias pmip='podman image prune'

    alias pps='podman ps --size --format '\''table {{.Names}}\t{{.Status}}\t{{.Ports}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'
    alias ppq='podman ps --size --format '\''table {{.Names}}\t{{.Status}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'
    alias ppa='podman ps --size --format '\''table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'

    alias pin='podman inspect'
    alias pmstart='podman start'
    alias pmstop='podman stop'
    alias pmr='podman restart'

    alias pn='podman network'
    alias pni='podman network inspect'
    alias pnl='podman network ls'
    alias pnc='podman network connect'
    alias pnd='podman network disconnect'

    # sudo podman
    alias spm='sudo podman'
    alias spml='sudo podman logs'
    alias spmp='sudo podman pod'

    alias spmi='sudo podman image'
    alias spmip='sudo podman image prune'

    alias spps='sudo podman ps --size --format '\''table {{.Names}}\t{{.Status}}\t{{.Ports}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'
    alias sppq='sudo podman ps --size --format '\''table {{.Names}}\t{{.Status}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'
    alias sppa='sudo podman ps --size --format '\''table {{.Names}}\t{{.Status}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'

    alias spin='sudo podman inspect'
    alias spmstart='sudo podman start'
    alias spmstop='sudo podman stop'
    alias spmr='sudo podman restart'

    alias spn='sudo podman network'
    alias spni='sudo podman network inspect'
    alias spnl='sudo podman network ls'
    alias spnc='sudo podman network connect'
    alias spnd='sudo podman network disconnect'
fi

# podman-compose
if which podman-compose >/dev/null 2>&1
then
    alias pc='podman-compose'
    alias pcu='podman-compose up -d'
    alias pcp='podman-compose pull && podman-compose up -d'
    alias pcr='podman-compose down && podman-compose up -d'
    alias pcd='podman-compose down'

    # sudo podman-compose
    alias spc='sudo /usr/local/bin/podman-compose'
    alias spcu='sudo /usr/local/bin/podman-compose up -d'
    alias spcp='sudo /usr/local/bin/podman-compose pull && sudo /usr/local/bin/podman-compose up -d'
    alias spcr='sudo /usr/local/bin/podman-compose down && sudo /usr/local/bin/podman-compose up -d'
    alias spcd='sudo /usr/local/bin/podman-compose down'
fi

# docker
if which docker >/dev/null 2>&1
then
    alias dk='docker'
    alias dl='docker logs'

    alias di='docker image'
    alias dip='docker image prune'

    alias dps='docker ps --format '\''table {{.Names}}\t{{.Status}}\t{{.Size}}\t{{.Ports}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'
    alias dpq='docker ps --format '\''table {{.Names}}\t{{.Status}}\t{{.Size}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'
    alias dpa='docker ps --format '\''table {{.Names}}\t{{.Status}}\t{{.Size}}\t{{.Networks}}\t{{.Ports}}\t{{.Image}}'\'' -a | (read -r; printf "%s\n" "$REPLY"; sort)'

    alias drm='docker rm'
    # Removes all stopped containers
    alias drma='echo -n "Deleting all stopped containers. Are you sure? [y/N]: ";read -k 1 -r x;echo;if [[ $x =~ ^[Yy]$ ]];then;docker ps -a --format "{{.ID}}" | while read l;do;docker rm $l;done;fi'
    # Removes ALL containers
    alias drmA='echo -n "Deleting ALL containers. Are you sure? [y/N]: ";read -k 1 -r x;echo;if [[ $x =~ ^[Yy]$ ]];then;docker ps -a --format "{{.ID}}" | while read l;do;docker rm -f $l;done;fi'

    alias din='docker inspect'
    alias dstart='docker start'
    alias dstop='docker stop'
    alias dr='docker restart'

    alias dn='docker network'
    alias dni='docker network inspect'
    alias dnl='docker network ls'
    alias dnc='docker network connect'
    alias dnd='docker network disconnect'

    # For the compose plugin.  Gets overwritten if docker-compose still exists
    alias dc='docker compose'
    alias dcu='docker compose up -d'
    alias dcp='docker compose pull && docker compose up -d'
    alias dcr='docker compose down && docker compose up -d'
    alias dcd='docker compose down'
fi

# docker-compose
if which docker-compose >/dev/null 2>&1
then
    alias dc='docker-compose'
    alias dcu='docker-compose up -d'
    alias dcp='docker-compose pull && docker-compose up -d'
    alias dcr='docker-compose down && docker-compose up -d'
    alias dcd='docker-compose down'
fi

# firewall-cmd
if which firewall-cmd >/dev/null 2>&1
then
    alias fw='sudo firewall-cmd'
    alias fws='sudo firewall-cmd --state'
    alias fwl='sudo firewall-cmd --list-all'

    alias fwr='sudo firewall-cmd --reload'
    alias fwcr='sudo firewall-cmd --complete-reload'

    alias fwap='sudo firewall-cmd --add-port'
    alias fwapp='sudo firewall-cmd --permanent --add-port'
    alias fwrp='sudo firewall-cmd --remove-port'
    alias fwrpp='sudo firewall-cmd --permanent --remove-port'

    alias fwas='sudo firewall-cmd --add-service'
    alias fwasp='sudo firewall-cmd --permanent --add-service'
    alias fwrs='sudo firewall-cmd --remove-service'
    alias fwrsp='sudo firewall-cmd --permanent --remove-service'
fi

# iwctl
if which iwctl >/dev/null 2>&1
then
    alias iwc='iwctl station wlan0 connect'
    alias iwch='iwctl station wlan0 connect-hidden'
    alias iwd='iwctl station wlan0 disconnect'
    alias iws='iwctl station wlan0 scan && iwctl station wlan0 get-networks'
fi

if which eza >/dev/null 2>&1
then
    alias ls='eza --icons --git'
    alias ll='eza --icons --git --git-repos -lg'
    alias la='eza --icons --git --git-repos -laag'
    alias lt='eza --icons --git --git-repos -gT'
fi

if which epy >/dev/null 2>&1
then
    alias epy='pushd $HOME/Books; epy "$(fzf)"; popd'
fi

if which kubectl >/dev/null 2>&1
then
    alias k='kubectl'
    alias kl='k logs'
    alias kx='k exec'
    alias kxi='k exec -it'
    alias ka='k apply -f'

    alias kg='k get'
    alias kgn='kg nodes'
    alias kgp='kg pods'
    alias kgd='kg deployments'
    alias kgc='kg configmaps'
    alias kgsv='kg services'
    alias kgsc='kg secrets'
    alias kgi='kg ingresses'
    alias kgpv='kg pv'
    alias kgpvc='kg pvc'

    alias ke='k edit'
    alias ken='ke nodes'
    alias kep='ke pods'
    alias ked='ke deployments'
    alias kec='ke configmaps'
    alias kesv='ke services'
    alias kesc='ke secrets'
    alias kei='ke ingresses'
    alias kepv='ke pv'
    alias kepvc='ke pvc'

    alias kd='k describe'
    alias kdn='kd nodes'
    alias kdp='kd pods'
    alias kdd='kd deployments'
    alias kdc='kd configmaps'
    alias kdv='kd services'
    alias kds='kd secrets'
    alias kdi='kd ingresses'
    alias kdpv='kd pv'
    alias kdpvc='kd pvc'

    alias krm='k delete'
    alias krmn='krm nodes'
    alias krmp='krm pods'
    alias krmpf='krm pods --force'
    alias krmd='krm deployments'
    alias krmc='krm configmaps'
    alias krmv='krm services'
    alias krms='krm secrets'
    alias krmi='krm ingresses'
    alias krmpv='krm pv'
    alias krmpvc='krm pvc'

    alias kc='k config'
    alias kcc='kc use-context $(kc get-contexts -o name | fzf)'
    alias kcn='kc set-context --current --namespace=$(kg namespaces -o json | jq ".items[].metadata.name" -r | fzf)'
fi

if which helm >/dev/null 2>&1
then
    alias hi='helm upgrade --install'
    alias hid='helm upgrade --install --dry-run'
    alias hu='helm uninstall'
    alias hpk='helm package'
    alias hpu='helm push'
    alias hdu='helm dependency update'
    alias hga='helm get all'
fi

if which kubecolor >/dev/null 2>&1
then
    alias kubectl='kubecolor'
    compdef kubecolor=kubectl
fi
