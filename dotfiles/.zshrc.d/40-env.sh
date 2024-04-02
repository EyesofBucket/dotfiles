if which nvim >/dev/null 2>&1
then
    export EDITOR="$(which nvim)"
else
    export EDITOR="$(which vim)"
fi

fpath=(~/.zshrc.d/fpath $fpath)
