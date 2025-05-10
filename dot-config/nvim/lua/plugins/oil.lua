return {
	"stevearc/oil.nvim",
	dependencies = { "echasnovski/mini.icons" },
	lazy = false,
	keys = {
		{ "<leader>e", "<cmd>Oil<cr>", desc = "Oil" },
		{ "<leader>E", "<cmd>Oil --float<cr>", desc = "Oil float" },
	},
	opts = {
		delete_to_trash = true,
		skip_confirm_for_simple_edits = true,
		view_option = {
			show_hidden = true,
		},
		keymaps = {
			["<bs>"] = { "actions.parent", mode = "n" },
		},
	},
}
