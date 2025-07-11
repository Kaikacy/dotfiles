return {
	{
		"folke/tokyonight.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			style = "night",
			dim_inactive = true,
		},
	},
	{
		"rebelot/kanagawa.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			overrides = function(c)
				return {
					RainbowDelimiterBlue = { fg = c.palette.crystalBlue },
					RainbowDelimiterRed = { fg = c.palette.autumnRed },
					RainbowDelimiterGreen = { fg = c.palette.lotusGreen2 },
					RainbowDelimiterYellow = { fg = c.palette.roninYellow },
					RainbowDelimiterCyan = { fg = c.palette.lightBlue },
					RainbowDelimiterOrange = { fg = c.palette.lotusOrange },
					RainbowDelimiterViolet = { fg = c.palette.oniViolet },
				}
			end,
		},
	},
	{
		"bluz71/vim-moonfly-colors",
		enabled = false,
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.moonflyCursorColor = true
			vim.g.moonflyVirtualTextColor = true
			vim.g.moonflyWinSeparator = 2
		end,
	},
	{
		"AstroNvim/astrotheme",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			style = {
				simple_syntax_colors = false,
			},
		},
	},
	{
		"projekt0n/github-nvim-theme",
		enabled = false,
		name = "github-theme",
		lazy = false,
		priority = 1000,
		opts = {
			groups = {
				all = {
					SnacksIndent = { fg = "palette.border.muted" },
					RainbowDelimiterBlue = { fg = "palette.blue.base" },
					RainbowDelimiterRed = { fg = "palette.red.base" },
					RainbowDelimiterGreen = { fg = "palette.green.base" },
					RainbowDelimiterYellow = { fg = "palette.yellow.base" },
					RainbowDelimiterCyan = { fg = "palette.cyan.base" },
					RainbowDelimiterOrange = { fg = "palette.orange" },
					RainbowDelimiterViolet = { fg = "palette.pink.base" },
				},
			},
		},
	},
	{
		"AlexvZyl/nordic.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			swap_backgrounds = true,
			cursorline = {
				theme = "light",
				blend = 0.5,
			},
			on_highlight = function(hi, c)
				hi.SnacksIndent = { fg = c.gray1 }
				hi.LspReferenceText = { bg = c.gray0, bold = true }
				hi.LspReferenceRead = { link = "LspReferenceText" }
				hi.LspReferenceWrite = { link = "LspReferenceText" }
				hi["@operator"] = { fg = c.red.base }
				hi["@label"] = { fg = c.blue0 }
			end,
		},
	},
	{
		"scottmckendry/cyberdream.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
		opts = {
			italic_comments = true,
			borderless_pickers = true,
			overrides = function(c)
				return {
					Pmenu = { bg = c.bg_alt },
					NormalFloat = { bg = c.bg_alt },
				}
			end,
		},
	},
	{
		"vague2k/vague.nvim",
		enabled = false,
		lazy = false,
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		priority = 1000,
		lazy = false,
		name = "catppuccin",
		---@module "catppuccin"
		---@type CatppuccinOptions
		opts = {
			term_colors = true,
			integrations = {
				blink_cmp = true,
				fidget = true,
				grug_far = true,
				harpoon = true,
				mason = true,
				snacks = {
					enabled = true,
					indent_scope_color = "flamingo",
				},
				lsp_trouble = true,
				which_key = true,
			},
			custom_highlights = function(colors)
				return {
					BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },
					BlinkCmpDoc = { bg = colors.crust },
					BlinkCmpDocSeparator = { bg = colors.crust },
					TreesitterContextBottom = { sp = colors.surface2 },
				}
			end,
			color_overrides = {
				mocha = {
					base = "#050508",
					mantle = "#050508",
					crust = "#15151e",
					surface0 = "#1c1c27",
					surface1 = "#343649",
					surface2 = "#41435b",
				},
			},
		},
	},
	{
		"rose-pine/neovim",
		priority = 1000,
		lazy = false,
		name = "rose-pine",
		opts = {
			palette = {
				main = {
					base = "#0f0e16",
					surface = "#161521",
					overlay = "#29263e",
					highlight_low = "#252434",
					highlight_med = "#3a374b",
					highlight_high = "#48455a",
				},
			},
			highlight_groups = {
				BlinkCmpMenu = { link = "Pmenu" },
				BlinkCmpMenuSelection = { link = "PmenuSel" },
				BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
				BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
			},
		},
	},
}
