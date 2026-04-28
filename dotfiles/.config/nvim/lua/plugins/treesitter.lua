return {
    {
        "nvim-treesitter/nvim-treesitter",
        lazy = false,
        branch = 'main',
        build = ":TSUpdate",
        init = function()
            vim.api.nvim_create_autocmd('FileType', { 
                callback = function() 
                    -- Enable treesitter highlighting and disable regex syntax
                    pcall(vim.treesitter.start) 
                    -- Enable treesitter-based indentation
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" 
                end, 
            })
            require('nvim-treesitter').install {
                "c",
                "bash",
                "dockerfile",
                "git_config",
                "git_rebase",
                "gitcommit",
                "gitignore",
                "go",
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
                "yaml",
            }
        end,
    },
}
