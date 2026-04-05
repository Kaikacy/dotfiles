local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Yank/paste to/from system clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>Y", '"+y$')
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')

-- By default <tab> and <C-i> are equivalent
map("n", "<C-i>", "<C-i>")

-- Move up/down on wrapped lines, except if count is specified
-- map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
-- map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- Move line up/down and indent correctly
map("n", "<A-j>", "<cmd>execute 'move .+' .. v:count1<cr>==")
map("n", "<A-k>", "<cmd>execute 'move .-' .. (v:count1 + 1)<cr>==")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" .. v:count1<cr>gv=")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '>-\" .. (v:count1 + 1)<cr>gv=")

map("t", "<C-esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
map({ "n", "t" }, "<C-;>", "<cmd>TermToggleFloating<cr>", { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<C-cr>", "<cmd>TermToggleHorizontal<cr>", { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<C-/>", "<cmd>TermToggleVertical<cr>", { desc = "Toggle vertical terminal" })

map("n", "<leader>n", "<cmd>enew<cr>", { desc = "Edit new buffer" })
-- Delete buffer without disrupting window layout
map("n", "<leader>bd", function()
	require("other.bufdelete").current()
end, { desc = "Delete current buffer" })
map("n", "<leader>bD", function()
	require("other.bufdelete").others()
end, { desc = "Delete other buffers" })

map("n", "<leader>tn", "<cmd>tabnew<cr>", { desc = "Create new tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close current tab" })
map("n", "<leader>tC", "<cmd>tabonly<cr>", { desc = "Close other tabs" })

map("n", "<leader>sp", function()
	require("other.scratchpad").toggle()
end, { desc = "Toggle lua scratchpad" })
