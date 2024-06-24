return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/nvim-cmp",
        "hrsh7th/cmp-nvim-lsp",
        "L3MON4D3/LuaSnip",
    },
    event = { 'BufRead' },
    keys = {
        { "<leader>pm", "<CMD>Mason<CR>", desc = "Open Mason" },
    },
    config = function()
        require("lspconfig")

        vim.api.nvim_create_autocmd('LspAttach', {
            desc = 'LSP actions',
            callback = function(event)
                vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, {buffer = event.buf, desc = "Go to definition",})
                vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, {buffer = event.buf})
                vim.keymap.set("n", "<leader>vw", function() vim.lsp.buf.workspace_symbol() end, {buffer = event.buf, desc = "Workspace symbols",})
                vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, {buffer = event.buf, desc = "Diag: Open float",})
                vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, {buffer = event.buf, desc = "Next Diag",})
                vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, {buffer = event.buf, desc = "Previous Diag",})
                vim.keymap.set("n", "<leader>va", function() vim.lsp.buf.code_action() end, {buffer = event.buf, desc = "Code actions",})
                vim.keymap.set("n", "<leader>vr", function() vim.lsp.buf.references() end, {buffer = event.buf, desc = "Show references",})
                vim.keymap.set("n", "<leader>vn", function() vim.lsp.buf.rename() end, {buffer = event.buf, desc = "Rename",})
                vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, {buffer = event.buf})
            end,
        })

        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

        local default_setup = function(server)
            require('lspconfig')[server].setup({
                capabilities = lsp_capabilities,
            })
        end

        local mason = require("mason")
        local mason_lspconfig  = require("mason-lspconfig")

        mason.setup()
        mason_lspconfig.setup()
        mason_lspconfig.setup_handlers {
            default_setup
        }

        local cmp = require('cmp')
        local cmp_select = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
            sources = {
                {name = 'nvim_lsp'},
            },
            mapping = cmp.mapping.preset.insert({
                ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
                ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
                ['<C-y>'] = cmp.mapping.confirm({ select = true }),
                ['<C-e>'] = cmp.mapping.abort(),
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },
        })
    end,
}
