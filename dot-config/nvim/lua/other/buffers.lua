local config = {
	width = 70,
	min_height = 6,
	border = "single",
	chars = "qwertyuiopasdfghjklzxcvbnmQWERTYUIOPASDFGHJKLZXCVBNM1234567890",
}

local state = {
	win = -1,
	buf = -1,
}

---@return integer[]
local get_bufs = function()
	return vim.tbl_filter(function(bufnr)
		return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
	end, vim.api.nvim_list_bufs())
end

local get_buf_table = function()
	local buf_table = {}
	for _, b in ipairs(get_bufs()) do
		local full_name = vim.api.nvim_buf_get_name(b)
		local name = vim.fn.fnamemodify(full_name, ":t")
		if name == "" then
			name = full_name
		end
		local label = name:sub(1, 1)
		local i = 2
		while buf_table[label] or label == "q" or string.find(config.chars, label, 1, true) == nil do
			if i > #name then
				break
			end
			label = name:sub(i, i)
			i = i + 1
		end
		buf_table[label] = b
	end
	return buf_table
end

local function buffers_win()
	local buf_table = get_buf_table()

	local col = vim.o.columns - config.width
	local row = vim.o.lines - config.min_height

	---@type vim.api.keyset.win_config
	local win_opts = {
		relative = "editor",
		width = config.width,
		height = math.max(config.min_height, #buf_table),
		col = col,
		row = row,
		border = config.border,
		style = "minimal",
	}

	local buf = state.buf
	if not vim.api.nvim_buf_is_valid(buf) then
		buf = vim.api.nvim_create_buf(false, true)
		vim.api.nvim_buf_set_name(buf, "Buffers")
		vim.bo[buf].bufhidden = "wipe"
		vim.bo[buf].filetype = "buffers"
		vim.bo[buf].buftype = "nofile"
		state.buf = buf
	end
	local win = state.win
	if not vim.api.nvim_win_is_valid(win) then
		win = vim.api.nvim_open_win(buf, true, win_opts)
		state.win = win
	else
		vim.api.nvim_win_hide(win)
		state.win = -1
		state.buf = -1
		return
	end

	vim.keymap.set("n", "<esc>", function()
		vim.api.nvim_win_hide(win)
	end, { buffer = buf })
	vim.keymap.set("n", "<C-c>", function()
		vim.api.nvim_win_hide(win)
	end, { buffer = buf })

	local i = 0
	for c, b in pairs(buf_table) do
		local name = vim.api.nvim_buf_get_name(b)
		name = vim.fn.fnamemodify(name, ":~:.")
		vim.api.nvim_buf_set_lines(buf, i, i, false, { c .. " | " .. name })
		vim.keymap.set("n", c, function()
			vim.api.nvim_win_hide(win)
			vim.api.nvim_set_current_buf(b)
		end, { buffer = buf, silent = true })
	end
	vim.api.nvim_buf_set_lines(buf, -2, -1, false, {})
	vim.bo[buf].modifiable = false
end

vim.api.nvim_create_user_command("BuffersToggle", function(_)
	buffers_win()
end, {})
