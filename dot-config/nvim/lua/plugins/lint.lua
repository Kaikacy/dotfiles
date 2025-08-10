return {
    "mfussenegger/nvim-lint",
    event = {
        "BufReadPost",
        "BufNewFile",
    },
    keys = {
        {
            mode = "n",
            "grl",
            function()
                require("lint").try_lint()
            end,
            desc = "Try linting buffer",
        },
    },
    config = function()
        local lint = require("lint")
        lint.linters_by_ft = {
            bash = { "shellcheck" },
            sh = { "shellcheck" },
        }

        vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave", "TextChanged" }, {
            group = vim.api.nvim_create_augroup("user-lint", {}),
            callback = function()
                lint.try_lint()
                lint.try_lint("codespell")
            end,
        })
    end,
}
