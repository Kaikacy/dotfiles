local state = {
	diagnostic_count = {},
	lsp_client_names = {},
	statusline_buf = nil,
	statusline_win = nil,
	statusline_is_active = false,
	diagnostic_signs = {
		[vim.diagnostic.severity.ERROR] = { "E", "User2" },
		[vim.diagnostic.severity.WARN] = { "W", "User3" },
		[vim.diagnostic.severity.INFO] = { "I", "User4" },
		[vim.diagnostic.severity.HINT] = { "H", "User5" },
	},
}

vim.api.nvim_create_autocmd("Colorscheme", {
	desc = "Set statusline highlights",
	group = vim.api.nvim_create_augroup("statusline-highlights", {}),
	callback = function()
		vim.api.nvim_set_hl(0, "User2", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticError" }).fg }) -- error
		vim.api.nvim_set_hl(0, "User3", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticWarn" }).fg }) -- warning
		vim.api.nvim_set_hl(0, "User4", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticInfo" }).fg }) -- info
		vim.api.nvim_set_hl(0, "User5", { fg = vim.api.nvim_get_hl(0, { name = "DiagnosticHint" }).fg }) -- hint
		vim.api.nvim_set_hl(0, "User6", { fg = vim.api.nvim_get_hl(0, { name = "Special" }).fg }) -- git branch
	end,
})

vim.api.nvim_create_autocmd("DiagnosticChanged", {
	group = vim.api.nvim_create_augroup("statusline-diagnostics", {}),
	callback = vim.schedule_wrap(function(args)
		if vim.fn.mode() == "i" then
			return
		end
		state.diagnostic_count[args.buf] = vim.api.nvim_buf_is_valid(args.buf) and vim.diagnostic.count(args.buf or 0)
		vim.cmd("redrawstatus")
	end),
})

vim.api.nvim_create_autocmd({ "LspAttach", "LspDetach" }, {
	group = vim.api.nvim_create_augroup("statusline-lsp", {}),
	callback = vim.schedule_wrap(function(args)
		state.lsp_client_names[args.buf] = vim.tbl_map(function(client)
			return client.name
		end, vim.lsp.get_clients({ bufnr = args.buf }))
		vim.cmd("redrawstatus")
	end),
})

local function with_hl(str, hl, hl_nc)
	if not str or str == "" then
		return ""
	end
	if state.statusline_is_active then
		return "%#" .. hl .. "#" .. str .. "%#StatusLine#"
	else
		return "%#" .. (hl_nc or "StatusLineNC") .. "#" .. str .. "%#StatusLineNC#"
	end
end

local function diagnostics()
	local diagnostic_count = state.diagnostic_count[state.statusline_buf]
	if diagnostic_count == nil then
		return ""
	end
	local out = ""
	for severity, count in pairs(diagnostic_count) do
		if count > 0 then
			local fmt = ("%s%d"):format(state.diagnostic_signs[severity][1], count)
			out = out .. with_hl(fmt, state.diagnostic_signs[severity][2])
		end
	end
	return out ~= "" and (" " .. out) or ""
end

local function git_status()
	local git_info = vim.b[state.statusline_buf].gitsigns_status_dict
	if git_info == nil then
		return ""
	end
	local out = ""
	local head = with_hl(git_info.head, "User6")
	local added = (git_info.added and git_info.added > 0) and with_hl("+" .. git_info.added, "Added") or ""
	local changed = (git_info.changed and git_info.changed > 0) and with_hl("~" .. git_info.changed, "Changed") or ""
	local removed = (git_info.removed and git_info.removed > 0) and with_hl("-" .. git_info.removed, "Removed") or ""
	local changes = ("%s%s%s"):format(added, removed, changed)
	out = out .. ("%s%s"):format(head, changes == "" and "" or " " .. changes)
	-- idk if this can be empty
	return out ~= "" and (" " .. out) or ""
end

local function lsp_status()
	local client_names = state.lsp_client_names[state.statusline_buf]
	if client_names == nil or client_names == 0 then
		return ""
	end
	local out = "["
	for i, name in ipairs(client_names) do
		out = out .. name .. (i ~= #client_names and ", " or "")
	end
	return out .. "]"
end

local function filepath()
	local filename = vim.api.nvim_buf_get_name(state.statusline_buf)
	if filename == "" then
		return " [No name]"
	end
	return " " .. vim.fn.fnamemodify(filename, ":~:.")
end

function MyStatusline()
	state.statusline_win = vim.g.statusline_winid
	state.statusline_buf = vim.api.nvim_win_get_buf(state.statusline_win)
	state.statusline_is_active = vim.g.statusline_winid == vim.api.nvim_get_current_win()
	return "%y"
		.. git_status()
		.. "%<"
		.. filepath()
		.. "%<%w%q %m%r%="
		.. diagnostics()
		.. " "
		.. lsp_status()
		.. " %15.(%3c,%l/%L%)"
end

vim.o.statusline = "%!v:lua.MyStatusline()"
