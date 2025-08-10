return {
    "sainnhe/sonokai",
    lazy = false,
    priority = 1000,
    config = function()
        vim.g.sonokai_float_style = "dim"
        vim.g.sonokai_diagnostic_virtual_text = "colored"
        vim.cmd.colorscheme("sonokai")
        vim.api.nvim_set_hl(0, "LspCodeLens", { link = "LineNr" })
    end,
}
