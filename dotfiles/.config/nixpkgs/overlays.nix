final: prev: {
  ovftool = prev.ovftool.override {
    acceptBroadcomEula = true;
  };
  bvkt-base = prev.buildEnv {
    name = "bvkt-base";
    paths = with prev; [
      bat
      btop
      cmake
      eza
      fzf
      jq
      macchina
      neovim
      nodejs_24
      ripgrep
      stow
      tmux
      tree-sitter
      yq
    ];
  };
  bvkt-work = prev.buildEnv {
    name = "bvkt-work";
    paths = with prev; [
      final.ovftool
      crane
      devcontainer
      glab
    ];
  };
}
