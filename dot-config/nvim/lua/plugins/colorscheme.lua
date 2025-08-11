return {
    "gbprod/nord.nvim",
    lazy = false,
    priority = 1000,
    config = function()
        require("nord").setup({
            ---@param c Nord.Palette
            on_highlights = function(hi, c)
                hi.TreesitterContextLineNumber = { fg = c.polar_night.light }
                hi.TreesitterContextBottom = { underline = true, sp = c.polar_night.brightest }
                hi.LspReferenceText = { bg = c.polar_night.bright }
                hi.IlluminatedWordText = { link = "LspReferenceText" }
                hi.IlluminatedWordRead = { link = "LspReferenceText" }
                hi.IlluminatedWordWrite = { link = "LspReferenceText" }
                hi.Pmenu = { bg = c.polar_night.origin }
                hi.BlinkCmpMenuSelection = { bg = c.polar_night.bright }
                hi.Special = { fg = c.frost.ice }
                hi.LeapBackdrop = { fg = c.polar_night.light, italic = false }
            end,
        })
        vim.cmd.colorscheme("nord")
    end,
}
