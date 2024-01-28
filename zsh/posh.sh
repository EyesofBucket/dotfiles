eval "$(oh-my-posh init zsh --config ~/.config/bvkt/eyesofbucket.omp.json)"

function set_poshcontext() {
    depth=$(dirs -p | tail -n +2 | wc -l | sed 's/ //g')
    if [ "$depth" -ne "0" ]; then
        export BVKT_DEPTH="${depth}"
        return
    fi
    unset BVKT_DEPTH
}
