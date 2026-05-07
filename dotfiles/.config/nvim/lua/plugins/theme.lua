return {
    {
        "ribru17/bamboo.nvim",
        priority = 1000,
        lazy = true,

        config = function()
            require('bamboo').setup {
                style = 'multiplex',
                transparent = true,
            }
            require('bamboo').load()
        end
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        priority = 1000,
        lazy = true,
    },
    {
        "neanias/everforest-nvim",
        priority = 1000,
        lazy = true,
        config = function()
            require('everforest').setup {
                transparent_background_level = 1,
            }
            require('everforest').load()
        end
    },
    {
        "kepano/flexoki-neovim",
        priority = 1000,
        lazy = true,
    },
    {
        "ellisonleao/gruvbox.nvim",
        priority = 1000,
        lazy = true,
    },
    {
        "rebelot/kanagawa.nvim",
        priority = 1000,
        lazy = true,
    },
    {
        "tahayvr/matteblack.nvim",
        priority = 1000,
        lazy = true,
    },
    {
        "gthelding/monokai-pro.nvim",
        priority = 1000,
        lazy = true,
        config = function()
            require("monokai-pro").setup({
                filter = "ristretto",
                override = function()
                    return {
                        NonText = { fg = "#948a8b" },
                        MiniIconsGrey = { fg = "#948a8b" },
                        MiniIconsRed = { fg = "#fd6883" },
                        MiniIconsBlue = { fg = "#85dacc" },
                        MiniIconsGreen = { fg = "#adda78" },
                        MiniIconsYellow = { fg = "#f9cc6c" },
                        MiniIconsOrange = { fg = "#f38d70" },
                        MiniIconsPurple = { fg = "#a8a9eb" },
                        MiniIconsAzure = { fg = "#a8a9eb" },
                        MiniIconsCyan = { fg = "#85dacc" },
                    }
                end,
            })
        end,
    },
    {
        'AlexvZyl/nordic.nvim',
        priority = 1000,
        lazy = true,
        config = function()
            require('nordic').setup({
                transparent = { bg = true, float = false },
            })
            require('nordic').load()
        end
    },
    {
        "rose-pine/neovim",
        name = "rose-pine",
        priority = 1000,
        lazy = true,
    },
    {
        "folke/tokyonight.nvim",
        priority = 1000,
        lazy = true,
    },
    {
        "EdenEast/nightfox.nvim",
        priority = 1000,
        lazy = true,
    },
    {
        "bjarneo/hackerman.nvim",
        dependencies = { "bjarneo/aether.nvim" },
        priority = 1000,
        lazy = true,
    },
    {
        "bjarneo/ethereal.nvim",
        priority = 1000,
        lazy = true
    },
    {
        "bjarneo/vantablack.nvim",
        priority = 1000,
        lazy = true,
    },
    {
        "EskelinenAntti/omarchy-theme-loader.nvim",
        opts = {
            themes = {
                ["vantablack"] = {
                    colorscheme = "vantablack"
                },
                ["nord"] = {
                    colorscheme = "nordic"
                },
            }
        }
    },
}
