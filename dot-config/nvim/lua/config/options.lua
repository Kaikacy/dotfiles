local o = vim.o
local g = vim.g

g.mapleader = " "
g.maplocalleader = ","

o.number = true
o.relativenumber = true

o.mouse = ""

o.confirm = true

o.breakindent = true
o.tabstop = 4
o.shiftwidth = 0
o.shiftround = true
o.expandtab = true
o.smartindent = true
o.cinwords = ""
o.copyindent = true
o.smarttab = true

o.linebreak = true

o.autowrite = true

o.cursorline = true
o.cursorlineopt = "number"

o.showmode = false

o.undofile = true
o.swapfile = false

o.ignorecase = true
o.smartcase = true

o.signcolumn = "yes"

o.inccommand = "split"

o.scrolloff = 8

o.splitbelow = true
o.splitright = true

o.smoothscroll = true

o.timeoutlen = 500
o.updatetime = 300

o.completeopt = "menu,menuone,noinsert,preview"
o.pumheight = 15

o.virtualedit = "block"

o.list = true
o.listchars = "tab: ,trail:˗,multispace:·,lead: ,nbsp:␣"

o.fillchars = "horiz:━,horizup:┻,horizdown:┳,vert:┃,vertleft:┫,vertright:┣,verthoriz:╋,eob: "

o.conceallevel = 2

o.colorcolumn = "100"

o.showtabline = 2
o.laststatus = 3
