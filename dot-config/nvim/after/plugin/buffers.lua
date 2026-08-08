vim.g.buffers_config = {
    formatter = "filename_first",
    close_keys = { "<TAB>", "<ESC>" },
}

local buffers = require("buffers")

vim.keymap.set("n", "<TAB>", buffers.switch)
vim.keymap.set("n", "<A-TAB>", buffers.delete)
