ARG RUNTIME_BASE_REGISTRY=docker.io
ARG RUNTIME_BASE_IMAGE=_/ubuntu
ARG RUNTIME_BASE_TAG=latest
ARG BRANCH=main

FROM ${RUNTIME_BASE_REGISTRY}/${RUNTIME_BASE_IMAGE}:${RUNTIME_BASE_TAG} AS runtime
RUN apt update; apt upgrade -y; apt install -y git vim zsh curl wget iproute2 neofetch cowsay nmap iputils-ping dnsutils

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;\
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;\
    sudo wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64" -O /usr/local/bin/oh-my-posh;\
    sudo chmod +x /usr/local/bin/oh-my-posh;\
    curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;\
    mkdir -p ~/.config/bvkt;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/custom.sh" -O ~/.config/bvkt/custom.sh;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/zshrc" -O ~/.zshrc;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/alias.sh" -O ~/.config/bvkt/alias.sh;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/eyesofbucket.omp.json" -O ~/.eyesofbucket.omp.json;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/vimrc" -O ~/.vimrc;\
    vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null;\
    cat /tmp/vim.log

ENTRYPOINT zsh
