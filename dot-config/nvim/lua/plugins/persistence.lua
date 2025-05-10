return {
	"folke/persistence.nvim",
	event = "BufReadPre",
	keys = {
		{
			"<leader>Ss",
			function()
				require("persistence").load()
			end,
			desc = "Load current session",
		},
		{
			"<leader>SS",
			function()
				require("persistence").select()
			end,
			desc = "Select session",
		},
		{
			"<leader>Sl",
			function()
				require("persistence").last({ last = true })
			end,
			desc = "Load last session",
		},
		{
			"<leader>Sq",
			function()
				require("persistence").stop()
			end,
			desc = "Stop saving on exit",
		},
	},
	opts = {},
}
