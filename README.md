# EyesofBucket's Config Files
![GitHub issues](https://img.shields.io/github/issues/EyesofBucket/configs) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/EyesofBucket/configs) ![GitHub last commit](https://img.shields.io/github/last-commit/EyesofBucket/configs) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=main&label=main) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=test&label=test)

Designed to be a quick and easy way to set up my ideal linux user environment, including my preferred shell, themes, plugins, and aliases.  Gone are the days of copying and pasting .config directories, of trying to figure out how to get that one vim plugin working.  Just run the setup script and enjoy a perfectly configured profile...

...Or at least for now.  I'm always looking for new ways to optimize my workflow, and as such this repo is ever-changing. Not to worry, though! most updates can be applied by simply using the update script.  The update script excludes installers and downloads and focuses primarily on config files stored in this repo.

### What it Installs
- oh-my-zsh
- oh-my-posh
- vim-plug

### What it Configures
- Zsh plugins
- Vim plugins
- Aliases
- Posh themes

## Setup
For initial install, simply paste this command in a shell.
```bash
sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/main/setup.sh)" ""
```
## Update
This one just updates the dotfiles if everything is already installed.
```bash
sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/main/update.sh)" ""
```
## Test Branch
When pulling from the test branch, use these commands instead.
### Setup
```bash
sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/test/test/setup.sh)" ""
```
### Update
```bash
sh -c "$(curl -fsSL https://raw.github.com/eyesofBucket/configs/test/test/update.sh)" ""
```
