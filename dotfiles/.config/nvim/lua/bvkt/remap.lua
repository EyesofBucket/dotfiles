vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Oil)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("v", "gt", ":s/\\v<%((.)%(\\w{3,})@=|(i>))(\\w*)/\\u\\1\\L\\2\\3/g<CR>", {desc = "Title caps"})