return {
	"MagicDuck/grug-far.nvim",
	keys = {
		{
			"<leader>ss",
			function()
				require("grug-far").open()
			end,
			desc = "Search/Replace workspace",
		},
		{
			"<leader>sW",
			function()
				require("grug-far").open({ prefills = { search = vim.fn.expand("<cword>") } })
			end,
			desc = "Replace current word",
		},
		{
			"<leader>sf",
			function()
				require("grug-far").open({ prefills = { paths = vim.fn.expand("%") } })
			end,
			desc = "Search/Replace file",
		},
		{
			"<leader>se",
			function()
				require("grug-far").open({ prefills = { filesFilter = "*." .. vim.fn.expand("%:e") } })
			end,
			desc = "Search/Replace filetype",
		},
	},
	config = function()
		local grug_far = require("grug-far")
		grug_far.setup({
			keymaps = {
				close = { n = "q" },
			},
		})
	end,
}
