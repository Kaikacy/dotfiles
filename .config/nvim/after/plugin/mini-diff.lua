vim.api.nvim_create_autocmd({"BufReadPre", "BufNewFile"}, {
    once = true,
    callback = function()
        vim.cmd.packadd("mini.diff")
        require("mini.diff").setup()
    end
})
