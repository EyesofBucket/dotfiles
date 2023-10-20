# EyesofBucket's Config Files
![GitHub issues](https://img.shields.io/github/issues/EyesofBucket/configs) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/EyesofBucket/configs) ![GitHub last commit](https://img.shields.io/github/last-commit/EyesofBucket/configs) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=main&label=main) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=test&label=test)

Designed to be a quick and easy way to set up my ideal linux user environment, including my preferred shell, themes, plugins, and aliases.  Gone are the days of copying and pasting .config directories, of trying to figure out how to get that one vim plugin working.  Just run the setup script and enjoy a perfectly configured profile...

...Or at least for now.  I'm always looking for new ways to optimize my workflow, and as such this repo is ever-changing. Not to worry, though! most updates can be applied by simply using the update script.  The update script excludes installers and downloads and focuses primarily on config files stored in this repo.

### Setup
For initial install, simply paste this command in a shell.
```bash
bash -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/main/boot.sh)" "" -i
```
### Update
This one just updates the dotfiles if everything is already installed.
```bash
bash -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/main/boot.sh)" ""
```

## Tools

### [Zsh](https://www.zsh.org/)
Uses the fantastic [Oh My Zsh](https://github.com/ohmyzsh/ohmyzsh) and a handful of plugins including:
- git
- sudo
- dirhistory
- history
- zsh-autosuggestions
- jsontools

### [Oh My Posh](https://github.com/JanDeDobbeleer/oh-my-posh)
I use a custom posh theme to provide a nice, cross-platform solution to theming.  It even works on Powershell!

### [Neovim](https://github.com/neovim/neovim)
Very early stages on this.  Working to build a custom environment, one whose plugins and features will be listed here soon.

### [Tmux](https://github.com/tmux/tmux)
Like Neovim, this one is also new to me.  Will update soon with the major changes and plugins used.