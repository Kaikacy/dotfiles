return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"saghen/blink.cmp",
	},
	config = function()
		local lsp = require("lspconfig")

		vim.diagnostic.config({
			severity_sort = true,
			virtual_text = { current_line = true },
		})

		local servers = {
			fish_lsp = {},
		}
		local capabilities = vim.lsp.protocol.make_client_capabilities()
		for name, opts in pairs(servers) do
			opts.capabilities = opts.capabilities or capabilities
			lsp[name].setup(opts)
		end

		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("user-lsp-config", {}),
			callback = function(args)
				local map = function(mode, lhs, rhs, desc, opts)
					opts = opts or {}
					opts.buffer = args.buf
					opts.desc = desc
					vim.keymap.set(mode, lhs, rhs, opts)
				end

				map("n", "K", function()
					vim.lsp.buf.hover({ border = "rounded", max_width = vim.fn.floor(vim.o.columns * 0.7) })
				end, "Hover doc")
				map("n", "gd", function()
					Snacks.picker.lsp_definitions()
				end, "Goto definition")
				map("n", "gD", function()
					Snacks.picker.lsp_declarations()
				end, "Goto declaration")
				map("n", "gI", function()
					Snacks.picker.lsp_implementations()
				end, "Goto implementation")
				map("n", "gr", function()
					Snacks.picker.lsp_references()
				end, "Symbol references", { nowait = true })
				map("n", "gy", function()
					Snacks.picker.lsp_type_definitions()
				end, "Goto type definition")
				map({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, "Code actions")
				map("n", "<leader>lr", vim.lsp.buf.rename, "Rename symbol")
			end,
		})
	end,
}
