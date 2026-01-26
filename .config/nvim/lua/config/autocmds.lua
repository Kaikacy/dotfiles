local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("TextYankPost", {
	desc = "Highlight yank",
	group = augroup("highlight-yank", {}),
	callback = vim.hl.on_yank,
})
