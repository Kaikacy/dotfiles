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

-- multicursor edits in block mode doesn't get applied when C-c
map({ "i", "v", "o" }, "<C-c>", "<esc>")

map("n", "<esc>", "<cmd>nohlsearch<cr>", "Clear search highlight")

map("t", "<C-esc>", "<C-\\><C-n>", "exit terminal mode")

map({ "n", "x" }, "<A-y>", '"+y', "Copy to system clipboard")

map("!", "<C-h>", "<left>", "Left")
map("!", "<C-l>", "<right>", "Right")

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
map("n", "gco", "ox<esc><cmd> normal gcc<cr>A<bs>", "Add comment below")
map("n", "gcO", "Ox<esc><cmd> normal gcc<cr>A<bs>", "Add comment above")

map("n", "<C-j>", "<C-w>j", "Focus down")
map("n", "<C-k>", "<C-w>k", "Focus up")
map("n", "<C-h>", "<C-w>h", "Focus left")
map("n", "<C-l>", "<C-w>l", "Focus right")

map("n", "<A-S-j>", "2<C-w>-", "Decrease height")
map("n", "<A-S-k>", "2<C-w>+", "Increase height")
map("n", "<A-S-h>", "2<C-w><", "Decrease width")
map("n", "<A-S-l>", "2<C-w>>", "Increase height")

map("n", "|", "<cmd>split<cr>", "Split below")
map("n", "\\", "<cmd>vsplit<cr>", "Split right")

map("n", "<leader>n", "<cmd>enew<cr>", "New buffer")

map({ "n", "t" }, "<C-;>", "<cmd>TermToggleFloating<cr>", "Toggle floating terminal")
map({ "n", "t" }, "<C-cr>", "<cmd>TermToggleHorizontal<cr>", "Toggle horizontal terminal")
map({ "n", "t" }, "<C-\\>", "<cmd>TermToggleVertical<cr>", "Toggle vertical terminal")

map("n", "<leader>tn", "<cmd>tabnew<cr>", "Create new tab")
map("n", "<leader>tc", "<cmd>tabclose<cr>", "Close tab")

map("n", "<leader>L", "<cmd>Lazy<cr>", "Lazy")

-- tab and c-i are equivalent for vim compatibility reason
-- but can be separated like this, :help Tab for more
map("n", "<C-i>", "<C-i>")
map("n", "<Tab>", "<cmd>BuffersToggle<cr>", "Toggle buffers window")
