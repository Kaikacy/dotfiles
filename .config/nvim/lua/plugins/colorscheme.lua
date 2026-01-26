return {
	-- TODO: add new (better) style to lemons.nvim (which will be config option to switch??)
	dir = "~/code/nvim-plugins/Lemons.nvim",
	priority = 1000,
	lazy = false,
	config = function()
		require("lemons").setup({
			lighter_float = true,
			hls_override = function(c)
				return {
					SnacksPicker = { link = "Normal" },
					SnacksPickerBorder = { bg = c.black, fg = c.gray },
				}
			end,
		})
		vim.cmd("colorscheme lemons")
	end,
}
