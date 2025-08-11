local o = vim.o
local g = vim.g
local opt = vim.opt

g.mapleader = " "
g.maplocalleader = " "

o.number = true
o.relativenumber = true

o.mouse = ""

o.confirm = true

o.breakindent = true
o.tabstop = 4
o.shiftwidth = 0
o.shiftround = true
o.expandtab = true
o.autoindent = true
o.copyindent = true
o.smarttab = true

o.linebreak = true
o.showbreak = "+++ "

o.undofile = true
o.swapfile = false

o.ignorecase = true
o.smartcase = true

o.signcolumn = "yes"

o.inccommand = "split"

o.fillchars = "eob: "

o.scrolloff = 7
o.smoothscroll = true

o.splitbelow = true
o.splitright = true

o.completeopt = "fuzzy,menu,menuone,noinsert,popup"
o.pumheight = 10

o.winborder = "single"

o.virtualedit = "block"

o.list = true
o.listchars = "tab: ,trail:𜸎,multispace:·,lead: ,nbsp:␣"

o.colorcolumn = "100"

o.conceallevel = 2

o.foldmethod = "expr"
o.foldexpr = "v:lua.vim.treesitter.foldexpr()"
o.foldlevel = 99
-- o.foldnestmax = 4

o.cursorline = true
o.cursorlineopt = "number"

o.showmode = false
