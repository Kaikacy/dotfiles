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
				bg_active = c.theme.ui.bg,
				bg_winbar = c.theme.ui.bg,
				fg = c.theme.ui.fg,
				fg_dark = c.palette.sumiInk6,
				fg_darker = c.palette.sumiInk5,
				fg_winbar = c.palette.lotusWhite3,
				fg_winbar_dark = c.palette.sumiInk5,
				work_dir = c.theme.ui.nontext,
				scrollbar = c.palette.autumnYellow,
				treesitter = c.palette.springGreen,
				lsp = c.theme.ui.fg,
				readonly = c.palette.autumnRed,
				modified = c.palette.waveAqua1,
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
				bg_active = c.grey15,
				bg_winbar = c.grey15,
				fg = c.white,
				fg_dark = c.grey58,
				fg_darker = c.grey27,
				fg_winbar = c.grey58,
				fg_winbar_dark = c.grey39,
				work_dir = c.grey58,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.white,
				modified = c.emerald,
				readonly = c.red,
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
				diagnostic_info = c.lavender,
				diagnostic_warning = c.yellow,
				diagnostic_error = c.red,
				diagnostic_hint = c.emerald,
			}
		end
		local function astrodark()
			local c = require("astrotheme.palettes.astrodark")
			return {
				bg = c.ui.statusline,
				bg_active = c.ui.highlight,
				bg_winbar = c.ui.highlight,
				fg = c.ui.text_match,
				fg_dark = c.ui.text,
				fg_darker = c.ui.text_inactive,
				fg_winbar = c.ui.winbar,
				fg_winbar_dark = c.ui.text_inactive,
				work_dir = c.ui.none_text,
				scrollbar = c.ui.yellow,
				treesitter = c.ui.green,
				lsp = c.ui.text,
				modified = c.syntax.cyan,
				readonly = c.ui.red,
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
				bg_active = c.bg2,
				bg_winbar = c.bg2,
				fg = c.fg1,
				fg_dark = c.fg2,
				fg_darker = c.bg3,
				fg_winbar = c.fg2,
				fg_winbar_dark = c.fg3,
				work_dir = c.fg2,
				scrollbar = palette.yellow.base,
				treesitter = palette.green.base,
				lsp = c.fg1,
				modified = palette.cyan.base,
				readonly = palette.red.base,
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
		local function eldritch()
			local c = require("eldritch.colors").darker
			return {
				bg = c.bg_dark,
				bg_active = c.bg_highlight,
				bg_winbar = c.bg_highlight,
				fg = c.fg,
				fg_dark = c.fg_dark,
				fg_darker = c.fg_gutter_light,
				fg_winbar = c.fg_gutter_light,
				fg_winbar_dark = c.fg_gutter,
				work_dir = c.fg_dark,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.fg,
				modified = c.cyan,
				readonly = c.red,
				macro_rec = c.orange,
				git_branch = c.purple,
				git_add = c.git.add,
				git_remove = c.git.delete,
				git_change = c.git.change,
				mode_normal = c.dark_cyan,
				mode_insert = c.green,
				mode_command = c.orange,
				mode_visual = c.pink,
				mode_terminal = c.yellow,
				mode_replace = c.red,
				mode_select = c.magenta2,
				diagnostic_info = c.dark_cyan,
				diagnostic_warning = c.yellow,
				diagnostic_error = c.red,
				diagnostic_hint = c.bright_green,
			}
		end
		local function nordic()
			local c = require("nordic.colors")
			return {
				bg = c.bg_statusline,
				bg_active = c.gray0,
				bg_winbar = c.gray0,
				fg = c.fg,
				fg_dark = c.gray5,
				fg_darker = c.fg_sidebar,
				fg_winbar = c.gray5,
				fg_winbar_dark = c.fg_sidebar,
				work_dir = c.gray5,
				scrollbar = c.yellow.base,
				treesitter = c.green.base,
				lsp = c.fg,
				modified = c.cyan.dim,
				readonly = c.red.base,
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
		local function oh_lucy()
			local c = require("oh-lucy.colors")
			return {
				bg = c.black,
				bg_active = c.gray,
				bg_winbar = c.gray,
				fg = c.fg,
				fg_dark = c.line_fg,
				fg_darker = c.gray1,
				fg_winbar = c.line_fg,
				fg_winbar_dark = c.gray1,
				work_dir = c.selection_bg,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.fg,
				modified = c.blue_type,
				readonly = c.red_err,
				macro_rec = c.orange,
				git_branch = c.boolean,
				git_add = c.diff_add,
				git_remove = c.red_err,
				git_change = c.diff_change,
				mode_normal = c.diff_text,
				mode_insert = c.green,
				mode_command = c.orange,
				mode_visual = c.pink,
				mode_terminal = c.yellow,
				mode_replace = c.red_err,
				mode_select = c.red_key_w,
				diagnostic_info = c.blue_type,
				diagnostic_warning = c.yellow,
				diagnostic_error = c.red_err,
				diagnostic_hint = c.green_func,
			}
		end
		local function tokyonight()
			local c = require("tokyonight.colors").setup()
			return {
				bg = c.bg_statusline,
				bg_active = c.bg_highlight,
				bg_winbar = c.bg_highlight,
				fg = c.fg,
				fg_dark = c.dark5,
				fg_darker = c.fg_gutter,
				fg_winbar = c.fg_dark,
				fg_winbar_dark = c.dark5,
				work_dir = c.dark5,
				scrollbar = c.yellow,
				treesitter = c.green,
				lsp = c.fg_dark,
				modified = c.blue2,
				readonly = c.red,
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
		local colors = {
			["moonfly"] = moonfly,
			["kanagawa"] = kanagawa,
			["astrodark"] = astrodark,
			["github_dark_default"] = github,
			["eldritch"] = eldritch,
			["nordic"] = nordic,
			["oh-lucy"] = oh_lucy,
			["tokyonight-night"] = tokyonight,
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
			n = n or 3
			return { provider = string.rep(" ", n) }
		end
		local _Align = { provider = "%=" }

		--- like nvim_list_bufs, but excludes
		--- some buffers based on buftype, filetype ...
		---@return integer[]
		local function real_bufs()
			return vim.tbl_filter(function(bufnr)
				return vim.api.nvim_get_option_value("buflisted", { buf = bufnr })
					and not conditions.buffer_matches({
						buftype = { "nofile", "quickfix" },
						filetype = { "oil" },
					}, bufnr)
			end, vim.api.nvim_list_bufs())
		end

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

		local FileTypeBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
		}

		local FileName = {
			provider = function(self)
				return self.filename == "" and "[No Name]" or vim.fn.fnamemodify(self.filename, ":t")
			end,
		}

		local FileIcon = {
			init = function(self)
				if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
					self.icon = ""
					self.icon_color = "mode_terminal"
				else
					self.icon, self.icon_color = require("nvim-web-devicons").get_icon_color_by_filetype(
						vim.api.nvim_get_option_value("filetype", { buf = self.bufnr }),
						{ default = true }
					)
				end
			end,
			provider = function(self)
				-- this is needed, cause terminal filetype is ""
				if vim.api.nvim_get_option_value("buftype", { buf = self.bufnr }) == "terminal" then
					return self.icon .. " "
				end
				return vim.api.nvim_get_option_value("filetype", { buf = self.bufnr }) == "" and ""
					or self.icon and (self.icon .. " ")
			end,
			hl = function(self)
				return { fg = self.icon_color }
			end,
		}

		local FileType = {
			provider = function()
				return vim.bo.filetype
			end,
			hl = function()
				local _, color =
					require("nvim-web-devicons").get_icon_color_by_filetype(vim.bo.filetype, { default = true })
				return { fg = color, bold = true }
			end,
		}

		FileTypeBlock = utils.insert(FileTypeBlock, FileIcon, FileType)

		local FileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(0)
			end,
			FileIcon,
			FileName,
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
				if not conditions.width_percent_below(#cwd, 0.25) then
					cwd = vim.fn.pathshorten(cwd)
				end
				return icon .. cwd
			end,
			hl = { fg = "work_dir" },
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
					return count > 0 and ("󰜄 " .. count .. " ")
				end,
				hl = { fg = "git_add" },
			},
			{
				provider = function(self)
					local count = self.status_dict.removed or 0
					return count > 0 and ("󰛲 " .. count .. " ")
				end,
				hl = { fg = "git_remove" },
			},
			{
				provider = function(self)
					local count = self.status_dict.changed or 0
					return count > 0 and (" " .. count)
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
			FileTypeBlock,
			_Spacer(),
			Git,
			{ condition = conditions.is_git_repo, _Spacer(2) },
			Diagnostics,
			{ condition = conditions.has_diagnostics, _Spacer() },
			WorkDir,
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

		local TablineFileNameModifier = {
			hl = function(self)
				local hl = {}
				if not vim.api.nvim_buf_is_loaded(self.bufnr) then
					hl = { fg = "fg_darker" }
				elseif vim.api.nvim_get_option_value("modified", { buf = self.bufnr }) then
					hl = { fg = "modified" }
				elseif
					not vim.api.nvim_get_option_value("modifiable", { buf = self.bufnr })
					or vim.api.nvim_get_option_value("readonly", { buf = self.bufnr })
				then
					hl = { fg = "readonly" }
				end
				hl.bold = self.is_active or self.is_visible
				hl.italic = hl.bold
				hl.force = true
				return hl
			end,
		}

		local TablinePicker = {
			condition = function(self)
				return self._show_picker
			end,
			init = function(self)
				local bufname = vim.api.nvim_buf_get_name(self.bufnr)
				bufname = vim.fn.fnamemodify(bufname, ":t")
				local label = bufname:sub(1, 1)
				local i = 2
				while self._picker_labels[label] do
					if i > #bufname then
						break
					end
					label = bufname:sub(i, i)
					i = i + 1
				end
				self._picker_labels[label] = self.bufnr
				self.label = label
			end,
			provider = function(self)
				return self.label .. " "
			end,
			hl = { fg = "readonly", bold = true },
		}

		local TablineSmartPath = {
			condition = function(self)
				local name = vim.api.nvim_buf_get_name(self.bufnr)
				self.basename = vim.fs.basename(name)
				self.dirs = vim.split(vim.fs.dirname(name), "/", { trimempty = true })
				self.paths = {}

				local paths = {}
				local bufs = real_bufs()
				for _, buf in ipairs(bufs) do
					if buf ~= self.bufnr then
						table.insert(paths, vim.api.nvim_buf_get_name(buf))
					end
				end
				for _, path in ipairs(paths) do
					if vim.fs.basename(path) == self.basename then
						table.insert(self.paths, path)
						return true
					end
				end
			end,
			init = function(self)
				self.path = ""
				for _, path in ipairs(self.paths) do
					local other_dirs = vim.split(vim.fs.dirname(path), "/", { trimempty = true })
					local k = 0
					while other_dirs[#other_dirs - k] == self.dirs[#self.dirs - k] do
						k = k + 1
					end
					self.path = table.concat(self.dirs, "/", #self.dirs - k)
					break
				end
			end,
			provider = function(self)
				return "" .. self.path .. "/"
			end,
			hl = function(self)
				return { fg = self.is_active and "fg_dark" or "fg_darker" }
			end,
		}

		local TablineFileNameBlock = {
			init = function(self)
				self.filename = vim.api.nvim_buf_get_name(self.bufnr)
			end,
			hl = function(self)
				if self.is_active then
					return { fg = "fg" }
				else
					return { fg = "fg_dark" }
				end
			end,
			{
				fallthrough = false,
				TablinePicker,
				FileIcon,
			},
			TablineSmartPath,
			utils.insert(TablineFileNameModifier, FileName),
		}

		TablineBufferBlock = utils.surround({ "██", "██" }, function(self)
			if self.is_active then
				return "bg_active"
			else
				return "bg"
			end
		end, TablineFileNameBlock)

		local BufferLine = utils.make_buflist(
			TablineBufferBlock,
			{ provider = " ", hl = { fg = "fg_darker" } },
			{ provider = " ", hl = { fg = "fg_darker" } },
			real_bufs
		)

		local Tabpage = {
			provider = function(self)
				return "%" .. self.tabnr .. "T " .. self.tabpage .. " %T"
			end,
			hl = function(self)
				if self.is_active then
					return { fg = "bg", bg = "fg_dark", bold = true }
				else
					return { fg = "fg", bg = "bg" }
				end
			end,
		}

		local TabPages = {
			condition = function()
				return #vim.api.nvim_list_tabpages() >= 2
			end,
			utils.make_tablist(Tabpage),
		}

		local TabLine = {
			hl = { bg = "bg" },
			BufferLine,
			_Align,
			TabPages,
		}

		local Navic = {
			condition = function()
				return require("nvim-navic").is_available()
			end,
			provider = function()
				return require("nvim-navic").get_location()
			end,
			update = "CursorMoved",
		}

		local WinBar = {
			hl = { bg = "bg_winbar" },
			{
				fallthrough = false,
				{
					condition = function()
						return not conditions.is_active()
					end,
					init = function(self)
						self.bufnr = vim.api.nvim_win_get_buf(0)
						self.filename = vim.api.nvim_buf_get_name(self.bufnr)
					end,
					hl = { fg = "fg_winbar", italic = true },
					_Spacer(2),
					FileIcon,
					{ hl = { fg = "fg_winbar_dark", force = true }, TablineSmartPath },
					FileName,
				},
				{
					_Spacer(2),
					Navic,
				},
			},
			_Align,
		}

		heirline.setup({
			statusline = StatusLine,
			tabline = TabLine,
			winbar = WinBar,
			opts = {
				disable_winbar_cb = function(args)
					return conditions.buffer_matches({
						buftype = { "nofile", "prompt", "help", "quickfix", "terminal" },
						filetype = { "^git.*", "Trouble", "oil" },
					}, args.buf)
				end,
			},
		})

		local buffer_picker = function(callback)
			local tabline = require("heirline").tabline
			---@diagnostic disable-next-line: undefined-field
			local buflist = tabline._buflist[1]
			buflist._picker_labels = {}
			buflist._show_picker = true
			vim.cmd.redrawtabline()
			local char = vim.fn.getcharstr()
			local bufnr = buflist._picker_labels[char]
			if bufnr then
				callback(bufnr)
			end
			buflist._show_picker = false
			vim.cmd.redrawtabline()
		end

		vim.keymap.set("n", "<leader>bb", function()
			buffer_picker(function(bufnr)
				vim.api.nvim_win_set_buf(0, bufnr)
			end)
		end, { desc = "Pick buffer" })

		vim.keymap.set("n", "<leader>bx", function()
			buffer_picker(function(bufnr)
				vim.api.nvim_buf_delete(bufnr, {})
			end)
		end, { desc = "Pick and delete buffer" })

		vim.keymap.set("n", "<leader>b\\", function()
			buffer_picker(function(bufnr)
				vim.cmd("split")
				vim.api.nvim_win_set_buf(0, bufnr)
			end)
		end, { desc = "Pick and split buffer" })

		vim.keymap.set("n", "<leader>b|", function()
			buffer_picker(function(bufnr)
				vim.cmd("vsplit")
				vim.api.nvim_win_set_buf(0, bufnr)
			end)
		end, { desc = "Pick and vert split buffer" })
	end,
}
