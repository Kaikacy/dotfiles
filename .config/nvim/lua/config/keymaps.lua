vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

map("n", "<LEADER>e", "<CMD>Explore<CR>", { desc = "Open netrw" })

map({ "n", "v" }, "<LEADER>y", '"+y', { desc = "Yank to system clipboard" })
map({ "n", "v" }, "<LEADER>Y", '"+y$', { desc = "Yank until end to system clipboard" })
map({ "n", "v" }, "<LEADER>p", '"+p', { desc = "Paste after from system clipboard" })
map({ "n", "v" }, "<LEADER>P", '"+P', { desc = "Paste before from system clipboard" })
map({ "n", "v" }, "<LEADER>]p", '"+]p', { desc = "Paste after from system clipboard and adjust indentation" })
map({ "n", "v" }, "<LEADER>[p", '"+[p', { desc = "Paste before from system clipboard and adjust indentation" })

-- By default <TAB> and <C-i> are equivalent
map("n", "<C-i>", "<C-i>")

-- Move line up/down and indent correctly
map("n", "<A-j>", "<CMD>execute 'move .+' .. v:count1<CR>==")
map("n", "<A-k>", "<CMD>execute 'move .-' .. (v:count1 + 1)<CR>==")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" .. v:count1<CR>gv=")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '>-\" .. (v:count1 + 1)<CR>gv=")

map("t", "<C-ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- TODO: builtin terminal script

map("n", "<LEADER>n", "<CMD>enew<CR>", { desc = "Edit new buffer" })
map("n", "<LEADER>bd", function() require("other.bufdelete").current() end, { desc = "Delete current buffer" })
map("n", "<LEADER>bD", function() require("other.bufdelete").others() end, { desc = "Delete other buffers" })

map("n", "<LEADER>tn", "<CMD>tabnew<CR>", { desc = "Create new tab" })
map("n", "<LEADER>tc", "<CMD>tabclose<CR>", { desc = "Close current tab" })
map("n", "<LEADER>tC", "<CMD>tabonly<CR>", { desc = "Close other tabs" })

map("n", "<LEADER>u", "<CMD>Undotree<CR>", { desc = "Open undotree" })

map("n", "<LEADER>xd", vim.diagnostic.setqflist, { desc = "Open diagnostics in qflist" })

map("n", "<LEADER>U", vim.pack.update, { desc = "Update plugins" })
