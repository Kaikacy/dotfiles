local opts = {
	fullscreen = false,
	width = 0.8,
	height = 0.75,
	border = "single",
}

local function get_win_config()
	local config = {}
	if opts.fullscreen then
		config = {
			width = vim.o.columns,
			height = vim.o.lines - 1, -- for statusline
			col = 0,
			row = 0,
			border = "none",
		}
	else
		local width = math.floor(vim.o.columns * opts.width)
		local height = math.floor(vim.o.lines * opts.height)
		local col = math.floor((vim.o.columns - width) * 0.5)
		local row = math.floor((vim.o.lines - height) * 0.5)
		config = {
			width = width,
			height = height,
			col = col,
			row = row,
			border = opts.border,
		}
	end
	config.relative = "editor"
	return config
end

local state = {
	win = -1,
	buf = -1,
	config = get_win_config(),
}

vim.api.nvim_create_autocmd("VimResized", {
	group = vim.api.nvim_create_augroup("scratchpad-resize", {}),
	callback = function()
		state.config = get_win_config()
	end,
})

local function map(lhs, rhs, desc)
	vim.keymap.set("n", lhs, rhs, { buffer = vim.buf, desc = desc })
end

local M = {}

function M.toggle()
	if not vim.api.nvim_buf_is_valid(state.buf) then
		state.buf = vim.api.nvim_create_buf(false, true)
		vim.bo[state.buf].filetype = "lua"
		map("q", "<cmd>hide<cr>")
		map("<cr>", "<cmd>source<cr>")
	end

	if not vim.api.nvim_win_is_valid(state.win) then
		state.win = vim.api.nvim_open_win(state.buf, true, state.config)
		vim.wo[state.win].winhighlight = "NormalFloat:Normal,FloatBorder:Whitespace"
	else
		vim.api.nvim_win_hide(state.win)
		return
	end
end

return M
