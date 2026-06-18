vim.api.nvim_create_autocmd("LspAttach", {
    desc = "LSP actions",
    callback = function(event)
        local opts = { buffer = event.buf }

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)          -- Go to definition
        vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, opts)     -- Go to type definition
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)          -- View all references
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)      -- View all implementations
        vim.keymap.set('n', 'rs', vim.lsp.buf.rename, opts)              -- Rename Symbol
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                -- Show type hint
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts) -- Code actions

        -- You can delete this if you enable format-on-save.
        vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

        if client:supports_method('textDocument/completion') then
            vim.lsp.completion.enable(true, client.id, event.buf, { autotrigger = true })
        end
    end
})

vim.cmd("set completeopt+=noselect")

vim.diagnostic.config({
    virtual_text = {
        prefix = '',
        spacing = 2,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
})
