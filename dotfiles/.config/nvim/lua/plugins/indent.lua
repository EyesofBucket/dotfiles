return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {
        scope = {
            enabled = false,
        },
    },
    event = { 'BufRead' },
    keys = {
        "<leader>i",
        "<CMD>IBLToggle<CR>",
        desc = "Indent: Toggle",
    }
}
