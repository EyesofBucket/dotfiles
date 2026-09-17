return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        require('telescope').setup {
            defaults = {
                file_ignore_patterns = { "^.git/" },
            },
            pickers = {
                live_grep = {
                    additional_args = {
                        "--hidden", "-g", "!.git",
                    },
                },
                find_files = {
                    hidden = true
                },
            },
        }
    end,
    keys = {
        {
            "<leader>pf",
            function()
                require('telescope.builtin').find_files()
            end,
            desc = "Telescope: Files"
        },
        {
            "<leader>ps",
            function()
                require('telescope.builtin').live_grep()
            end,
            desc = "Telescope: Grep"
        },
        {
            "<leader>pg",
            function()
                require('telescope.builtin').git_files()
            end,
            desc = "Telescope: Git"
        },
        {
            "<leader>pt",
            function()
                require('telescope.builtin').treesitter()
            end,
            desc = "Telescope: Treesitter"
        },
        {
            "<leader>hh",
            function()
                local open_in_right_split = function(prompt_bufnr)
                    local selection = require('telescope.actions.state').get_selected_entry()
                    require('telescope.actions').close(prompt_bufnr)
                    vim.cmd.help(selection.value)
                    vim.cmd.wincmd('L')
                end

                require('telescope.builtin').help_tags({
                    attach_mappings = function(_, map)
                        map('i', '<CR>', open_in_right_split)
                        map('n', '<CR>', open_in_right_split)
                        return true
                    end
                })
            end,
            noremap = true,
            silent = true,
            desc = "Help: Neovim"
        },
        {
            "<leader>hm",
            function()
                local open_in_right_split = function(prompt_bufnr)
                    local selection = require('telescope.actions.state').get_selected_entry()
                    require('telescope.actions').close(prompt_bufnr)
                    vim.cmd.help(selection.value)
                    vim.cmd.wincmd('L')
                end

                require('telescope.builtin').man_pages({
                    attach_mappings = function(_, map)
                        map('i', '<CR>', open_in_right_split)
                        map('n', '<CR>', open_in_right_split)
                        return true
                    end
                })
            end,
            noremap = true,
            silent = true,
            desc = "Help: Man"
        },
    },
}
