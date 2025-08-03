local group = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmd("TextYankPost", {
    desc = "Highlight when yanking text",
    group = group("highlight-yank", {}),
    callback = function()
        vim.highlight.on_yank()
    end,
})
