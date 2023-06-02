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

if ![ -f ~/.config/bvkt ]; then
  mkdir ~/.config/bvkt
fi

wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/zshrc" -O ~/.zshrc
wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/alias.sh" -O ~/.config/bvkt/alias.sh

if ![ -f ~/.config/bvkt/custom.sh ]; then
  wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/custom.sh" -O ~/.config/bvkt/custom.sh
fi

wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/eyesofbucket.omp.json" -O ~/.eyesofbucket.omp.json
wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/vimrc" -O ~/.vimrc
vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null
cat /tmp/vim.log

if [ "$all" = true ]
then
    sudo wget --no-verbose "https://raw.github.com/eyesofBucket/configs/$branch/dotfiles/sudoers_eyesofbucket" -O /etc/sudoers.d/eyesofbucket
    sudo chmod 440 /etc/sudoers.d/eyesofbucket
fi
