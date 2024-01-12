# EyesofBucket's Config Files
![GitHub issues](https://img.shields.io/github/issues/EyesofBucket/configs) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/EyesofBucket/configs) ![GitHub last commit](https://img.shields.io/github/last-commit/EyesofBucket/configs) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=main&label=main) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=test&label=test)

Designed to be a quick and easy way to set up my ideal linux user environment, including my preferred shell, themes, plugins, and aliases.  Gone are the days of copying and pasting .config directories, of trying to figure out how to get that one vim plugin working.  Just run the setup script and enjoy a perfectly configured profile...

...Or at least for now.  I'm always looking for new ways to optimize my workflow, and as such this repo is ever-changing. Not to worry, though! most updates can be applied by simply using the update script.  The update script excludes installers and downloads and focuses primarily on config files stored in this repo.

## Setup
### Linux
```
git clone https://github.com/eyesofBucket/configs ~/.config/bvkt
cp ~/.config/bvkt/profiles/.zshrc ~/
cp ~/.config/bvkt/profiles/.vimrc ~/
```

### Windows 
```
git clone https://github.com/eyesofBucket/configs $Env:LOCALAPPDATA\bvkt
cp $Env:LOCALAPPDATA\bvkt\profiles\profile.ps1 ~\Documents\Powershell
```

## Tools

### [Zsh](https://www.zsh.org/)
Uses the fantastic [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and a handful of plugins including:
- git
- sudo
- dirhistory
- history
- zsh-autosuggestions
- zsh-syntax-highlighting
- jsontools

### [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh)
I use a custom posh theme to provide a nice, cross-platform solution to theming.  It even works on Powershell!

### [Neovim](https://github.com/neovim/neovim)
Very early stages on this.  Working to build a custom environment, one whose plugins and features will be listed here soon.

### [Tmux](https://github.com/tmux/tmux)
Like Neovim, this one is also new to me.  Will update soon with the major changes and plugins used.
