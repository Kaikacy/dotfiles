local ts = require("nvim-treesitter")

vim.api.nvim_create_autocmd("FileType", {
    desc = "Setup treesitter",
    pattern = ts.get_installed(), -- Not ideal, as filetype and parser names might differ
    callback = function()
        vim.treesitter.start()
        -- Overridden by lsp if supported
        vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
        vim.wo[0][0].foldmethod = "expr"
        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- Experimental
    end,
})
