vim.cmd.packadd("nohlsearch")
vim.cmd.packadd("nvim.undotree")
vim.cmd.packadd("nvim.difftool")

require("config.options")
require("config.keymaps")
require("config.autocmds")
require("config.diagnostic")
require("config.lsp")

require("other.indent-guides")
require("other.notify")

require("plugins")
