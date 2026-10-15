#zmodload zsh/zprof # timing

zshdir="$HOME/.zshrc.d"

if [ -d $zshdir ]; then
    for f in $zshdir/*.sh; do source $f; done
fi

# opencode
export PATH=$HOME/.opencode/bin:$PATH
