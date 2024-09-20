addToPath() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$PATH:$1
    fi
}

addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

addToPathFront $HOME/.local/scripts

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

# Separate entries with ;
export BVKT_PROJECT_DIRS="$HOME/projects;$HOME/Obsidian;$HOME/git"
export BVKT_PROJECTS="$HOME/bvkt"

export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

export LOCALE_ARCHIVE=/usr/lib/locale/locale-archive
