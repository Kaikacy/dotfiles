return {
	{
		"stevearc/oil.nvim",
		dependencies = { "nvim-mini/mini.icons" },
		keys = {
			{ "<leader>e", "<cmd>Oil<cr>" },
			{
				"<leader>E",
				function()
					vim.cmd("Oil " .. vim.fn.stdpath("config"))
				end,
			},
		},
		config = function()
			local oil = require("oil")
			local details = true
			oil.setup({
				delete_to_trash = true,
				skip_confirm_for_simple_edits = true,
				constrain_cursor = "name",
				columns = {
					"permissions",
					"size",
					"mtime",
					"icon",
				},
				win_options = {
					signcolumn = "yes:2",
				},
				view_options = {
					show_hidden = true,
				},
				keymaps = {
					["<bs>"] = { "actions.parent", mode = "n" },
					["gd"] = {
						desc = "Toggle detail view",
						callback = function()
							details = not details
							if details then
								oil.set_columns({ "permissions", "size", "mtime", "icon" })
							else
								oil.set_columns({ "icon" })
							end
						end,
					},
				},
			})

			-- smart file rename with lsp integration, uses Snacks.rename
			vim.api.nvim_create_autocmd("User", {
				pattern = "OilActionsPost",
				callback = function(event)
					if event.data.actions[1] and event.data.actions[1].type == "move" then
						Snacks.rename.on_rename_file(event.data.actions[1].src_url, event.data.actions[1].dest_url)
					end
				end,
			})
		end,
	},
	{
		"refractalize/oil-git-status.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {},
	},
	{
		"JezerM/oil-lsp-diagnostics.nvim",
		dependencies = { "stevearc/oil.nvim" },
		opts = {
			diagnostic_symbols = {
				error = "E",
				warn = "W",
				info = "I",
				hint = "H",
			},
		},
	},
}
