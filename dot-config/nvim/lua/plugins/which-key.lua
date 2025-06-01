return {
	"folke/which-key.nvim",
	event = "VeryLazy",
	keys = {
		{
			"<leader>?",
			function()
				require("which-key").show({ global = false })
			end,
			desc = "Buffer local keymaps",
		},
	},
	---@class wk.Opts
	opts = {
		delay = 500,
		spec = {
			{ "<leader>f", group = "Find" },
			{ "<leader>l", group = "LSP" },
			{ "<leader>S", group = "Session" },
			{ "<leader>s", group = "Search/Replace" },
			{ "<leader>b", group = "Buffer" },
			{ "<leader>t", group = "Tab" },
			{ "<leader>x", group = "Quickfix" },
			{ "<leader>d", group = "Debug" },
			{ "<leader>g", group = "Git" },
			{ "gp", group = "Preview" },
		},
		win = {
			no_overlap = true,
		},
	},
}
