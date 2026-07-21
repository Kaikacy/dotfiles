local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
    desc = "Highlight yank",
    callback = function() vim.hl.on_yank() end,
})

autocmd("BufWinEnter", {
    desc = "Split help and man pages window vertically",
    callback = function()
        if vim.bo.buftype == "help" or vim.bo.filetype == "man" then vim.cmd.wincmd("L") end
    end,
})
