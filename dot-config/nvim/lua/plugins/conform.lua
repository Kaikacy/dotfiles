return {
    "stevearc/conform.nvim",
    dependencies = { "mason-org/mason.nvim" },
    event = "BufWritePre",
    cmd = { "ConformInfo", "FormatDisable", "FormatEnable" },
    keys = {
        {
            mode = { "n", "v" },
            "grf",
            function()
                require("conform").format({ async = true })
            end,
            desc = "Format buffer",
        },
        {
            "<LEADER>C",
            "<CMD>ConformInfo<CR>",
        },
    },
    config = function()
        local conform = require("conform")
        conform.setup({
            notify_on_error = true,
            format_after_save = function(bufnr)
                if vim.g.format_on_save_disable or vim.b[bufnr].format_on_save_disable then
                    return
                end
                return {
                    lsp_format = "fallback",
                    timeout_ms = 700,
                }
            end,
            formatters_by_ft = {
                c = { "clang-format" },
                lua = { "stylua" },
                json = { "prettierd" },
                jsonc = { "prettierd" },
                bash = { "shfmt" },
                sh = { "shfmt" },
                toml = { "taplo" },
            },
            formatters = {
                ["clang-format"] = {
                    prepend_args = { "--fallback-style", "none" },
                },
            },
        })

        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                vim.b.format_on_save_disable = true
            else
                vim.g.format_on_save_disable = true
            end
        end, {
            bang = true,
            desc = "Disable format-on-save",
        })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.format_on_save_disable = false
            vim.g.format_on_save_disable = false
        end, {
            desc = "Enable format-on-save",
        })
    end,
}
