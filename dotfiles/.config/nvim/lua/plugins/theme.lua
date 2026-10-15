return {
    "catppuccin/nvim",
    name = "catppuccin",
    dependencies = {
        "EskelinenAntti/omarchy-theme.nvim",
    },
    lazy = false,
    priority = 1000,
    opts = {
        flavour = "mocha",
        transparent_background = true,
        show_end_of_buffer = true,
        custom_highlights = function (colors)
            return {
                ["@text.strong"] = { fg = colors.sapphire },
                ["@text.emphasis"] = { fg = colors.green},
            }
        end
    },
    init = function()
        if (require("omarchy-theme.environment").is_omarchy()) then
            vim.cmd.colorscheme("omarchy")
        else
            vim.cmd.colorscheme("catppuccin-nvim")
        end
        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
    end,
}
