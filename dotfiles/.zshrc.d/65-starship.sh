function bvktdepth() {
    export BVKT_DEPTH="$(dirs -p | tail -n +2 | wc -l | sed 's/ //g')"
}
typeset -a precmd_functions
precmd_functions+=(bvktdepth)

zinit ice as"command" from"gh-r" \
          atclone"./starship init zsh > init.zsh; ./starship completions zsh > _starship" \
          atpull"%atclone" src"init.zsh"
zinit light starship/starship
