return {
	"stevearc/conform.nvim",
	dependencies = { "williamboman/mason.nvim" },
	event = "BufWritePre",
	cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
	keys = {
		{
			mode = { "n", "v" },
			"<leader>lf",
			function()
				require("conform").format({ async = true })
			end,
			desc = "Format file or range",
		},
	},
	config = function()
		local conform = require("conform")
		conform.setup({
			notify_on_error = true,
			format_after_save = function(bufnr)
				if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
					return
				end
				return { timeout_ms = 1000, lsp_format = "fallback" }
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				c = { "clang_format" },
				cpp = { "clang_format" },
				jsonc = { "prettierd" },
				json = { "prettierd" },
			},
		})
		conform.formatters.clang_format = { args = { "--style", "{IndentWidth: " .. vim.o.tabstop .. "}" } }

		vim.api.nvim_create_user_command("FormatDisable", function(args)
			if args.bang then
				vim.b.disable_autoformat = true
			else
				vim.g.disable_autoformat = true
			end
		end, {
			desc = "Disable format-on-save",
			bang = true,
		})
		vim.api.nvim_create_user_command("FormatEnable", function()
			vim.b.disable_autoformat = false
			vim.g.disable_autoformat = false
		end, {
			desc = "Enable format-on-save",
		})
	end,
}
