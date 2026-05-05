# EyesofBucket's Dotfiles
![GitHub issues](https://img.shields.io/github/issues/EyesofBucket/configs) ![GitHub commit activity](https://img.shields.io/github/commit-activity/m/EyesofBucket/configs) ![GitHub last commit](https://img.shields.io/github/last-commit/EyesofBucket/configs) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=main&label=main) ![GitHub Workflow Status (with branch)](https://img.shields.io/github/actions/workflow/status/EyesofBucket/configs/main.yml?branch=test&label=test)

Dotfiles repo for Linux, Windows, and MacOS, in that order. Utilizes `stow`,
`nix`, `bash`, and `powershell` for deployment.

## Setup
### Linux
1. Install `zsh` and `curl` using the system's package manager
2. Run the following:
   ```bash
   # Clone repo
   git clone https://github.com/eyesofBucket/configs ~/bvkt
   cd ~/bvkt

   # Run setup script
   ./setup.sh
   ```

### Windows 

1. Install Visual Studio (Desktop development with C++)
2. Run the following:
   ```powershell
   # Install Scoop
   Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
   Invoke-RestMethod -Uri https://get.scoop.sh | Invoke-Expression
   
   # Install base apps
   scoop install 7zip git
   
   # Clone repo and install the rest of the scoop apps
   git clone https://github.com/eyesofBucket/configs $Env:LOCALAPPDATA\bvkt
   scoop import $Env:LOCALAPPDATA\bvkt\scoop.json
   
   # Install profile
   mkdir $Env:USERPROFILE\Documents\PowerShell
   cp $Env:LOCALAPPDATA\bvkt\profile.ps1 $Env:USERPROFILE\Documents\PowerShell
   ```
