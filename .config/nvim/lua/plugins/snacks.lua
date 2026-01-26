return {
	"folke/snacks.nvim",
	priority = 1000,
	lazy = false,
	---@module "snacks"
	---@type snacks.Config
	opts = {
		bigfile = { enabled = true },
		indent = { enabled = true, animate = { enabled = false } },
		input = { enabled = true },
		notifier = { enabled = true },
		quickfile = { enabled = true },
		scope = { enabled = true },
		words = {
			enabled = true,
			modes = { "n" },
			debounce = 500,
		},
		picker = {
			enabled = true,
			matcher = {
				frecency = true,
			},
			formatters = {
				file = {
					filename_first = true,
				},
			},
			win = {
				input = {
					keys = {
						["<C-c>"] = { "close", mode = { "n", "i" } },
						["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "n", "i" } },
						["<C-f>"] = { "list_scroll_down", mode = { "n", "i" } },
						["<C-b>"] = { "list_scroll_up", mode = { "n", "i" } },
					},
				},
				list = {
					keys = {
						["<C-c>"] = { "close", mode = { "n", "i" } },
						["<C-d>"] = { "preview_scroll_down", mode = { "n", "i" } },
						["<C-u>"] = { "preview_scroll_up", mode = { "n", "i" } },
						["<C-f>"] = { "list_scroll_down", mode = { "n", "i" } },
						["<C-b>"] = { "list_scroll_up", mode = { "n", "i" } },
					},
				},
			},
		},
	},
	-- stylua: ignore
	keys = {
		{ "<leader>bd", function() Snacks.bufdelete() end, desc = "Delete buffer" },
		{ "<leader>bD", function() Snacks.bufdelete.other() end, desc = "Delete other buffers" },
		{ "<leader>.", function() Snacks.scratch() end, desc = "Toggle scratch buffer" },
		{ "<leader>S", function() Snacks.scratch.select() end, desc = "Select scratch buffer" },
		{ "<A-n>", function() Snacks.words.jump(1) end, desc = "Jump to next reference" },
		{ "<A-p>", function() Snacks.words.jump(-1) end, desc = "Jump to previous reference" },
		-- picker
		{
			"<leader><space>",
			function()
				Snacks.picker.smart({ layout = { fullscreen = true } })
			end,
			desc = "Smart find files",
		},
		{
			"<leader>ff",
			function()
				Snacks.picker.files({ layout = { fullscreen = true } })
			end,
			desc = "Find files",
		},
		{
			"<leader>fr",
			function()
				Snacks.picker.recent({ layout = { fullscreen = true } })
			end,
			desc = "Recent files",
		},
		{
			"<leader>fc",
			function()
				Snacks.picker.files({ cwd = vim.fn.stdpath("config"), layout = { fullscreen = true }  })
			end,
			desc = "Config files",
		},
		{
			"<leader>f.",
			function()
				Snacks.picker.files({ cwd = vim.fn.expand("%:p:h"), layout = { fullscreen = true }  })
			end,
			desc = "Current buffer files",
		},
		{
			"<leader>,",
			function()
				Snacks.picker.buffers({ layout = { fullscreen = true } })
			end,
			desc = "Buffers",
		},
		{
			"<leader>/",
			function()
				Snacks.picker.grep({ layout = { fullscreen = true } })
			end,
			desc = "Grep",
		},
		{
			"<leader>:",
			function()
				Snacks.picker.command_history()
			end,
			desc = "Command history",
		},
		{
			"<leader>?",
			function()
				Snacks.picker.search_history()
			end,
			desc = "Search History",
		},
		{
			"<leader>n",
			function()
				Snacks.picker.notifications({ layout = { fullscreen = true } })
			end,
			desc = "Notification history",
		},
		{
			"<leader>fp",
			function()
				Snacks.picker.projects({ layout = { fullscreen = true } })
			end,
			desc = "Projects",
		},
		{
			"<leader>gb",
			function()
				Snacks.picker.git_branches()
			end,
			desc = "Git branches",
		},
		{
			"<leader>gl",
			function()
				Snacks.picker.git_log()
			end,
			desc = "Git log",
		},
		{
			"<leader>gL",
			function()
				Snacks.picker.git_log_line()
			end,
			desc = "Git log Line",
		},
		{
			"<leader>gs",
			function()
				Snacks.picker.git_status()
			end,
			desc = "Git status",
		},
		{
			"<leader>gS",
			function()
				Snacks.picker.git_stash()
			end,
			desc = "Git stash",
		},
		{
			"<leader>gd",
			function()
				Snacks.picker.git_diff()
			end,
			desc = "Git diff",
		},
		{
			"<leader>gf",
			function()
				Snacks.picker.git_files()
			end,
			desc = "Git files",
		},
		-- { "<leader>gi", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues (open)" },
		-- { "<leader>gI", function() Snacks.picker.gh_issue({ state = "all" }) end, desc = "GitHub Issues (all)" },
		-- { "<leader>gp", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests (open)" },
		-- { "<leader>gP", function() Snacks.picker.gh_pr({ state = "all" }) end, desc = "GitHub Pull Requests (all)" },
		{
			"<leader>sb",
			function()
				Snacks.picker.grep_buffers({ layout = { fullscreen = true } })
			end,
			desc = "Grep Open buffers",
		},
		{
			"<leader>sw",
			function()
				Snacks.picker.grep_word({ layout = { fullscreen = true } })
			end,
			desc = "Grep visual selection or word",
			mode = { "n", "x" },
		},
		{
			'<leader>s"',
			function()
				Snacks.picker.registers({ layout = { fullscreen = true } })
			end,
			desc = "Registers",
		},
		{
			"<leader>sa",
			function()
				Snacks.picker.autocmds({ layout = { fullscreen = true } })
			end,
			desc = "Autocmds",
		},
		{
			"<leader>sB",
			function()
			Snacks.picker.lines()
			end,
			desc = "Buffer lines",
		},
		{
			"<leader>sc",
			function()
				Snacks.picker.commands({ layout = { fullscreen = true } })
			end,
			desc = "Commands",
		},
		{
			"<leader>sd",
			function()
				Snacks.picker.diagnostics({ layout = { fullscreen = true } })
			end,
			desc = "Diagnostics",
		},
		{
			"<leader>sD",
			function()
				Snacks.picker.diagnostics_buffer({ layout = { fullscreen = true } })
			end,
			desc = "Buffer diagnostics",
		},
		{
			"<leader>sh",
			function()
				Snacks.picker.help({ layout = { fullscreen = true } })
			end,
			desc = "Help tags",
		},
		{
			"<leader>sH",
			function()
				Snacks.picker.highlights({ layout = { fullscreen = true } })
			end,
			desc = "Highlights",
		},
		{
			"<leader>si",
			function()
				Snacks.picker.icons()
			end,
			desc = "Icons",
		},
		{
			"<leader>sj",
			function()
				Snacks.picker.jumps({ layout = { fullscreen = true } })
			end,
			desc = "Jumps",
		},
		{
			"<leader>sk",
			function()
				Snacks.picker.keymaps({ layout = { fullscreen = true } })
			end,
			desc = "Keymaps",
		},
		{
			"<leader>sl",
			function()
				Snacks.picker.loclist({ layout = { fullscreen = true } })
			end,
			desc = "Location List",
		},
		{
			"<leader>sm",
			function()
				Snacks.picker.marks({ layout = { fullscreen = true } })
			end,
			desc = "Marks",
		},
		{
			"<leader>sM",
			function()
				Snacks.picker.man({ layout = { fullscreen = true } })
			end,
			desc = "Man Pages",
		},
		{
			"<leader>sp",
			function()
				Snacks.picker.lazy({ layout = { fullscreen = true } })
			end,
			desc = "Search for plugin spec",
		},
		{
			"<leader>sq",
			function()
				Snacks.picker.qflist({ layout = { fullscreen = true } })
			end,
			desc = "Quickfix list",
		},
		{
			"<leader>sR",
			function()
				Snacks.picker.resume()
			end,
			desc = "Resume",
		},
		{
			"<leader>su",
			function()
				Snacks.picker.undo({ layout = { fullscreen = true } })
			end,
			desc = "Undo history",
		},
		{
			"<leader>sC",
			function()
				Snacks.picker.colorschemes()
			end,
			desc = "Colorschemes",
		},
	},
}
