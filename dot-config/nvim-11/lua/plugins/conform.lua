return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
	config = function()
		---@type conform.setupOpts
		require("conform").setup({
			notify_on_error = true,
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang-format" },
				cpp = { "clang-format" },
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
			format_after_save = function(bufnr)
				if vim.g.format_on_save_disable or vim.b[bufnr].format_on_save_disable then
					return
				else
					return { timeout_ms = 700 }
				end
			end,
			formatters = {
				["clang-format"] = {
					append_args = { "--fallback-style", "none" },
				},
			},
		})

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.format_on_save_disable = true
			else
				vim.g.format_on_save_disable = true
			end
		end, {
			bang = true,
			desc = "Disable format-on-save",
		})

		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.format_on_save_disable = false
			vim.g.format_on_save_disable = false
		end, {
			desc = "Enable format-on-save",
		})
	end,
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
		vim.g.loaded_conform = true
	end,
}
