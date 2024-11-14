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
