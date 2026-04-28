local persistence = require("persistence")
persistence.setup()

local map = vim.keymap.set

map("n", "<LEADER>qa", persistence.load)
map("n", "<LEADER>qe", persistence.select)
map("n", "<LEADER>ql", function() persistence.load({ last = true }) end)
map("n", "<LEADER>qs", persistence.stop)
