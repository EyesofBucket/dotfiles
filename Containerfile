ARG BASE_REGISTRY=docker.io
ARG BASE_IMAGE=library/rockylinux
ARG BASE_TAG=9.3

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} AS build

RUN dnf -y install epel-release; \
    dnf -y install 'dnf-command(config-manager)'; \
    dnf -y config-manager --set-enabled crb; \
    dnf -y --allowerasing install \
    ninja-build \
    cmake \
    gcc \
    make \
    unzip \
    gettext \
    curl \
    glibc-gconv-extra \
    git \
    which \
    golang \
    ; \
    mkdir /build; \
    git clone https://github.com/neovim/neovim; \
    cd neovim; \
    git checkout stable; \
    make CMAKE_BUILD_TYPE=RelWithDebInfo; \
    make CMAKE_INSTALL_PREFIX=/build/nvim install; \
    cd ..; \
    git clone https://github.com/junegunn/fzf; \
    cd fzf; \
    make; \
    make install; \
    mkdir /build/fzf; \
    cp -R ./bin /build/fzf/; \
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y; \
    mkdir /build/eza; \
    /root/.cargo/bin/cargo install eza --root /build/eza; \
    mkdir /build/bat; \
    /root/.cargo/bin/cargo install bat --root /build/bat

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} AS env

COPY dotfiles /dotfiles
COPY --from=build /build /build

RUN dnf -y install epel-release; \
    dnf -y install 'dnf-command(config-manager)'; \
    dnf -y config-manager --set-enabled crb; \
    dnf -y --allowerasing install \
    stow \
    tmux \
    zsh \
    git \
    ripgrep \
    htop \
    neofetch \
    unzip \
    cmake \
    gcc \
    wget \
    ; \
    cp -R /build/nvim/* /usr/local/; \
    cp -R /build/eza/* /usr/local/; \
    cp -R /build/bat/* /usr/local/; \
    cp -R /build/fzf/* /usr/local/; \
    rm -rf /build; \
    mkdir -p "$(bat --config-dir)/themes"; \
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Latte.tmTheme; \
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Frappe.tmTheme; \
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Macchiato.tmTheme; \
    wget -P "$(bat --config-dir)/themes" https://github.com/catppuccin/bat/raw/main/themes/Catppuccin%20Mocha.tmTheme; \
    bat cache --build; \
    usermod -s /usr/bin/zsh root; \
    sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended; \
    git clone https://github.com/zsh-users/zsh-autosuggestions.git "/root/.oh-my-zsh/custom/plugins/zsh-autosuggestions"; \
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "/root/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting"; \
    curl -s https://ohmyposh.dev/install.sh | bash -s; \
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm; \
    rm /root/.zshrc; \
    stow dotfiles -t /root; \
    nvim --headless "+Lazy! sync" +qa

WORKDIR /root
ENTRYPOINT [ "zsh" ]
