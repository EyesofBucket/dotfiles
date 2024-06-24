return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    opts = {
        settings = {
            save_on_toggle = true,
            sync_on_ui_close = true,
        },
    },
    config = function(_, opts)
        require("harpoon"):setup(opts)
    end,
    keys = {
        {
            "<leader>a",
            function()
                require("harpoon"):list():append()
            end,
            desc = "Harpoon: Mark file",
        },
        {
            "<leader>ph",
            function()
                local harpoon = require("harpoon")
                harpoon.ui:toggle_quick_menu(harpoon:list())
            end,
            desc = "Harpoon: Open menu",
        },
        {
            "<C-H>",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon: Jump to 1",
        },
        {
            "<C-J>",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon: Jump to 2",
        },
        {
            "<C-K>",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon: Jump to 3",
        },
        {
            "<C-L>",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon: Jump to 4",
        },
        {
            "<C-S-P>",
            function()
                require("harpoon"):list():prev()
            end,
            desc = "Harpoon: Jump to previous",
        },
        {
            "<C-S-N>",
            function()
                require("harpoon"):list():next()
            end,
            desc = "Harpoon: Jump to next",
        },
    },
}
