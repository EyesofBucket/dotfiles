vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", "<cmd>Oil --float<CR>", { desc = "Oil" })
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "n", "nzzzv")

vim.keymap.set("x", "<leader>p", "\"_dP", { desc = "put (no buffer overwrite)" })

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("v", "gt", ":s/\\v<%((.)%(\\w{3,})@=|(i>))(\\w*)/\\u\\1\\L\\2\\3/g<CR>", { desc = "Title caps" })

vim.keymap.set("n", "<C-Right>", "<CMD>next<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<C-Left>", "<CMD>previous<CR>", { desc = "Previous buffer" })

-- From Stephen Pate (https://github.com/StephenP-AL/dotfiles/blob/master/.vimrc
vim.keymap.set("v", "<leader>{", "<esc>`>a}<esc>`<i{<esc>")
vim.keymap.set("v", "<leader>[", "<esc>`>a]<esc>`<i[<esc>")
vim.keymap.set("v", "<leader>(", "<esc>`>a)<esc>`<i(<esc>")
vim.keymap.set("v", "<leader><", "<esc>`>a><esc>`<i<<esc>")
vim.keymap.set("v", "<leader>'", "<esc>`>a'<esc>`<i'<esc>")
vim.keymap.set("v", "<leader>\"", "<esc>`>a\"<esc>`<i\"<esc>")

vim.api.nvim_create_autocmd("FileType", {
    pattern = "man",
    callback = function()
        vim.schedule(function()
            vim.keymap.set(
                "n",
                "<leader>go",
                "<CMD>lua require'man'.show_toc()<CR><CMD>wincmd H<CR><CMD>vert res 40<CR><CMD>se nowrap<CR>",
                { buffer = true, desc = "Open Manpage TOC" }
            )
        end)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "qf",
    callback = function()
        vim.schedule(function()
            vim.keymap.set(
                "n",
                "<leader>go",
                "<CMD>q<CR>",
                { buffer = true, desc = "Close Manpage TOC" }
            )
        end)
    end,
})

vim.keymap.set("n", "<leader>gc", "<CMD>silent !glab-ci dashboard<CR>")
