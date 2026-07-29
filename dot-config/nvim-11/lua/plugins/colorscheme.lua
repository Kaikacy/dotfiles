return {
	{
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
			-- vim.cmd("colorscheme lemons")
		end,
	},
	{
		dir = "~/code/nvim-plugins/seashells.nvim",
		priority = 1000,
		lazy = false,
		config = function()
			vim.g.seashells_float_bg = true
			vim.cmd("colorscheme seashells")
		end,
	},
	{
		"gbprod/nord.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("nord").setup({
				on_highlights = function(hi, c)
					hi.NormalFloat = { bg = c.polar_night.bright }
					hi.FloatBorder = { bg = c.polar_night.bright, fg = c.polar_night.brightest }
				end,
			})
			-- vim.cmd.colorscheme("nord")
		end,
	},
	{
		"NTBBloodbath/doom-one.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.doom_one_italic_comments = true
			vim.g.doom_one_diagnostics_text_color = true
			-- vim.cmd("colorscheme doom-one")
			-- local c = require("doom-one.colors").get_palette("dark")
			-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = c.bg_alt })
		end,
	},
	{
		"armannikoyan/rusty",
		lazy = false,
		priority = 1000,
		config = function()
			-- require("rusty").setup()
			-- vim.cmd("colorscheme rusty")
		end,
	},
}
