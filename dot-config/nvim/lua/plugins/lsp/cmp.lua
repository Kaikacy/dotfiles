return {
	enabled = false,
	"hrsh7th/nvim-cmp",
	event = { "InsertEnter", "CmdlineEnter" },
	dependencies = {
		"williamboman/mason.nvim",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		{
			"saadparwaiz1/cmp_luasnip",
			dependencies = {
				{
					"L3MON4D3/LuaSnip",
					version = "v2.*",
				},
			},
		},
		{
			"onsails/lspkind.nvim",
			opts = {
				mode = "symbol_text",
				symbol_map = {
					Array = "",
					Boolean = "󰨙",
					Class = "",
					Codeium = "󰘦",
					Color = "",
					Control = "",
					Collapsed = "",
					Constant = "󰏿",
					Constructor = "",
					Enum = "",
					EnumMember = "",
					Event = "",
					Field = "",
					File = "",
					Folder = "",
					Function = "󰊕",
					Interface = "",
					Key = "󰌆",
					Keyword = "󰌋",
					Method = "󰊕",
					Module = "",
					Namespace = "󰦮",
					Null = "",
					Number = "󰎠",
					Object = "",
					Operator = "",
					Package = "",
					Property = "",
					Reference = "",
					Snippet = "",
					String = "",
					Struct = "󰆼",
					Text = "󰉿",
					TypeParameter = "",
					Unit = "",
					Value = "󰎠",
					Variable = "󰀫",
				},
			},
		},
	},
	config = function()
		local cmp = require("cmp")
		local luasnip = require("luasnip")
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},

			preselect = "item",
			completion = {
				completeopt = vim.o.completeopt,
			},

			sources = {
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "buffer" },
			},

			mapping = {
				["<C-f>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						if luasnip.expandable() then
							luasnip.expand()
						else
							cmp.confirm({ select = true })
						end
					else
						fallback()
					end
				end, { "i", "c" }),
				["<C-e>"] = cmp.mapping.abort(),
				["<C-Space>"] = cmp.mapping.complete(),
				["<C-k>"] = cmp.mapping.select_prev_item({ behavior = "insert" }),
				["<C-j>"] = cmp.mapping.select_next_item({ behavior = "insert" }),
				["<C-u>"] = cmp.mapping.scroll_docs(-4),
				["<C-d>"] = cmp.mapping.scroll_docs(4),
				["<Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(1) then
						luasnip.jump(1)
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			},

			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = require("lspkind").cmp_format({
					maxWidth = { abbr = 40, menu = 50 },
					ellipsis_char = "…",
				}),
			},
			window = {
				completion = { scrolloff = 2 },
			},
		})
	end,
}
