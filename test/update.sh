#!/bin/bash

wget --no-verbose https://raw.github.com/eyesofBucket/configs/test/dotfiles/.zshrc -O ~/.zshrc
wget --no-verbose https://raw.github.com/eyesofBucket/configs/test/dotfiles/.eyesofbucket.omp.json -O ~/.eyesofbucket.omp.json
wget --no-verbose https://raw.github.com/eyesofBucket/configs/test/dotfiles/.vimrc -O ~/.vimrc
vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null
cat /tmp/vim.log