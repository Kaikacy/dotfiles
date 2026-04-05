return {
	"nvim-mini/mini.test",
	ft = "lua",
	opts = {},
	keys = {
		{
			"<leader>tf",
			function()
				MiniTest.run_file()
			end,
			desc = "Run tests in current buffer",
		},
		{
			"<leader>tl",
			function()
				MiniTest.run_at_location()
			end,
			desc = "Run test at cursor location",
		},
	},
}
