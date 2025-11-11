return {
  {
    "nvim-treesitter/nvim-treesitter",
    event = { 'BufRead' },
    build = ":TSUpdate",
    opts = {
        ensure_installed = {
            "c",
            "dockerfile",
            "git_config",
            "git_rebase",
            "gitcommit",
            "gitignore",
            "gotmpl",
            "helm",
            "html",
            "javascript",
            "json",
            "lua",
            "markdown",
            "markdown_inline",
            "nix",
            "passwd",
            "python",
            "query",
            "ssh_config",
            "toml",
            "vim",
            "vimdoc",
            "yaml"
        },
        sync_install = false,
        additional_vim_regex_highlighting = false,
        highlight = { enable = true },
        indent = { enable = true },
    }
  },
}
