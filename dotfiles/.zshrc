zshdir="$HOME/.zshrc.d"

if [ -d $zshdir ]; then
    for f in $zshdir/*.sh; do source $f; done
fi

if [ -f $zshdir/custom.sh ]; then
    source $zshdir/custom.sh
fi

# The following lines were added by compinstall
zstyle :compinstall filename "$HOME/.zshrc"

autoload -Uz compinit
compinit
# End of lines added by compinstall
