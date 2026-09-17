ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
[ ! -d $ZINIT_HOME ] && mkdir -p "$(dirname $ZINIT_HOME)"
[ ! -d $ZINIT_HOME/.git ] && git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
source "${ZINIT_HOME}/zinit.zsh"

zi snippet OMZP::dotenv

zinit lucid for \
    zsh-users/zsh-autosuggestions
zinit lucid wait for \
    zdharma-continuum/fast-syntax-highlighting \
    Aloxaf/fzf-tab \
    greymd/docker-zsh-completion \
    zsh-users/zsh-completions

autoload -Uz compinit 
if [[ $(find "${HOME}/.zcompdump" -mtime +1 -print) ]]; then
    compinit
else
    compinit -C
fi

zinit cdreplay -q
