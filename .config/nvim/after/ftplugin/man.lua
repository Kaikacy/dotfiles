local function map(mode, lhs, rhs, opts)
	if opts then
		opts.buffer = 0
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "n", "x" }, "q", "<cmd>q<cr>", { nowait = true })

-- search for other man pages in visible buffer (similar to sway(5))
map("n", "<cr>", function()
	vim.fn.search([[\l\+(\d\(.\|\))]], "", vim.fn.line("w$"))
end, { desc = "Search manReference forward" })
map("n", "<S-cr>", function()
	vim.fn.search([[\l\+(\d\(.\|\))]], "b", vim.fn.line("w0"))
end, { desc = "Search manReference backward" })
