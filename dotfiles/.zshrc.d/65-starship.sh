function bvktdepth() {
    export BVKT_DEPTH="$(dirs -p | tail -n +2 | wc -l | sed 's/ //g')"
}
typeset -a precmd_functions
precmd_functions+=(bvktdepth)
eval "$(starship init zsh)"
