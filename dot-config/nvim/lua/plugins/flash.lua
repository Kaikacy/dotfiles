return {
	"folke/flash.nvim",
	event = "VeryLazy",
	-- stylua: ignore
	keys = {
		{ "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
		{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
		{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
		{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
		{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
	},
	---@type Flash.Config
	opts = {
		jump = {
			autojump = true,
		},
		label = {
			rainbow = {
				enabled = false,
			},
		},
		modes = {
			char = {
				enabled = false,
				multi_line = false,
				char_actions = function(motion)
					return {
						[motion:lower()] = "right",
						[motion:upper()] = "left",
					}
				end,
			},
		},
	},
}
