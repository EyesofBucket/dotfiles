if which nvim >/dev/null 2>&1
then
    export EDITOR="$(which nvim)"
    export MANPAGER="$(which nvim) +Man!"
    git config --global core.pager "nvim -R"
    git config --global color.pager no
else
    export EDITOR="$(which vim)"
fi

fpath=(~/.zshrc.d/fpath $fpath)
