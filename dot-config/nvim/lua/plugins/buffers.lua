return {
	dir = "~/Code/other/nvim-plugins/buffers",
	cmd = "BuffersToggle",
	config = function()
		---@module "buffers.nvim"
		---@type buffers.Config
		vim.g.buffers_config = {
			close_keys = { "<Esc>", "<Tab>" },
			border = "rounded",
		}
	end,
}
