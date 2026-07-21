vim.g.buffers_config = {
    icons = true,
    formatter = "filename_first",
}

local buffers = require("buffers")

vim.keymap.set("n", "<TAB>", buffers.switch)
vim.keymap.set("n", "<S-TAB>", buffers.delete)
