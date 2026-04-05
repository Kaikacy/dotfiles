vim.api.nvim_create_autocmd({"BufReadPre", "BufNewFile", "CmdUndefined"}, {
    pattern = "GuessIndent",
    once = true,
    callback = function()
        vim.cmd.packadd("guess-indent.nvim")
        require("guess-indent").setup()
    end
})
