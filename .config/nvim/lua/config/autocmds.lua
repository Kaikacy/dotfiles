local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
    desc = "Highlight yank",
    group = augroup("uhighlight-yank", {}),
    callback = function() vim.hl.on_yank() end,
})
