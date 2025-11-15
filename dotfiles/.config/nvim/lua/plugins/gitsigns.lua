return {
    "lewis6991/gitsigns.nvim",
    event = "BufReadPre",
    keys = {
        {
            "<leader>gb",
            "<CMD>Gitsigns blame<CR>",
            desc = "Gitsigns: Show Blame",
        },
        {
            "<leader>gl",
            "<CMD>Gitsigns blame_line<CR>",
            desc = "Gitsigns: Show Blame",
        },
    },
}
