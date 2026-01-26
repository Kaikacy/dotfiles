local o = vim.o
local g = vim.g

g.c_syntax_for_h = true -- ft=c for header files

o.exrc = true -- allow project-local configs
o.number = true
o.relativenumber = true
o.undofile = true
o.swapfile = false
o.tabstop = 4 -- tab character (\t) size
o.shiftwidth = 0 -- indent width (copy tabstop value)
o.expandtab = true -- use spaces
o.shiftround = true -- round indent to multiple of shiftwidth
o.autoindent = true -- copy indent when starting a new line
o.copyindent = true -- copy indent structure when autoindenting
o.breakindent = true -- indent wrapped lines
o.linebreak = true -- wrap lines at word separators
o.showbreak = "──"
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.inccommand = "split"
o.scrolloff = 8
o.splitbelow = true
o.splitright = true
o.completeopt = "fuzzy,menu,menuone,popup,preview"
o.pumheight = 15
o.list = true
o.listchars = "tab: ,trail:𜸎,multispace:∙,lead: ,nbsp:␣"
o.foldlevel = 99 -- start with all folds open
o.virtualedit = "block" -- better virtual-block mode
