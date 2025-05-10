return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	enabled = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	cmd = "Telescope",
	keys = {
		{
			"<leader>ff",
			"<cmd>Telescope find_files<cr>",
			desc = "Files",
		},
		{
			"<leader>fo",
			"<cmd>Telescope oldfiles<cr>",
			desc = "Oldfiles",
		},
		{
			"<leader>fh",
			"<cmd>Telescope help_tags<cr>",
			desc = "Help",
		},
		{
			"<leader>fk",
			"<cmd>Telescope keymaps<cr>",
			desc = "Keymaps",
		},
		{
			"<leader>fb",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true ignore_current_buffer=true<cr>",
			desc = "Buffers",
		},
		{
			"<leader><leader>",
			"<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
			desc = "Switch buffer",
		},
		{
			"<leader>fg",
			"<cmd>Telescope live_grep<cr>",
			desc = "Live grep",
		},
		{
			"<leader>fw",
			"<cmd>Telescope grep_string<cr>",
			desc = "Grep string",
		},
		{
			"<leader>fG",
			"<cmd>Telescope git_files<cr>",
			desc = "Git files",
		},
		{
			"<leader>fd",
			"<cmd>Telescope diagnostics<cr>",
			desc = "Diagnostics",
		},
		{
			"<leader>fc",
			function()
				require("telescope.builtin").find_files({ cwd = vim.fn.stdpath("config") })
			end,
			desc = "Config",
		},
		{
			"<leader>/",
			function()
				require("telescope.builtin").current_buffer_fuzzy_find(
					require("telescope.themes").get_dropdown({ previewer = false })
				)
			end,
			desc = "Fuzzy find",
		},
	},
	config = function()
		local telescope = require("telescope")
		local action = require("telescope.actions")
		telescope.setup({
			defaults = {
				mappings = {
					i = {
						["<esc>"] = action.close,
						["<C-j>"] = action.move_selection_next,
						["<C-k>"] = action.move_selection_previous,
					},
				},
			},
		})
		telescope.load_extension("fzf")
	end,
}
