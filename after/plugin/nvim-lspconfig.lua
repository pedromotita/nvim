local lspconfig = require("lspconfig")

lspconfig.util.default_config.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig.util.default_config.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
)

vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)      -- Go to definition
        vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts) -- Go to type definition
        vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)      -- View all references
        vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)  -- View all implementations
        vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, opts)          -- Rename Symbol
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                    -- Show type hint
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)     -- Code actions
 
        -- You can delete this if you enable format-on-save.
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

        require("lsp_signature").on_attach(event.client, event.bufnr)
    end
})

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "gopls",
    }
})

require("mason-lspconfig").setup_handlers({
    ["thriftls"] = function()
        require("lspconfig")["thriftls"].setup({
            on_attach = on_attach,
            capabilities = capabilities,
        })
    end,
    ["gopls"] = function()
        require("lspconfig")["gopls"].setup({
            cmd = {'/Users/pedro.mota/go/bin/gopls', '-remote=auto', '-rpc.trace', '-v'},
            on_attach = on_attach,
            capabilities = capabilities,
            root_dir = function(fname)
                return require("lspconfig.util").root_pattern("go_mod", ".git")(fname) or require("lspconfig.util").path.dirname(fname)
            end,
            init_options = {
                staticcheck = true,
            },
            flags = {
                -- Don't spam LSP with changes. Wait a second between each.
                debounce_text_changes = 1000,
            },
            capabilities = lsp_capabilities,
        })
    end
})
