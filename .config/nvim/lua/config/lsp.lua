vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		current_line = true,
		prefix = "*",
		source = "if_many",
	},
	float = {
		source = "if_many",
	},
})

-- servers
vim.lsp.enable({
	"lua_ls",
	"clangd",
	"rust_analyzer",
	"zls",
})

-- inlay hints
vim.keymap.set("n", "<leader>li", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { desc = "Toggle lsp inlay hints" })

local function group(clear)
	vim.api.nvim_create_augroup("user-lsp", { clear = clear })
end

vim.api.nvim_create_autocmd("LspAttach", {
	group = group(),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))
		local map = function(mode, lhs, rhs, opts)
			if opts then
				opts.buffer = opts.buffer or args.buf
			end
			vim.keymap.set(mode, lhs, rhs, opts)
		end

        -- Some default keymaps are already set
        -- stylua: ignore start
        map('n', "gd", function() vim.lsp.buf.definition() end, { desc = "Lsp definition" })
        map('n', "gD", function() vim.lsp.buf.declaration() end, { desc = "Lsp declaration" })
        map('n', "grI", function() vim.lsp.buf.incoming_calls() end, { desc = "Lsp incoming calls" })
        map('n', "grO", function() vim.lsp.buf.outgoing_calls() end, { desc = "Lsp outgoing calls" })
        map('n', "grd", function() vim.diagnostic.setqflist() end, { desc = "Lsp diagnostics" })
		-- stylua: ignore end

		-- formatexpr
		if vim.g.loaded_conform then
			-- don't overrule conform
			-- unlikely to happend as conform loads lazily
			vim.bo[args.buf].formatexpr = "v:lua.require'conform'.formatexpr()"
		end

		-- completions
		-- if client:supports_method("textDocument/completion", args.buf) then
		-- 	map("i", "<C-space>", function()
		-- 		vim.lsp.completion.get()
		-- 	end, { desc = "Trigger completions" })
		-- end

		-- codelens
		if client:supports_method("textDocument/codeLens", args.buf) then
			map("n", "grc", vim.lsp.codelens.run, { desc = "Run codelens" })

			vim.lsp.codelens.refresh({ bufnr = args.buf })
			vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
				group = group(false),
				buffer = args.buf,
				callback = function()
					vim.lsp.codelens.refresh({ bufnr = args.buf })
				end,
			})
		end

		-- document highlights
		if client:supports_method("textDocument/documentHighlight") then
			-- CursorHold is triggered periodically, not just once
			local hl_active = false
			vim.api.nvim_create_autocmd("CursorHold", {
				group = group(false),
				buffer = args.buf,
				callback = function()
					if not hl_active then
						vim.lsp.buf.document_highlight()
						hl_active = true
					end
				end,
			})
			vim.api.nvim_create_autocmd("CursorMoved", {
				group = group(false),
				buffer = args.buf,
				callback = function()
					vim.lsp.buf.clear_references()
					hl_active = false
				end,
			})
		end
	end,
})
