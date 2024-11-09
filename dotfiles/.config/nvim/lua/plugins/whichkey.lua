return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  opts = {},
  config = function()
    require("which-key").add({
      { "e", group = "Explorer", },
      { "f", group = "Fun", },
      { "g", group = "Git", },
      { "h", group = "Help", },
      { "p", group = "Panes", },
      { "s", group = "Suda", },
      { "u", group = "Undotree", },
      { "v", group = "Lsp", },
    }, { prefix = "<leader>" })
  end,
}
