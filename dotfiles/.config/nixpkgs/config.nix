{
  packageOverrides =
    pkgs: with pkgs; {
      myPackages = pkgs.buildEnv {
        name = "my-packages";
        paths = [
          bat
          eza
          fzf
          jq
          macchina
          neovim
          starship
          stow
          tmux
          yq
          zsh
        ];
      };
    };
}
