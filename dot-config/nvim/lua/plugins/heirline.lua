---@diagnostic disable: missing-fields
return {
	"rebelot/heirline.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	event = "UIEnter",
	config = function()
		local heirline = require("heirline")
		local conditions = require("heirline.conditions")
		local utils = require("heirline.utils")

		local function kanagawa()
			local c = require("kanagawa.colors").setup()
			return {
				bg = c.theme.ui.bg_dim,
				fg = c.theme.ui.fg,
				fg_dark = c.palette.sumiInk6,
				work_dir = c.theme.ui.nontext,
				scrollbar = c.palette.autumnYellow,
				treesitter = c.palette.springGreen,
				lsp = c.theme.ui.fg,
				macro_rec = c.palette.surimiOrange,
				mode_normal = c.palette.crystalBlue,
				mode_insert = c.palette.springGreen,
				mode_command = c.palette.roninYellow,
				mode_visual = c.palette.oniViolet,
				mode_terminal = c.palette.carpYellow,
				mode_replace = c.palette.samuraiRed,
				mode_select = c.palette.sakuraPink,
				diagnostic_info = c.theme.diag.info,
				diagnostic_warning = c.theme.diag.warning,
				diagnostic_error = c.theme.diag.error,
				diagnostic_hint = c.theme.diag.hint,
				git_branch = c.palette.sakuraPink,
				git_add = c.theme.vcs.added,
				git_remove = c.theme.vcs.removed,
				git_change = c.theme.vcs.changed,
			}
		end
		local function moonfly()
			local c = require("moonfly").palette
			return {
				bg = c.grey7,
				fg = c.white,
				fg_dark = c.grey58,
				work_dir = c.grey58,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.white,
				macro_rec = c.orange,
				git_branch = c.purple,
				git_add = c.green,
				git_remove = c.red,
				git_change = c.blue,
				mode_normal = c.blue,
				mode_insert = c.green,
				mode_command = c.orange,
				mode_visual = c.purple,
				mode_terminal = c.yellow,
				mode_replace = c.cranberry,
				mode_select = c.violet,
				diagnostic_info = c.sky,
				diagnostic_warning = c.yellow,
				diagnostic_error = c.red,
				diagnostic_hint = c.emerald,
			}
		end
		local function astrodark()
			local c = require("astrotheme.palettes.astrodark")
			return {
				bg = c.ui.statusline,
				fg = c.ui.text_match,
				fg_dark = c.ui.text,
				work_dir = c.ui.none_text,
				scrollbar = c.ui.yellow,
				treesitter = c.ui.green,
				lsp = c.ui.text,
				macro_rec = c.ui.orange,
				git_branch = c.ui.purple,
				git_add = c.syntax.green,
				git_remove = c.syntax.red,
				git_change = c.syntax.blue,
				mode_normal = c.ui.accent,
				mode_insert = c.ui.green,
				mode_command = c.ui.orange,
				mode_visual = c.ui.purple,
				mode_terminal = c.ui.yellow,
				mode_replace = c.ui.red,
				mode_select = c.ui.cyan,
				diagnostic_info = c.syntax.blue,
				diagnostic_warning = c.syntax.yellow,
				diagnostic_error = c.syntax.red,
				diagnostic_hint = c.syntax.cyan,
			}
		end
		local function github()
			local palette = require("github-theme.palette.github_dark_default").palette
			local c = require("github-theme.palette.github_dark_default").generate_spec(palette)
			return {
				bg = c.bg0,
				fg = c.fg1,
				fg_dark = c.fg2,
				work_dir = c.fg2,
				scrollbar = palette.yellow.base,
				treesitter = palette.green.base,
				lsp = c.fg1,
				macro_rec = palette.orange,
				git_branch = palette.pink.base,
				git_add = c.git.add,
				git_remove = c.git.removed,
				git_change = c.git.changed,
				mode_normal = palette.blue.base,
				mode_insert = palette.green.base,
				mode_command = palette.orange,
				mode_visual = palette.pink.base,
				mode_terminal = palette.yellow.base,
				mode_replace = palette.red.base,
				mode_select = palette.cyan.base,
				diagnostic_info = c.diag.info,
				diagnostic_warning = c.diag.warn,
				diagnostic_error = c.diag.error,
				diagnostic_hint = c.diag.hint,
			}
		end
		local function nordic()
			local c = require("nordic.colors")
			return {
				bg = c.bg_statusline,
				fg = c.fg,
				fg_dark = c.gray5,
				work_dir = c.gray5,
				scrollbar = c.yellow.base,
				treesitter = c.green.base,
				lsp = c.fg,
				macro_rec = c.orange.base,
				git_branch = c.magenta.base,
				git_add = c.git.add,
				git_remove = c.git.delete,
				git_change = c.git.change,
				mode_normal = c.blue1,
				mode_insert = c.green.dim,
				mode_command = c.orange.base,
				mode_visual = c.magenta.dim,
				mode_terminal = c.yellow.dim,
				mode_replace = c.red.base,
				mode_select = c.magenta.dim,
				diagnostic_info = c.info,
				diagnostic_warning = c.warning,
				diagnostic_error = c.error,
				diagnostic_hint = c.hint,
			}
		end
		local function tokyonight()
			local c = require("tokyonight.colors").setup()
			return {
				bg = c.bg_statusline,
				fg = c.fg,
				fg_dark = c.dark5,
				work_dir = c.dark5,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.fg_dark,
				macro_rec = c.orange,
				git_branch = c.purple,
				git_add = c.git.add,
				git_remove = c.git.delete,
				git_change = c.git.change,
				mode_normal = c.blue,
				mode_insert = c.green,
				mode_command = c.orange,
				mode_visual = c.purple,
				mode_terminal = c.yellow,
				mode_replace = c.red,
				mode_select = c.magenta,
				diagnostic_info = c.blue,
				diagnostic_warning = c.yellow,
				diagnostic_error = c.error,
				diagnostic_hint = c.green2,
			}
		end
		local function cyberdream()
			local c = require("cyberdream.colors").default
			return {
				bg = c.bg_alt,
				fg = c.fg,
				fg_dark = c.grey,
				work_dir = c.grey,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.fg,
				macro_rec = c.orange,
				git_branch = c.purple,
				git_add = c.green,
				git_remove = c.red,
				git_change = c.blue,
				mode_normal = c.blue,
				mode_insert = c.green,
				mode_command = c.orange,
				mode_visual = c.magenta,
				mode_terminal = c.yellow,
				mode_replace = c.red,
				mode_select = c.pink,
				diagnostic_info = c.blue,
				diagnostic_warning = c.yellow,
				diagnostic_error = c.red,
				diagnostic_hint = c.cyan,
			}
		end
		local function vague()
			local c = require("vague").get_palette()
			return {
				bg = c.line,
				fg = c.fg,
				fg_dark = c.floatBorder,
				work_dir = c.floatBorder,
				scrollbar = c.delta,
				treesitter = c.plus,
				lsp = c.fg,
				macro_rec = c.number,
				git_branch = c.parameter,
				git_add = c.plus,
				git_remove = c.error,
				git_change = c.hint,
				mode_normal = c.hint,
				mode_insert = c.plus,
				mode_command = c.number,
				mode_visual = c.parameter,
				mode_terminal = c.delta,
				mode_replace = c.error,
				mode_select = c.builtin,
				diagnostic_info = c.hint,
				diagnostic_warning = c.warning,
				diagnostic_error = c.error,
				diagnostic_hint = c.builtin,
			}
		end
		local colors = {
			["moonfly"] = moonfly,
			["kanagawa"] = kanagawa,
			["astrodark"] = astrodark,
			["github_dark_default"] = github,
			["nordic"] = nordic,
			["tokyonight-night"] = tokyonight,
			["cyberdream"] = cyberdream,
			["vague"] = vague,
		}
		heirline.load_colors(colors[vim.g.colors_name]())
		vim.api.nvim_create_autocmd("ColorScheme", {
			desc = "update heirline colors on colorscheme change",
			group = vim.api.nvim_create_augroup("heirline", {}),
			callback = function()
				local func = colors[vim.g.colors_name]
				if func ~= nil then
					utils.on_colorscheme(func)
				end
			end,
		})

		local function _Spacer(n)
			return { provider = string.rep(" ", n or 3) }
		end
		local _Align = { provider = "%=" }

		local ViMode = {
			init = function(self)
				self.mode = vim.fn.mode()
			end,

			static = {
				mode_colors = {
					n = "mode_normal",
					i = "mode_insert",
					c = "mode_command",
					v = "mode_visual",
					V = "mode_visual",
					["\22"] = "mode_visual",
					t = "mode_terminal",
					["!"] = "mode_terminal",
					R = "mode_replace",
					s = "mode_select",
					S = "mode_select",
					["\19"] = "mode_select",
				},
			},

			provider = "  ",
			hl = function(self)
				local mode = self.mode:sub(1, 1)
				return { bg = self.mode_colors[mode] }
			end,

			update = {
				"ModeChanged",
				pattern = "*:*",
				callback = vim.schedule_wrap(function()
					vim.cmd("redrawstatus")
				end),
			},
		}

		local FileType = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
			provider = function()
				return vim.bo.filetype
			end,
			hl = function()
				local _, color =
					require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype, { default = true })
				return { fg = color, bold = true }
			end,
		}

		local TerminalName = {
			provider = function()
				local tname, _ = vim.api.nvim_buf_get_name(0):gsub(".*:", "")
				return tname
			end,
			hl = { fg = "mode_terminal", bold = true },
		}

		local WorkDir = {
			provider = function()
				local icon = vim.fn.haslocaldir(0) == 1 and " " or " "
				local cwd = vim.fn.getcwd(0)
				cwd = vim.fn.fnamemodify(cwd, ":~")
				if not conditions.width_percent_below(#cwd, 0.30) then
					cwd = vim.fn.pathshorten(cwd)
				end
				return icon .. cwd
			end,
			hl = { fg = "work_dir" },
		}

		local FileName = {
			provider = function()
				local filename = vim.api.nvim_buf_get_name(0)
				if vim.bo.filetype == "help" then
					filename = vim.fn.fnamemodify(filename, ":t")
				else
					filename = filename ~= "" and vim.fn.fnamemodify(filename, ":~:.") or "[No Name]"
					if not conditions.width_percent_below(#filename, 0.40) then
						filename = vim.fn.pathshorten(filename)
					end
				end
				return filename .. " %m%r"
			end,
			hl = { fg = "fg" },
		}

		local FileIcon = {
			init = function(self)
				self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color_by_filetype(
					vim.api.nvim_get_option_value("filetype", { buf = self.bufnr }),
					{ default = true }
				)
			end,
			provider = function(self)
				return vim.api.nvim_get_option_value("filetype", { buf = self.bufnr }) == "" and " "
					or self.icon and (self.icon .. " ")
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local FileNameBlock = {
			FileIcon,
			FileName,
		}

		local Ruler = {
			provider = "%3l:%-2c %P",
			hl = { fg = "fg_dark" },
		}

		local ScrollBar = {
			static = {
				sbar = { " ", "▁", "▂", "▃", "▄", "▅", "▆", "▇", "█" },
			},
			provider = function(self)
				local curr_line = vim.api.nvim_win_get_cursor(0)[1]
				local lines = vim.api.nvim_buf_line_count(0)
				local i = math.floor((curr_line - 1) / lines * #self.sbar) + 1
				return string.rep(self.sbar[i], 2)
			end,
			hl = { fg = "scrollbar" },
		}

		local Diagnostics = {
			condition = conditions.has_diagnostics,

			static = {
				error_icon = "E",
				warn_icon = "W",
				info_icon = "I",
				hint_icon = "H",
			},

			init = function(self)
				self.errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
				self.warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
				self.hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
				self.info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })
			end,

			update = {
				"DiagnosticChanged",
				callback = vim.schedule_wrap(function()
					vim.cmd("redrawstatus")
				end),
			},
			{
				provider = function(self)
					return self.errors > 0 and (self.error_icon .. self.errors)
				end,
				hl = { fg = "diagnostic_error" },
			},
			{
				provider = function(self)
					return self.warnings > 0 and (" " .. self.warn_icon .. self.warnings)
				end,
				hl = { fg = "diagnostic_warning" },
			},
			{
				provider = function(self)
					return self.info > 0 and (" " .. self.info_icon .. self.info)
				end,
				hl = { fg = "diagnostic_info" },
			},
			{
				provider = function(self)
					return self.hints > 0 and (" " .. self.hint_icon .. self.hints)
				end,
				hl = { fg = "diagnostic_hint" },
			},
		}

		local LSPActive = {
			condition = conditions.lsp_attached,
			update = { "LspAttach", "LspDetach" },

			provider = function()
				local names = {}
				for _, server in pairs(vim.lsp.get_clients({ bufnr = 0 })) do
					table.insert(names, server.name)
				end
				return " " .. table.concat(names, " ")
			end,
			hl = { fg = "lsp" },
		}

		local DAPMessages = {
			condition = function()
				local session = require("dap").session()
				return session ~= nil
			end,
			provider = function()
				return " " .. require("dap").status()
			end,
			hl = "Debug",
		}

		local Git = {
			condition = conditions.is_git_repo,
			update = {
				"User",
				pattern = "GitSignsUpdate",
				callback = vim.schedule_wrap(function()
					vim.cmd("redrawstatus")
				end),
			},

			init = function(self)
				self.status_dict = vim.b.gitsigns_status_dict
				self.has_changes = self.status_dict.added ~= 0
					or self.status_dict.removed ~= 0
					or self.status_dict.changed ~= 0
			end,

			hl = { fg = "git_branch" },

			{
				provider = function(self)
					return " " .. self.status_dict.head .. " "
				end,
				hl = { bold = true },
			},
			{
				provider = function(self)
					local count = self.status_dict.added or 0
					return count > 0 and ("+" .. count .. " ")
				end,
				hl = { fg = "git_add" },
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and ("-" .. count .. " ")
				end,
				hl = { fg = "git_remove" },
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and ("~" .. count)
				end,
				hl = { fg = "git_change" },
			},
		}

		local TSActive = {
			condition = function()
				local ok, parser = pcall(vim.treesitter.get_parser, vim.api.nvim_get_current_buf())
				return ok and parser ~= nil
			end,
			provider = " TS",
			hl = { fg = "treesitter" },
		}

		local SearchCount = {
			condition = function()
				return vim.v.hlsearch ~= 0 and vim.o.cmdheight == 0
			end,
			init = function(self)
				local ok, search = pcall(vim.fn.searchcount)
				if ok and search.total then
					self.search = search
				end
			end,
			hl = { fg = "scrollbar" },
			provider = function(self)
				local search = self.search
				return string.format(" %d/%d", search.current, math.min(search.total, search.maxcount))
			end,
		}

		local MacroRec = {
			condition = function()
				return vim.fn.reg_recording() ~= "" and vim.o.cmdheight == 0
			end,
			provider = function()
				return "recording @" .. vim.fn.reg_recording()
			end,
			hl = { fg = "macro_rec", bold = true },
			update = {
				"RecordingEnter",
				"RecordingLeave",
			},
		}

		local DefaultStatusLine = {
			hl = { bg = "bg" },
			ViMode,
			_Spacer(),
			FileType,
			_Spacer(),
			Git,
			{ condition = conditions.is_git_repo, _Spacer(2) },
			Diagnostics,
			{ condition = conditions.has_diagnostics, _Spacer() },
			WorkDir,
			_Spacer(2),
			FileNameBlock,
			_Align,
			MacroRec,
			_Align,
			SearchCount,
			_Spacer(4),
			DAPMessages,
			_Spacer(4),
			LSPActive,
			_Spacer(2),
			TSActive,
			_Spacer(4),
			Ruler,
			_Spacer(1),
			ScrollBar,
			_Spacer(),
			ViMode,
		}

		local TerminalStatusLine = {
			hl = { bg = "bg" },
			ViMode,
			_Spacer(),
			FileIcon,
			TerminalName,
			_Spacer(),
			WorkDir,
			_Align,
			MacroRec,
			_Align,
			SearchCount,
			_Spacer(2),
			Ruler,
			_Spacer(1),
			ScrollBar,
			_Spacer(),
			ViMode,
		}

		local StatusLine = {
			fallthrough = false,
			{
				condition = function()
					return vim.bo.buftype == "terminal"
				end,
				TerminalStatusLine,
			},
			DefaultStatusLine,
		}

		heirline.setup({
			statusline = StatusLine,
		})
	end,
}
