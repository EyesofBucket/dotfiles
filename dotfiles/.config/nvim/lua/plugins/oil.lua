return {
    'stevearc/oil.nvim',
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        view_options = {
            show_hidden = true,
        },
        keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
        },
    },
}
