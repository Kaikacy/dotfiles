-- Code taken from folke/snacks.nvim bufdelete

local M = {}

---@param buf integer
function M.buffer(buf)
	buf = buf == 0 and vim.api.nvim_get_current_buf() or buf

	-- Most recent listed buffer to switch to
	local info = vim.fn.getbufinfo({ buflisted = 1 })
	for i = #info, 1, -1 do
		if info[i].bufnr == buf then
			table.remove(info, i)
			break
		end
	end
	-- Newest to oldest
	table.sort(info, function(a, b)
		return a.lastused > b.lastused
	end)
	local new_buf = info[1] and info[1].bufnr or vim.api.nvim_create_buf(true, false)

	-- Replace deleted buffer in all windows showing it with alternate if possible
	for _, win in ipairs(vim.fn.win_findbuf(buf)) do
		local win_buf = new_buf
		vim.api.nvim_win_call(win, function()
			local alt = vim.fn.bufnr("#")
			win_buf = alt >= 0 and alt ~= buf and vim.bo[alt].buflisted and alt or win_buf
		end)
		vim.api.nvim_win_set_buf(win, win_buf)
	end

	if vim.api.nvim_buf_is_valid(buf) then
		vim.cmd("bdelete" .. buf)
	end
end

function M.current()
	M.buffer(0)
end

function M.others()
	for _, buf in ipairs(vim.api.nvim_list_bufs()) do
		if vim.bo[buf].buflisted then
			M.buffer(buf)
		end
	end
end

return M
