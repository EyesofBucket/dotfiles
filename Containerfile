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
    ; \
    git clone https://github.com/neovim/neovim; \
    cd neovim; \
    git checkout stable; \
    make CMAKE_BUILD_TYPE=RelWithDebInfo; \
    make CMAKE_INSTALL_PREFIX=/nvim install

FROM ${BASE_REGISTRY}/${BASE_IMAGE}:${BASE_TAG} AS env

COPY dotfiles /dotfiles
COPY --from=build /nvim /nvim

RUN dnf -y install epel-release; \
    dnf -y install 'dnf-command(config-manager)'; \
    dnf -y config-manager --set-enabled crb; \
    dnf -y --allowerasing install \
    stow \
    tmux \
    zsh \
    git \
    unzip \
    cmake \
    gcc \
    ; \
    cp -R /nvim/* /usr/local/; \
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
