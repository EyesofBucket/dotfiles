#!/bin/bash

# sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/test/update.sh)" ""

wget --no-verbose https://raw.github.com/eyesofBucket/configs/test/dotfiles/.zshrc -O ~/.zshrc
wget --no-verbose https://raw.github.com/eyesofBucket/configs/test/dotfiles/.vimrc -O ~/.vimrc
vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null
cat /tmp/vim.log

exec zsh