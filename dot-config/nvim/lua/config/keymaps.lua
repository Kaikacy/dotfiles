local map = vim.keymap.set

-- multiline edits doesn't get applied in visual block mode when using <C-c>
map({ "i", "v", "o" }, "<C-c>", "<ESC>")

map("n", "<ESC>", "<CMD>nohlsearch<CR>", { desc = "Clear search highlights" })

map("t", "<C-ESC>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

map({ "n", "v" }, "<LEADER>y", '"+y', { desc = "Yank to system clipboard" })

map("!", "<C-h>", "<LEFT>")
map("!", "<C-l>", "<RIGHT>")

-- move up/down on wrapped lines, except if count is specified
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })

-- move line up/down and indent correctly
map("n", "<A-j>", "<CMD>execute 'move .+' .. v:count1<CR>==")
map("n", "<A-k>", "<CMD>execute 'move .-' .. (v:count1 + 1)<CR>==")
map("i", "<A-j>", "<ESC><CMD>move .+1<CR>==gi")
map("i", "<A-k>", "<ESC><CMD>move .-2<CR>==gi")
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" .. v:count1<CR>gv=gv")
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '>-\" .. (v:count1 + 1)<CR>gv=gv")

-- keep last selection after indenting with <, >
map("v", "<", "<gv")
map("v", ">", ">gv")

map("n", "gco", "ox<ESC><CMD>normal gcc<CR>A<BS>", { desc = "Add comment below" })
map("n", "gcO", "Ox<ESC><CMD>normal gcc<CR>A<BS>", { desc = "Add comment above" })

-- focus left/right/up/down
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")

-- resize focused window
map("n", "<A-S-j>", "2<C-w>-")
map("n", "<A-S-k>", "2<C-w>+")
map("n", "<A-S-h>", "2<C-w><")
map("n", "<A-S-l>", "2<C-w>>")

map("n", "|", "<CMD>split<CR>")
map("n", "\\", "<CMD>vsplit<CR>")

map("n", "<LEADER>n", "<CMD>enew<CR>", { desc = "Create new buffer" })
map("n", "<LEADER>c", "<CMD>bdelete<CR>", { desc = "Close current buffer" })

-- by default <TAB> and <C-i> are equivalent
-- :h Tab for more
map("n", "<C-i>", "<C-i>")

map("n", "<LEADER>L", "<CMD>Lazy<CR>")

map({ "n", "t" }, "<C-;>", "<CMD>TermToggleFloating<CR>", { desc = "Toggle floating terminal" })
map({ "n", "t" }, "<C-CR>", "<CMD>TermToggleHorizontal<CR>", { desc = "Toggle horizontal terminal" })
map({ "n", "t" }, "<C-\\>", "<CMD>TermToggleVertical<CR>", { desc = "Toggle vertical terminal" })
