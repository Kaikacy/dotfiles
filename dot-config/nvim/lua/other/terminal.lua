local defaults = {
	["floating"] = {
		width = 0.9,
		height = 0.8,
		border = "single",
	},
	["vertical"] = {
		width = 0.35,
	},
	["horizontal"] = {
		height = 0.25,
	},
}

---@class terminal_opts
---@field width? number ignored when type is horizontal
---@field height? number ignored when type is vertical
---@field border? 'none'|'single'|'double'|'rounded'|'solid'|'shadow'|string[]

---spawn a new configurable terminal
---@param type "vertical" | "horizontal" | "floating"
---@param opts terminal_opts
---@return function
local function new_terminal(type, opts)
	local state = {
		buf = -1,
		win = -1,
	}

	return function()
		local config = {}

		if type == "vertical" then
			local width = math.floor(vim.o.columns * (opts.width or defaults[type].width))
			config = {
				width = width,
				vertical = true,
			}
		elseif type == "horizontal" then
			local height = math.floor(vim.o.lines * (opts.height or defaults[type].height))
			config = {
				height = height,
				vertical = false,
			}
		else
			local width = math.floor(vim.o.columns * (opts.width or defaults[type].width))
			local height = math.floor(vim.o.lines * (opts.height or defaults[type].height))
			local col = math.floor((vim.o.columns - width) * 0.5)
			local row = math.floor((vim.o.lines - height) * 0.5)

			config = {
				relative = "editor",
				col = col,
				row = row,
				width = width,
				height = height,
				border = opts.border or defaults[type].border,
				style = "minimal",
			}
		end

		local buf = state.buf
		if not vim.api.nvim_buf_is_valid(state.buf) then
			buf = vim.api.nvim_create_buf(false, true)
		end

		if not vim.api.nvim_win_is_valid(state.win) then
			state.win = vim.api.nvim_open_win(buf, true, config)
			vim.cmd.startinsert()
		else
			vim.api.nvim_win_hide(state.win)
			return
		end

		if not vim.api.nvim_buf_is_valid(state.buf) then
			state.buf = buf
			vim.fn.jobstart(vim.o.shell, { term = true })
		end
		vim.wo[state.win].winhighlight = "NormalFloat:Normal"
	end
end

local default_floating = new_terminal("floating", {})
vim.api.nvim_create_user_command("TermToggleFloating", function()
	default_floating()
end, {})
local default_vertical = new_terminal("vertical", {})
vim.api.nvim_create_user_command("TermToggleVertical", function()
	default_vertical()
end, {})
local default_horizontal = new_terminal("horizontal", {})
vim.api.nvim_create_user_command("TermToggleHorizontal", function()
	default_horizontal()
end, {})
