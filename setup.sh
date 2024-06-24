#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m'

HEADER="[BVKT]${NC} "
INFO="${BLUE}${HEADER}"
WARN="${ORANGE}${HEADER}"
ERR="${RED}${HEADER}"

CONFIGDIR="${XDG_HOME_CONFIG:-$HOME/.config}"
if [ ! -d "${CONFIGDIR}" ]; then
    echo -e "${INFO}${CYAN}${CONFIGDIR} ${ORANGE}missing. Creating.${NC}"
    mkdir "${CONFIGDIR}"
fi

echo -e "${INFO}${ORANGE}Running stow...${NC}"
stow dotfiles -t ~
if [ $? -ne 0 ]; then
    echo -e "${ERR}${ORANGE}Stow failed! Exiting.${NC}"
    exit 1
fi

# oh-my-zsh
echo -e "${INFO}${ORANGE}Installing oh-my-zsh...${NC}"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-autosuggestions"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting"

# oh-my-posh
echo -e "${INFO}${ORANGE}Installing oh-my-posh...${NC}"
curl -s https://ohmyposh.dev/install.sh | sudo bash -s

# vim-plug
echo -e "${INFO}${ORANGE}Installing vim-plug...${NC}"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Install tmux plugin manager
echo -e "${INFO}${ORANGE}Installing tpm...${NC}"
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
