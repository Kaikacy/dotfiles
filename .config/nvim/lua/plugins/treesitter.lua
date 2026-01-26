return {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local languages = {
			"lua",
			"vimdoc",
		}

		local ts = require("nvim-treesitter")

		ts.install(languages, { summery = true })

		local function setup_treesitter()
			vim.treesitter.start()
			vim.wo[0][0].foldmethod = "expr"
			vim.wo[0][0].foldexpr = "v:lua.vim.treesitter.foldexpr()"
			-- experimental
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end

		local group = function(clear)
			vim.api.nvim_create_augroup("user-treesitter", { clear = clear })
		end

		vim.api.nvim_create_autocmd("FileType", {
			desc = "Setup treesitter for each filetype",
			-- TODO: ?? match all filetypes that have parser installed with vim.treesitter.language.get_filetypes
			pattern = languages,
			group = group(),
			callback = function()
				setup_treesitter()
			end,
		})

		vim.api.nvim_create_autocmd("BufWinEnter", {
			desc = "Install treesitter parser for filetype",
			group = group(false),
			callback = function(args)
				local ft = vim.api.nvim_get_option_value("filetype", { buf = args.buf })
				local lang = vim.treesitter.language.get_lang(ft)
				local is_installed = vim.list_contains(ts.get_installed(), lang)

				if is_installed then
					setup_treesitter()
					return
				end

				-- get_lang returns ft as a fallback if lang isn't registered, so check is necessary
				if vim.list_contains(ts.get_available(), lang) then
					vim.schedule(function()
						-- TODO: add 'no, don't ask again' and 'yes, only this time' choices
						vim.ui.select({ "Yes", "No" }, {
							prompt = ("No treesitter parser found for filetype '%s'. Install '%s'?"):format(ft, lang),
						}, function(item)
							if item == "Yes" then
								-- wait is required as install is async so setup_treesitter fails
								ts.install(lang):wait(120000) -- max 2 minutes
								setup_treesitter()
							end
						end)
					end)
				end
			end,
		})
	end,
}
