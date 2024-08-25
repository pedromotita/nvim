local lsp_signature = require('lsp_signature')

local on_attach = function(client, bufnr)
  local opts = { noremap=true, silent=true, buffer=bufnr }
 
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions

  vim.keymap.set('n', '<leader>gd', vim.lsp.buf.definition, opts)      -- Go to definition
  vim.keymap.set('n', '<leader>gt', vim.lsp.buf.type_definition, opts) -- Go to type definition

  vim.keymap.set('n', '<leader>gr', vim.lsp.buf.references, opts)      -- View all references
  vim.keymap.set('n', '<leader>gi', vim.lsp.buf.implementation, opts)  -- View all implementations

  vim.keymap.set('n', '<leader>rs', vim.lsp.buf.rename, opts)          -- Rename Symbol

  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)                    -- Show type hint

  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)     -- Code actions
 
  -- You can delete this if you enable format-on-save.
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, opts)

  -- Attach lsp signature
  lsp_signature.on_attach(client, bufnr)

end
 
local cmp = require 'cmp'
cmp.setup({
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
    }),
    mapping = {
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
        ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
        ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
    }
})

local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig').gopls.setup {
        cmd = {'gopls', '-remote=auto'},
        on_attach = on_attach,
        flags = {
            -- Don't spam LSP with changes. Wait a second between each.
            debounce_text_changes = 1000,
        },
        capabilities = lsp_capabilities,
}

