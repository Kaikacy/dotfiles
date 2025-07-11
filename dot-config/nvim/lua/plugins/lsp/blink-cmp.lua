return {
	"saghen/blink.cmp",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },
	---@module "blink.cmp"
	---@type blink.cmp.Config
	opts = {
		keymap = {
			["<C-f>"] = { "select_and_accept", "fallback" },
			["<C-j>"] = { "select_next", "fallback" },
			["<C-k>"] = { "select_prev", "fallback" },
			["<C-u>"] = { "scroll_documentation_up", "fallback" },
			["<C-d>"] = { "scroll_documentation_down", "fallback" },
			["<Tab>"] = { "snippet_forward", "fallback" },
			["<S-Tab>"] = { "snippet_backward", "fallback" },
			["<C-s>"] = { "show_signature", "hide_signature" },
			["<C-e>"] = { "hide", "fallback" },
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		},
		cmdline = {
			keymap = {
				["<C-f>"] = { "select_and_accept", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-e>"] = { "hide", "fallback" },
				["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			},
			completion = {
				list = { selection = { auto_insert = false } },
				menu = { auto_show = true },
			},
		},

		appearance = {
			nerd_font_variant = "normal",
			kind_icons = {
				Array = "",
				Boolean = "󰨙",
				Class = "󰆼",
				Color = "",
				Constant = "󰏿",
				Constructor = "",
				Enum = "",
				EnumMember = "",
				Event = "",
				Field = "󱈢",
				File = "",
				Folder = "",
				Function = "󰡱",
				Interface = "󱡠",
				Key = "",
				Keyword = "",
				Method = "󰡱",
				Module = "",
				Namespace = "󰦮",
				Null = "󰟢",
				Number = "󰎠",
				Object = "󰮄",
				Operator = "󱓉",
				Package = "󰏗",
				Property = "󰖷",
				Reference = "",
				Snippet = "󱄽",
				String = "󰅳",
				Struct = "󰆼",
				Text = "󰉿",
				TypeParameter = "",
				Unit = "",
				Value = "󰎠",
				Variable = "󰫧",
			},
		},

		completion = {
			list = { selection = { auto_insert = false } },
			menu = {
				max_height = vim.o.pumheight,

				draw = {
					treesitter = { "lsp" },
					gap = 1,
					columns = { { "kind_icon" }, { "label", "label_description", gap = 2 } },
					components = {
						label_description = {
							width = { max = 45 },
						},
					},
				},
			},
			documentation = {
				treesitter_highlighting = true,
				auto_show = true,
				auto_show_delay_ms = 200,
				window = {
					max_width = 80,
				},
			},
		},

		signature = {
			enabled = true,
			window = {
				border = "rounded",
			},
		},

		sources = {
			default = function()
				local node = vim.treesitter.get_node()
				if node and vim.tbl_contains({ "comment", "line_commnet", "block_comment" }, node:type()) then
					return { "path", "buffer" }
				else
					return { "lsp", "path", "snippets", "buffer" }
				end
			end,
			min_keyword_length = function(ctx)
				-- only applies when typing a command, doesn't apply to arguments
				if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
					return 2
				end
				return 0
			end,
		},
	},
}
