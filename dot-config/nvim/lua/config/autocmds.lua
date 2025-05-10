local group = vim.api.nvim_create_augroup

vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = group("highlight-yank", {}),
	callback = function()
		vim.highlight.on_yank()
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Make q close non-real files",
	group = group("q-close-non-real", { clear = false }),
	callback = function(args)
		-- Add cache for buffers that have already had mappings created
		if not vim.g.q_close_windows then
			vim.g.q_close_windows = {}
		end
		-- If the buffer has been checked already, skip
		if vim.g.q_close_windows[args.buf] then
			return
		end
		-- Mark the buffer as checked
		vim.g.q_close_windows[args.buf] = true
		-- Check to see if `q` is already mapped to the buffer (avoids overwriting)
		for _, map in ipairs(vim.api.nvim_buf_get_keymap(args.buf, "n")) do
			if map.lhs == "q" then
				return
			end
		end
		-- If there is no q mapping already and the buftype is a non-real file, create one
		if vim.tbl_contains({ "help", "nofile", "quickfix", "terminal" }, vim.bo[args.buf].buftype) then
			vim.keymap.set("n", "q", "<cmd>bwipeout<cr>", {
				desc = "Close window",
				buffer = args.buf,
				silent = true,
				nowait = true,
			})
		end
	end,
})

vim.api.nvim_create_autocmd("BufDelete", {
	desc = "Clean up q-close-non-real cache",
	group = group("q-close-non-real", { clear = false }),
	callback = function(args)
		if vim.g.q_close_windows then
			vim.g.q_close_windows[args.buf] = nil
		end
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	desc = "Help on vertical split",
	group = group("help-vert-split", {}),
	callback = function(args)
		if vim.bo[args.buf].buftype == "help" or vim.bo[args.buf].filetype == "man" then
			vim.cmd.wincmd("L")
		end
	end,
})

vim.api.nvim_create_autocmd("ModeChanged", {
	pattern = "*:t",
	desc = "Terminal mode config",
	group = group("terminal-config", { clear = false }),
	callback = function()
		vim.api.nvim_set_option_value("cursorline", false, { scope = "local" })
		vim.api.nvim_set_option_value("signcolumn", "no", { scope = "local" })
	end,
})

vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost", "LspAttach" }, {
	desc = "Refresh code lens",
	group = group("codelens", {}),
	callback = vim.lsp.codelens.refresh,
})

-- vim.api.nvim_create_autocmd("ColorScheme", {
-- 	pattern = "moonfly",
-- 	desc = "Custom highlights for moonfly colorscheme",
-- 	group = group("custom-highlight", {}),
-- 	callback = function()
-- 		vim.api.nvim_set_hl(0, "SnacksIndent", { fg = "#262626" })
-- 		vim.api.nvim_set_hl(0, "Comment", { fg = "#626262" })
-- 	end,
-- })
