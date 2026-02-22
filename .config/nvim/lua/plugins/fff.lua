return {
	"dmtrKovalenko/fff.nvim",
	build = function()
		require("fff.download").download_or_build_binary()
	end,
	opts = {
		prompt = "> ",
		layout = {
			width = 0.95,
			height = 0.9,
			prompt_position = "top",
		},
		preview = {
			wrap_lines = true,
			line_numbers = true,
		},
		keymaps = {
			close = "<C-c>",
			focus_list = "<A-l>",
			focus_preview = "<A-p>",
		},
		hl = {
			border = "Whitespace",
			matched = "PmenuMatch",
			scollbar = "PmenuThumb",
			active_file = "CursorLine",
		},
		logging = {
			log_level = "error",
		},
	},
	keys = {
		{
			"<leader>f",
			function()
				require("fff").find_files()
			end,
			desc = "Find files",
		},
		{
			"<leader>c",
			function()
				require("fff").find_files_in_dir(vim.fn.stdpath("config"))
			end,
			desc = "Config files",
		},
		{
			"<leader>/",
			function()
				require("fff").live_grep()
			end,
			desc = "Live grep",
		},
		{
			"<leader>g",
			function()
				require("fff").find_in_git_root()
			end,
			desc = "Find in git root",
		},
		{
			"<leader>sw",
			function()
				require("fff").live_grep({ query = vim.fn.expand("<cword>") })
			end,
			desc = "Search current word",
		},
	},
}
