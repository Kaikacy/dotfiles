local group = vim.api.nvim_create_augroup("indent-guides", {})

local function set_guides(sw)
	if sw == 0 then
		sw = vim.o.tabstop
	end
	local char = "│" .. (" "):rep(sw - 1)
	vim.opt_local.listchars:append({ leadmultispace = char })
end

vim.api.nvim_create_autocmd("OptionSet", {
	pattern = "shiftwidth",
	group = group,
	callback = function()
		set_guides(vim.v.option_new)
	end,
})

vim.api.nvim_create_autocmd("BufWinEnter", {
	group = group,
	callback = function(args)
		set_guides(vim.bo[args.buf].shiftwidth)
	end,
})
