#!/usr/bin/env bash

set -e # Exit on any non-zero exit code

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

HEADER="[   ] "
INFO="${BLUE}${HEADER}${NC}"
DONE="${PURPLE}${HEADER}${NC}"
WARN="${ORANGE}${HEADER}${NC}"
ERR="${RED}${HEADER}${NC}"

install_nix='yes'
use_nix='yes'

POSITIONAL_ARGS=()

while [[ $# -gt 0 ]]; do
  case $1 in
    --skip-nix)
      install_nix=''
      shift
      ;;
    --no-nix)
      use_nix=''
      shift
      ;;
    -*|--*)
      echo "Unknown option $1"
      exit 1
      ;;
    *)
      POSITIONAL_ARGS+=("$1")
      shift
      ;;
  esac
done

set -- "${POSITIONAL_ARGS[@]}"

configdir="${XDG_HOME_CONFIG:-$HOME/.config}"
if [[ ! -d "${configdir}" ]]; then
    echo -e "${WARN}$configdir missing. Creating."
    mkdir "${configdir}"
fi

if [[ $install_nix ]]; then
    echo -e "${INFO}Installing nix..."
    sh <(curl https://nixos.org/nix/install \
        --proto '=https' --tlsv1.2 -L \
        ) --daemon
fi

echo -e "${INFO}Running stow..."
if [[ $install_nix && $use_nix ]]; then
    nix-shell -p nixpkgs.stow --run "dotfiles -t ~"
else
    stow dotfiles -t ~
fi

echo -e "${INFO}Installing packages via nix..."
nix-env -iA nixpkgs.my-packages

echo -e "${INFO}Installing tpm..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo -e "${DONE}Done! Run ${CYAN}'exec zsh'${NC} to reload."
