return {
	{
		"nvim-treesitter/nvim-treesitter",
		branch = "master",
		build = ":TSUpdate",
		event = { "BufReadPre", "BufNewFile" },
		cmd = {
			"TSBufDisable",
			"TSBufEnable",
			"TSBufToggle",
			"TSDisable",
			"TSEnable",
			"TSToggle",
			"TSInstall",
			"TSInstallInfo",
			"TSInstallSync",
			"TSModuleInfo",
			"TSUninstall",
			"TSUpdate",
			"TSUpdateSync",
		},
		keys = {
			{ "<C-space>", desc = "Increment selection" },
			{ "<BS>", desc = "Decrement selection", mode = "x" },
			{ ";", mode = { "n", "x", "o" } },
			{ ",", mode = { "n", "x", "o" } },
			{ "f", mode = { "n", "x", "o" } },
			{ "F", mode = { "n", "x", "o" } },
			{ "t", mode = { "n", "x", "o" } },
			{ "T", mode = { "n", "x", "o" } },
		},
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			{
				"nvim-treesitter/nvim-treesitter-context",
				opts = {
					-- this is default, but doesn't work
					enable = true,
				},
			},
		},
		config = function()
			---@diagnostic disable-next-line: missing-fields
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"lua",
					"markdown",
					"markdown_inline",
					"vimdoc",
				},
				auto_install = true,
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = false,
				},
				indent = { enable = true },
				incremental_selection = {
					enable = true,
					keymaps = {
						init_selection = "<C-space>",
						node_incremental = "<C-space>",
						scope_incremental = false,
						node_decremental = "<bs>",
					},
				},
				textobjects = {
					move = {
						enable = true,
						set_jumps = true,
						goto_next_start = {
							["]k"] = { query = "@block.outer", desc = "Next block start" },
							["]f"] = { query = "@function.outer", desc = "Next function start" },
							["]c"] = { query = "@class.outer", desc = "Next class start" },
							["]a"] = { query = "@parameter.inner", desc = "Next argument start" },
							["]h"] = { query = "@link", desc = "Next markdown link start" },
						},
						goto_next_end = {
							["]K"] = { query = "@block.outer", desc = "Next block end" },
							["]F"] = { query = "@function.outer", desc = "Next function end" },
							["]C"] = { query = "@class.outer", desc = "Next class end" },
							["]A"] = { query = "@parameter.inner", desc = "Next argument end" },
							["]H"] = { query = "@link", desc = "Next markdown link end" },
						},
						goto_previous_start = {
							["[k"] = { query = "@block.outer", desc = "Previous block start" },
							["[f"] = { query = "@function.outer", desc = "Previous function start" },
							["[c"] = { query = "@class.outer", desc = "Previous class start" },
							["[a"] = { query = "@parameter.inner", desc = "Previous argument start" },
							["[h"] = { query = "@link", desc = "Previous markdown link start" },
						},
						goto_previous_end = {
							["[K"] = { query = "@block.outer", desc = "Previous block end" },
							["[F"] = { query = "@function.outer", desc = "Previous function end" },
							["[C"] = { query = "@class.outer", desc = "Previous class end" },
							["[A"] = { query = "@parameter.inner", desc = "Previous argument end" },
							["[H"] = { query = "@link", desc = "Previous markdown link end" },
						},
					},
					swap = {
						enable = true,
						swap_next = {
							["]<C-k>"] = { query = "@block.outer", desc = "Swap next block" },
							["]<C-f>"] = { query = "@function.outer", desc = "Swap next function" },
							["]<C-c>"] = { query = "@class.outer", desc = "Swap next class" },
							["]<C-a>"] = { query = "@parameter.inner", desc = "Swap next argument" },
						},
						swap_previous = {
							["[<C-k>"] = { query = "@block.outer", desc = "Swap previous block" },
							["[<C-f>"] = { query = "@function.outer", desc = "Swap previous function" },
							["[<C-c>"] = { query = "@class.outer", desc = "Swap previous class" },
							["[<C-a>"] = { query = "@parameter.inner", desc = "Swap previous argument" },
						},
					},
					select = {
						enable = true,
						lookahead = true,
						keymaps = {
							["a="] = { query = "@assignment.outer", desc = "Outer Part of an Assignment" },
							["i="] = { query = "@assignment.inner", desc = "Inner Part of an Assignment" },
							["-l"] = {
								query = "@assignment.lhs",
								desc = "Left Hand Side of an Assignment",
							},
							["-r"] = {
								query = "@assignment.rhs",
								desc = "Right Hand Side of an Assignment",
							},

							["ac"] = { query = "@class.outer", desc = "Outer class" },
							["ic"] = { query = "@class.inner", desc = "Inner class" },

							["af"] = { query = "@function.outer", desc = "Outer function" },
							["if"] = { query = "@function.inner", desc = "Inner function" },

							["am"] = { query = "@call.outer", desc = "Outer function call" },
							["im"] = { query = "@call.inner", desc = "Inner function call" },

							["aa"] = { query = "@parameter.outer", desc = "Outer argument/parameter" },
							["ia"] = { query = "@parameter.inner", desc = "Inner argument/parameter" },

							["al"] = { query = "@loop.outer", desc = "Outer loop" },
							["il"] = { query = "@loop.inner", desc = "Inner loop" },

							["a?"] = { query = "@conditional.outer", desc = "Outer conditional" },
							["i?"] = { query = "@conditional.inner", desc = "Inner conditional" },

							["ag"] = { query = "@comment.outer", desc = "Outer comment" },
							["ig"] = { query = "@comment.inner", desc = "Inner comment" },

							["ar"] = { query = "@return.outer", desc = "Outer return" },
							["ir"] = { query = "@return.inner", desc = "Inner return" },

							["ak"] = { query = "@block.outer", desc = "Outer block" },
							["ik"] = { query = "@block.inner", desc = "Inner block" },

							["n"] = { query = "@number.inner", desc = "Inner number" },

							["S"] = { query = "@statement.outer", desc = "Outer statement" },
						},
					},
				},
			})

			local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
			vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
			vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
			vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
			vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
		end,
	},
}
