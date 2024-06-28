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
                require("harpoon"):list():add()
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
            "<C-1>",
            function()
                require("harpoon"):list():select(1)
            end,
            desc = "Harpoon: Jump to 1",
        },
        {
            "<C-2>",
            function()
                require("harpoon"):list():select(2)
            end,
            desc = "Harpoon: Jump to 2",
        },
        {
            "<C-3>",
            function()
                require("harpoon"):list():select(3)
            end,
            desc = "Harpoon: Jump to 3",
        },
        {
            "<C-4>",
            function()
                require("harpoon"):list():select(4)
            end,
            desc = "Harpoon: Jump to 4",
        },
        {
            "<C-5>",
            function()
                require("harpoon"):list():select(5)
            end,
            desc = "Harpoon: Jump to 5",
        },
        {
            "<C-6>",
            function()
                require("harpoon"):list():select(6)
            end,
            desc = "Harpoon: Jump to 6",
        },
        {
            "<C-7>",
            function()
                require("harpoon"):list():select(7)
            end,
            desc = "Harpoon: Jump to 7",
        },
        {
            "<C-8>",
            function()
                require("harpoon"):list():select(8)
            end,
            desc = "Harpoon: Jump to 8",
        },
        {
            "<C-9>",
            function()
                require("harpoon"):list():select(9)
            end,
            desc = "Harpoon: Jump to 9",
        },
    },
}
