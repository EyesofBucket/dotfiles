#!/bin/bash

# Specify branch
if [ -z "$0" ]
then
    branch="main"
else
    branch="$0"
fi

wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/.zshrc" -O ~/.zshrc
wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/.eyesofbucket.omp.json" -O ~/.eyesofbucket.omp.json
wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/.vimrc" -O ~/.vimrc
vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null
cat /tmp/vim.log