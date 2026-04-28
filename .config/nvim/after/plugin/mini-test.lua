vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    once = true,
    callback = function()
        vim.cmd.packadd("mini.test")
        require("mini.test").setup()

        vim.keymap.set("n", "<LEADER>tf", MiniTest.run_file)
        vim.keymap.set("n", "<LEADER>tl", MiniTest.run_at_location)
    end,
})
