#!/bin/bash

# sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/main/setup.sh)" ""

# Install requirements
PACKAGES='curl wget zsh git vim'

# Debian
if which apt >/dev/null
then
    sudo apt install -y $PACKAGES

# Fedora
elif which yum >/dev/null
then
    sudo yum install -y $PACKAGES

# Arch
elif which pacman >/dev/null
then
    sudo pacman -S --noconfirm $PACKAGES
else
    printf "\033[0;31mUnable to install requirements: No package manager found.\033[0m\n" 1>&2
    exit 1
fi

# Set default shell
sudo usermod "$USER" -s "$(which zsh)"

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended

# Install Zsh plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

# Install oh-my-posh
sudo wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/posh-linux-amd64 -O /usr/local/bin/oh-my-posh
sudo chmod +x /usr/local/bin/oh-my-posh

# Get oh-my-posh themes
mkdir ~/.poshthemes
wget https://github.com/JanDeDobbeleer/oh-my-posh/releases/latest/download/themes.zip -O ~/.poshthemes/themes.zip
unzip ~/.poshthemes/themes.zip -d ~/.poshthemes
chmod u+rw ~/.poshthemes/*.omp.*
rm ~/.poshthemes/themes.zip

# Install vim-plug
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Add config files
wget --no-verbose https://raw.github.com/eyesofBucket/configs/main/dotfiles/.zshrc -O ~/.zshrc
wget --no-verbose https://raw.github.com/eyesofBucket/configs/main/dotfiles/.vimrc -O ~/.vimrc

# Install vim plugins as listed in the config file
vim --not-a-term -c "PlugInstall" -c "%w /tmp/vim.log" -c "qa" >/dev/null
cat /tmp/vim.log
