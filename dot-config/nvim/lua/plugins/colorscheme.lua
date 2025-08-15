return {
    "Mofiqul/vscode.nvim",
    opts = {},
    config = function()
        local c = require("vscode.colors").get_colors()
        require("vscode").setup({
            italic_comments = true,
            group_overrides = {
                TreesitterContext = { bg = c.vscLeftDark },
                TreesitterContextLineNumber = { fg = c.vscSplitLight },
            },
        })
        vim.cmd("colorscheme vscode")
    end,
}
