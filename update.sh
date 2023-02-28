#!/bin/bash

# sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/main/update.sh)" ""

wget --no-verbose https://raw.github.com/eyesofBucket/configs/main/dotfiles/.zshrc -O ~/.zshrc
wget --no-verbose https://raw.github.com/eyesofBucket/configs/main/dotfiles/.vimrc -O ~/.vimrc
vim -c "PlugInstall" -c "qa"

exec zsh