#!/bin/bash

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# oh-my-posh
arch=""
case $(uname -m) in
    i386)    arch="386" ;;
    i686)    arch="386" ;;
    x86_64)  arch="amd64" ;;
    aarch64) arch="arm64" ;;
    armv71)  arch="arm" ;;
    arm)     dpkg --print-architecture | grep -q "arm64" && arch="arm64" || arch="arm" ;;
esac
wget "https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-$arch" -O /usr/local/bin/oh-my-posh
chmod a+rx /usr/local/bin/oh-my-posh

# vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install tmux plugin manager
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

# Install Packer
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim
