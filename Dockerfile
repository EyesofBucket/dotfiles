ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=library/alpine
ARG BASE_TAG=3.22.2

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} AS build

RUN apk add \
    build-base \
    cmake \
    coreutils \
    curl \
    unzip \
    gettext-tiny-dev \
    git \
    && \
    mkdir /build && \
    git clone https://github.com/neovim/neovim && \
    cd neovim && \
    git checkout stable && \
    make CMAKE_BUILD_TYPE=RelWithDebInfo && \
    make CMAKE_INSTALL_PREFIX=/build/nvim install

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} AS env

RUN apk add \
    stow \
    tmux \
    zsh \
    git \
    ripgrep \
    btop \
    unzip \
    cmake \
    gcc \
    musl-dev \
    wget \
    bat \
    eza \
    fzf \
    starship \
    shadow \
    bash \
    jq \
    && \
    mkdir -p "/root/.tmux/plugins/tpm" && \
    git clone https://github.com/tmux-plugins/tpm /root/.tmux/plugins/tpm

COPY dotfiles /dotfiles
COPY --from=build /build/nvim/ /usr/local/

RUN mkdir -p "$(bat --config-dir)/themes" && \
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme && \
    bat cache --build && \
    stow dotfiles -t /root && \
    /root/.tmux/plugins/tpm/bin/install_plugins && \
    nvim --headless "+Lazy! sync" +qa && \
    chsh -s /bin/zsh root

RUN zsh -c 'source /root/.zshrc && zinit light zdharma-continuum/fast-syntax-highlighting && zinit light zsh-users/zsh-completions && zinit light Aloxaf/fzf-tab'; exit 0

WORKDIR /root
ENTRYPOINT [ "zsh" ]
