---@param mode string|string[]
---@param lhs string
---@param rhs string|function
---@param desc string?
---@param opts vim.keymap.set.Opts?
local map = function(mode, lhs, rhs, desc, opts)
	opts = opts or {}
	opts.desc = desc
	vim.keymap.set(mode, lhs, rhs, opts)
end

map({ "n", "x" }, ";", ":", "; instead of :")

-- multicursor edits in block mode doesn't get applied when C-c
map({ "i", "v", "o" }, "<C-c>", "<esc>")

map("n", "<esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

map("t", "<C-esc>", "<C-\\><C-n>", "exit terminal mode")

map({ "n", "x" }, "<A-y>", '"+y', "Copy to system clipboard")

map("i", "<C-h>", "<left>", "Left")
map("i", "<C-l>", "<right>", "Right")

-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", "Down", { expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", "Up", { expr = true, silent = true })

-- move line
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", "Move down")
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", "Move up")
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", "Move down")
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", "Move up")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", "Move down")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", "Move up")

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", "Add comment below")
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", "Add comment above")

map("n", "<C-j>", "<C-w>j", "Focus down")
map("n", "<C-k>", "<C-w>k", "Focus up")
map("n", "<C-h>", "<C-w>h", "Focus left")
map("n", "<C-l>", "<C-w>l", "Focus right")

map("n", "<C-S-j>", "<cmd>resize +2<cr>", "Resize down")
map("n", "<C-S-k>", "<cmd>resize -2<cr>", "Resize up")
map("n", "<C-S-h>", "<cmd>vert resize -2<cr>", "Resize left")
map("n", "<C-S-l>", "<cmd>vert resize +2<cr>", "Resize right")

map("n", "|", "<cmd>split<cr>", "Split below")
map("n", "\\", "<cmd>vsplit<cr>", "Split right")

map("n", "<Tab>", "<cmd>bnext<cr>", "Next buffer")
map("n", "<S-Tab>", "<cmd>bprev<cr>", "Previous buffer")

map("n", "<leader>n", "<cmd>enew<cr>", "New buffer")

map({ "n", "t" }, "<C-;>", "<cmd>TermToggleFloating<cr>", "Toggle floating terminal")
map({ "n", "t" }, "<C-cr>", "<cmd>TermToggleHorizontal<cr>", "Toggle horizontal terminal")
map({ "n", "t" }, "<C-\\>", "<cmd>TermToggleVertical<cr>", "Toggle vertical terminal")

map("n", "<leader>tn", "<cmd>tabnew<cr>", "Create new tab")
map("n", "<leader>tc", "<cmd>tabclose<cr>", "Close tab")

map("n", "<leader>L", "<cmd>Lazy<cr>", "Lazy")
