ARG RUNTIME_BASE_REGISTRY=docker.io
ARG RUNTIME_BASE_IMAGE=library/ubuntu
ARG RUNTIME_BASE_TAG=latest
ARG BRANCH=main

FROM ${RUNTIME_BASE_REGISTRY}/${RUNTIME_BASE_IMAGE}:${RUNTIME_BASE_TAG} AS runtime
RUN apt update; apt upgrade -y; apt install -y git vim zsh curl wget iproute2 neofetch cowsay nmap iputils-ping dnsutils

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended;\
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-/root/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;\
    wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64" -O /usr/local/bin/oh-my-posh;\
    chmod +x /usr/local/bin/oh-my-posh;\
    curl -fLo /root/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim;\
    mkdir -p /root/.config/bvkt;\
    echo source /root/.zshrc >> /etc/zsh/zshrc

RUN wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/custom.sh" -O /root/.config/bvkt/custom.sh;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/zshrc" -O /root/.zshrc;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/alias.sh" -O /root/.config/bvkt/alias.sh;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/eyesofbucket.omp.json" -O /root/.eyesofbucket.omp.json;\
    wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/vimrc" -O /root/.vimrc;\
    vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null;\
    cat /tmp/vim.log

ENTRYPOINT zsh
