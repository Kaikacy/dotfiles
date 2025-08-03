return {
    "loctvl842/monokai-pro.nvim",
    config = function()
        require("monokai-pro").setup({
            ---@param c Colorscheme
            override = function(c)
                return {
                    NonText = { fg = c.base.dimmed4 },
                }
            end,
        })
        vim.cmd.colorscheme("monokai-pro-spectrum")
    end,
}
