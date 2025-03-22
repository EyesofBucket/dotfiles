return {
    "3rd/image.nvim",
    dependencies = { "luarocks.nvim" },
    opts = {},
    enabled = function() return jit.os == "Linux" end,
}
