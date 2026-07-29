local c = {
    black = "#000000",
    black1 = "#101010",
    black2 = "#1b1b1b",
    gray = "#323232",
    gray1 = "#555555",
    white0 = "#828f97",
    white = "#b3b3b3",
    white1 = "#ffffff",
    yellow = "#bb7722", -- Comments
    yellow1 = "#ffee50", -- Functions
    red = "#aa2929", -- Constants
    red1 = "#ff5555",
    cyan = "#30aaaa", -- Strings
    cyan1 = "#55ffff",
    green = "#29aa29", -- Variables
    green1 = "#55ff55",
    blue0 = "#000044",
    blue = "#4949d0",
    blue1 = "#7070ff",
    purple = "#aa30aa",
    purple1 = "#ff55ff",
}

local hls = {
    Normal = { bg = c.black, fg = c.white },
    NormalFloat = {
        bg = (vim.g.lim_float_bg == false) and c.black or c.black2,
        fg = c.white,
    },
    FloatBorder = {
        bg = (vim.g.lim_float_bg == false) and c.black or c.black2,
        fg = c.gray,
    },
    -- FloatShadow
    ColorColumn = { bg = c.black1 },
    Conceal = { fg = c.gray },
    CurSearch = { bg = c.yellow1, fg = c.black },
    Search = { bg = c.yellow, fg = c.white1 },
    Cursor = { bg = c.green, fg = c.black },
    CursorLine = { bg = c.black1 },
    CursorColumn = { link = "CursorLine" },
    Directory = { fg = c.yellow },
    DiffAdd = { bg = c.black1, fg = c.green1 },
    DiffChange = { bg = c.black1 },
    DiffDelete = { bg = c.black1, fg = c.red1, bold = true },
    DiffText = { bg = c.black2, fg = c.cyan1 },
    NonText = { fg = c.gray },
    TermCursor = { bg = c.green, fg = c.black },
    ErrorMsg = { fg = c.red1, bold = true },
    WarningMsg = { fg = c.yellow1, bold = true },
    OkMsg = { fg = c.green1, bold = true },
    WinSeparator = { fg = c.gray },
    Folded = { bg = c.blue0 },
    LineNr = { fg = c.gray1 },
    SignColumn = { fg = c.gray1 },
    CursorLineNr = { bg = c.black1, fg = c.white0 },
    CursorLineSign = { bg = c.black1 },
    MatchParen = { bg = c.blue0, fg = c.white1 },
    ModeMsg = { fg = c.white0 },
    MoreMsg = { fg = c.white0 },
    Question = { fg = c.white0 },
    Title = { fg = c.yellow1 },
    Pmenu = { bg = c.black2, fg = c.white },
    PmenuSel = { bg = c.blue0, bold = true },
    PmenuKind = { fg = c.yellow },
    PmenuKindSel = { bg = c.blue0, fg = c.yellow, bold = true },
    PmenuExtra = { fg = c.gray1 },
    PmenuExtraSel = { bg = c.blue0, fg = c.gray1, bold = true },
    PmenuSbar = { link = "Pmenu" },
    PmenuThumb = { bg = c.gray },
    PmenuMatch = { fg = c.yellow1 },
    PmenuMatchSel = { bg = c.blue0, fg = c.yellow1, bold = true },
    QuickFixLine = { bg = c.black2 },
    qfFileName = { fg = c.yellow1 },
    qfLineNr = { fg = c.white0 },
    qfSeparator1 = { fg = c.gray1 },
    qfSeparator2 = { link = "qfSeparator1" },
    SpecialKey = { fg = c.white0, italic = true },
    SpellBad = { sp = c.red1, undercurl = true },
    SpellCap = { sp = c.yellow1, undercurl = true },
    SpellLocal = { sp = c.green1, undercurl = true },
    SpellRare = { sp = c.cyan1, undercurl = true },
    StatusLine = { bg = c.blue0 },
    StatusLineNC = { bg = c.black1, fg = c.gray1 },
    TabLine = { bg = c.black, fg = c.gray1 },
    TabLineFill = { bg = c.black },
    TabLineSel = { bg = c.blue0, fg = c.white },
    Visual = { bg = c.blue0, fg = c.white1 },
    -- WinBar, WinBarNC

    --- Syntax ---
    Comment = {
        fg = c.yellow,
        italic = vim.g.lim_italic_comments,
    },
    Function = { fg = c.white }, -- Function call
    String = { fg = c.cyan },
    Identifier = { fg = c.white },
    Type = { fg = c.white, bold = true },
    Keyword = { fg = c.white0 },
    Constant = { fg = c.red },
    Boolean = { fg = c.white },
    Number = { fg = c.white },
    Character = { link = "String" },
    Label = { fg = c.white },
    Operator = { fg = c.white0 },
    Delimiter = { fg = c.white0 },
    Special = { fg = c.cyan },
    SpecialChar = { bold = true },
    Statement = { fg = c.white },
    Structure = { fg = c.white },
    Todo = { bold = true, underline = true },
    PreProc = { link = "Keyword" },
    Error = { bg = c.red, fg = c.black, bold = true },
    Added = { fg = c.green },
    Changed = { fg = c.cyan },
    Removed = { fg = c.red },

    --- Diagnostics ---
    DiagnosticError = { fg = c.red1 },
    DiagnosticWarn = { fg = c.yellow1 },
    DiagnosticInfo = { fg = c.blue1 },
    DiagnosticHint = { fg = c.cyan1 },
    DiagnosticOk = { fg = c.green1 },
    DiagnosticVirtualTextError = { link = "DiagnosticError" },
    DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
    DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
    DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
    DiagnosticVirtualTextOk = { link = "DiagnosticOk" },
    DiagnosticSignError = { link = "DiagnosticError" },
    DiagnosticSignWarn = { link = "DiagnosticWarn" },
    DiagnosticSignInfo = { link = "DiagnosticInfo" },
    DiagnosticSignHint = { link = "DiagnosticHint" },
    DiagnosticSignOk = { link = "DiagnosticOk" },
    DiagnosticUnderlineError = { sp = c.red1, underline = true },
    DiagnosticUnderlineWarn = { sp = c.yellow1, underline = true },
    DiagnosticUnderlineInfo = { sp = c.blue1, underline = true },
    DiagnosticUnderlineHint = { sp = c.cyan1, underline = true },
    DiagnosticUnderlineOk = { sp = c.green1, underline = true },

    --- LSP ---
    LspCodeLens = { fg = c.gray },
    LspCodeLensSeparator = { fg = c.black1 },
    LspInlayHint = { fg = c.gray },
    LspReferenceText = { bg = c.black2 },
    LspReferenceRead = { link = "LspReferenceText" },
    LspReferenceWrite = { link = "LspReferenceText" },
    LspSignatureActiveParameter = { bg = c.blue0, bold = true },

    --- Treesitter ---
    ["@variable"] = { fg = c.white },
    ["@variable.builtin"] = { link = "@variable" },
    ["@variable.parameter.builtin"] = { link = "@variable.parameter" },
    ["@constant.builtin"] = { link = "@constant" },
    ["@module.builtin"] = { link = "@module" },
    ["@type.builtin"] = { link = "Type" },
    ["@attribute.builtin"] = { link = "@attribute" },
    ["@constructor"] = {},
    ["@keyword.conditional.ternary"] = { link = "@operator" },
    ["@function"] = { fg = c.yellow1 }, -- Function definition
    ["@function.method"] = { link = "@function" },
    ["@function.call"] = { link = "Function" },
    ["@function.method.call"] = { link = "@function.call" },
    ["@function.builtin"] = { link = "@function.call" },
    ["@function.macro"] = { link = "@function.call" },
    ["@punctuation.special"] = { link = "Operator" },
    ["@markup.heading"] = { fg = c.yellow1, bold = true },
    ["@markup.heading.1"] = { fg = c.yellow1, bold = true },
    ["@markup.heading.2"] = { fg = c.yellow, bold = true },
    ["@markup.heading.3"] = { fg = c.cyan },
    ["@markup.heading.4"] = { fg = c.green },
    ["@markup.heading.5"] = { fg = c.red },
    ["@markup.heading.6"] = { fg = c.white },
    ["@markup.quote"] = { fg = c.white },
    ["@markup.raw"] = { fg = c.cyan },
    ["@markup.link.label"] = { underline = true },
    ["@markup.link.url"] = { fg = c.blue1 },
    ["@markup.list.checked"] = { fg = c.green },
    ["@markup.list.unchecked"] = { fg = c.red },
    ["@tag"] = { fg = c.white0 },
    ["@tag.builtin"] = { link = "@tag" },
    ["@tag.attribute"] = { fg = c.white },

    --- LSP semantic highlight ---
    ["@lsp.type.function"] = { link = "@function.call" },
    ["@lsp.typemod.function.definition"] = { link = "@function" },
    ["@lsp.typemod.function.declaration"] = { link = "@function" },
    ["@lsp.type.method"] = { link = "@method.call" },
    ["@lsp.typemod.method.definition"] = { link = "@function" },
    ["@lsp.typemod.method.declaration"] = { link = "@function" },
    ["@lsp.typemod.variable.definition"] = { fg = c.green }, -- Variable definition
    ["@lsp.typemod.variable.declaration"] = {
        link = "@lsp.typemod.variable.definition",
    },

    --- Plugins ---
    -- mini.icons
    MiniIconsAzure = { fg = c.blue1 },
    MiniIconsBlue = { fg = c.blue },
    MiniIconsCyan = { fg = c.cyan },
    MiniIconsGreen = { fg = c.green },
    MiniIconsGrey = { fg = c.gray1 },
    MiniIconsOrange = { fg = c.yellow },
    MiniIconsPurple = { fg = c.purple },
    MiniIconsRed = { fg = c.red },
    MiniIconsYellow = { fg = c.yellow1 },
}

vim.cmd.highlight("clear")
vim.cmd.syntax("reset")
vim.o.termguicolors = true
vim.o.background = "dark"
vim.g.colors_name = "lim"

for key, val in pairs(hls) do
    vim.api.nvim_set_hl(0, key, val)
end

-- Enabled by default
if vim.g.lim_terminal_colors ~= false then
    vim.g.terminal_color_0 = c.black
    vim.g.terminal_color_1 = c.red
    vim.g.terminal_color_2 = c.green
    vim.g.terminal_color_3 = c.yellow
    vim.g.terminal_color_4 = c.blue
    vim.g.terminal_color_5 = c.purple
    vim.g.terminal_color_6 = c.cyan
    vim.g.terminal_color_7 = c.white
    vim.g.terminal_color_8 = c.black1
    vim.g.terminal_color_9 = c.red1
    vim.g.terminal_color_10 = c.green1
    vim.g.terminal_color_11 = c.yellow1
    vim.g.terminal_color_12 = c.blue1
    vim.g.terminal_color_13 = c.purple1
    vim.g.terminal_color_14 = c.cyan1
    vim.g.terminal_color_15 = c.white1
end
