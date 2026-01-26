local map = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- yank/paste to/from system clipboard
map({ "n", "v" }, "<leader>y", '"+y')
map({ "n", "v" }, "<leader>Y", '"+y$')
map({ "n", "v" }, "<leader>p", '"+p')
map({ "n", "v" }, "<leader>P", '"+P')

-- by default <tab> and <C-i> are equivalent
map("n", "<C-i>", "<C-i>")

map("t", "<C-esc>", "<C-\\><C-n>")
map({ "n", "t" }, "<C-;>", "<cmd>TermToggleFloating<cr>", { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<C-cr>", "<cmd>TermToggleHorizontal<cr>", { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<C-/>", "<cmd>TermToggleVertical<cr>", { desc = "Toggle vertical terminal" })
