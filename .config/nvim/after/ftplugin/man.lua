local function map(mode, lhs, rhs, opts)
	if opts then
		opts.buffer = 0
	end
	vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "n", "x" }, "q", "<cmd>q<cr>", { nowait = true })

-- regex for man references (similar to git-push(1))
local man_ref_regex = [[[a-z-]\+(\d\(.\|\))]]

-- search for other man pages in visible buffer (similar to sway(5))
map("n", "<cr>", function()
	vim.fn.search(man_ref_regex, "", vim.fn.line("w$"))
end, { desc = "Search manReference forward" })
map("n", "<S-cr>", function()
	vim.fn.search(man_ref_regex, "b", vim.fn.line("w0"))
end, { desc = "Search manReference backward" })
