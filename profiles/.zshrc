zshdir="$HOME/.config/bvkt/zsh"

if [ -f $zshdir ]; then
    for f in $zshdir/*.sh; do source $f; done
fi

if [ -f $zshdir/custom.sh ]; then
    source $zshdir/custom.sh
fi
