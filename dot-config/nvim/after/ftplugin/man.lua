local map = vim.keymap.set

map("n", "q", "<CMD>quit<CR>", { nowait = true, buf = 0 })

-- regex for man references (similar to git-push(1))
local man_ref_regex = [[[a-zA-Z_-]\+([a-z0-9]\{-1,})]]

-- search for other man references in visible buffer
map(
    "n",
    "<cr>",
    function() vim.fn.search(man_ref_regex, "", vim.fn.line("w$")) end,
    { desc = "Search manReference forward" }
)
map(
    "n",
    "<S-cr>",
    function() vim.fn.search(man_ref_regex, "b", vim.fn.line("w0")) end,
    { desc = "Search manReference backward" }
)
