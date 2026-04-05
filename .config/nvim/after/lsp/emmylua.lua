---@type vim.lsp.Config
return {
    cmd = { 'emmylua_ls' },
    filetypes = { 'lua' },
    root_markers = {
        '.luarc.json',
        '.emmyrc.json',
        '.luacheckrc',
        '.git',
    },
    workspace_required = false,
    settings = {
        runtime = {
            version = "LuaJIT",
        },
        workspace = {
            library = vim.env.VIMRUNTIME,
        },
        diagnostics = {
            enable = false,
        },
    },
}
