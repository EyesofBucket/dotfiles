zshdir="$HOME/.zshrc.d"

if [ -d $zshdir ]; then
    for f in $zshdir/*.sh; do source $f; done
fi

if [ -f $zshdir/custom.sh ]; then
    source $zshdir/custom.sh
fi
