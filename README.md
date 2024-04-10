# EyesofBucket's Config Files
![GitHub issues](https://img.shields.io/github/issues/EyesofBucket/configs) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/EyesofBucket/configs) ![GitHub last commit](https://img.shields.io/github/last-commit/EyesofBucket/configs) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=main&label=main) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=test&label=test)

Designed to be a quick and easy way to set up my ideal linux user environment, including my preferred shell, themes, plugins, and aliases.  Gone are the days of copying and pasting .config directories, of trying to figure out how to get that one vim plugin working.  Just run the setup script and enjoy a perfectly configured profile...

...Or at least for now.  I'm always looking for new ways to optimize my workflow, and as such this repo is ever-changing. Not to worry, though! most updates can be applied by simply using the update script.  The update script excludes installers and downloads and focuses primarily on config files stored in this repo.

## Setup
### Linux
```
git clone https://github.com/eyesofBucket/configs ~/bvkt
cd ~/bvkt
./setup.sh
```

### Windows 
```
git clone https://github.com/eyesofBucket/configs $Env:LOCALAPPDATA\bvkt
cp $Env:LOCALAPPDATA\bvkt\profiles\profile.ps1 ~\Documents\Powershell
```
