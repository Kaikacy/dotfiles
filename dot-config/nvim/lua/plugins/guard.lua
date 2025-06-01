return {
	"nvimdev/guard.nvim",
	dependencies = {
		"nvimdev/guard-collection",
		"williamboman/mason.nvim", -- mason should be loaded first
	},
	event = {
		"BufReadPost",
		"BufNewFile",
	},
	cmd = "Guard",
	config = function()
		local ft = require("guard.filetype")
		ft("lua"):fmt("stylua")
		ft("c,cpp"):fmt("clang-format")
		ft("json"):fmt("clang-format")
		ft("*"):lint("codespell")

		vim.g.guard_config = {
			lsp_as_default_formatter = true,
		}
	end,
}
