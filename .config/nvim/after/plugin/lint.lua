vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        vim.cmd.packadd("nvim-lint")
        local lint = require("lint")
        lint.linters_by_ft = {}

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            callback = function()
                lint.try_lint()
                -- lint.try_lint("codespell")
            end,
        })

        vim.keymap.set("n", "gl", lint.try_lint)
    end,
})
