return {
    cmd = { 'lua-language-server' },
    filetypes = { 'lua' },
    settings = {
        Lua = {
            codeLens = {
                enable = true
            },
            hint = {
                enable = true,
                semicolon = "Disable"
            },
            diagnostics = {
                globals = { "vim" }
            }
        }
    }
}
