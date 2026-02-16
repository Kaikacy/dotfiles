---@module "snacks"

vim.diagnostic.config({
	severity_sort = true,
	virtual_text = {
		current_line = true,
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
})

-- inlay hints
vim.keymap.set("n", "<leader>li", function()
	Snacks.toggle.inlay_hints()
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

        -- stylua: ignore start
        map('n', "gd", function() Snacks.picker.lsp_definitions() end, { desc = "Lsp definition" })
        map('n', "gD", function() Snacks.picker.lsp_declarations() end, { desc = "Lsp declaration" })
        map('n', "grr", function() Snacks.picker.lsp_references() end, { desc = "Lsp references" })
        map('n', "gri", function() Snacks.picker.lsp_implementations() end, { desc = "Lsp implementation" })
        map('n', "grt", function() Snacks.picker.lsp_type_definitions() end, { desc = "Lsp type definition" })
        map('n', "gO", function() Snacks.picker.lsp_symbols() end, { desc = "Lsp document symbols" })
        map('n', "grI", function() Snacks.picker.lsp_incoming_calls() end, { desc = "Lsp incoming calls" })
        map('n', "grO", function() Snacks.picker.lsp_outgoing_calls() end, { desc = "Lsp outgoing calls" })
        map('n', "grd", function() Snacks.picker.diagnostics() end, { desc = "Lsp diagnostics" })
        map('n', "grD", function() Snacks.picker.diagnostics_buffer() end, { desc = "Lsp buffer diagnostics" })
		-- stylua: ignore end

		-- formatexpr
		if vim.g.loaded_conform then
			-- don't overrule conform
			-- unlikely to happend as conform loads lazily
			vim.bo[args.buf].formatexpr = "v:lua.require'conform'.formatexpr()"
		end

		-- completions
		if client:supports_method("textDocument/completion", args.buf) then
			map("i", "<C-space>", function()
				vim.lsp.completion.get()
			end, { desc = "Trigger completions" })
		end

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
		-- if client:supports_method("textDocument/documentHighlight") then
		--     vim.api.nvim_create_autocmd("CursorHold", {
		--         group = vim.api.nvim_create_augroup("user-lsp", { clear = false }),
		--         buffer = args.buf,
		--         callback = vim.lsp.buf.document_highlight,
		--     })
		--     vim.api.nvim_create_autocmd("CursorMoved", {
		--         group = vim.api.nvim_create_augroup("user-lsp", { clear = false }),
		--         buffer = args.buf,
		--         callback = vim.lsp.buf.clear_references,
		--     })
		-- end
	end,
})
