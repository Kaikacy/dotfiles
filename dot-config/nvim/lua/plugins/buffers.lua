return {
	dir = "~/Code/other/nvim-plugins/buffers",
	cmd = "BuffersToggle",
	config = function()
		vim.g.buffers_config = {
			close_keys = { "<Esc>", "<Tab>" },
		}
	end,
}
