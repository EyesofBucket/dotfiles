#!/bin/bash

branch="main"

while getopts 'ab:h' opt; do
  case "$opt" in
    a)
      all=true
      ;;

    b)
      branch="$OPTARG"
      ;;
   
    ?|h)
      echo "Usage: setup.sh [-a] [-b branch]"
      exit 1
      ;;
  esac
done
shift "$(($OPTIND -1))"

wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/.zshrc" -O ~/.zshrc
wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/.eyesofbucket.omp.json" -O ~/.eyesofbucket.omp.json
wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/.vimrc" -O ~/.vimrc
vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null
cat /tmp/vim.log
