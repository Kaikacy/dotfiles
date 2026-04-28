local function setup()
    vim.cmd.packadd("conform.nvim")
    require("conform").setup({
        notify_on_error = true,
        formatters_by_ft = {
            lua = { "stylua" },
            c = { "clang-format" },
            cpp = { "clang-format" },
        },
        default_format_opts = {
            lsp_format = "fallback",
        },
        format_after_save = function(buf)
            if vim.g.format_on_save_disable or vim.b[buf].format_on_save_disable then
                return
            else
                return { timeout_ms = 700 }
            end
        end,
        formatters = {
            ["clang-format"] = {
                append_args = { "--fallback-style", "none" },
            },
        },
    })

    vim.o.formatexpr = "v:lua.require('conform').formatexpr()"

    vim.api.nvim_create_user_command("FormatOff", function(args)
        if args.bang then
            vim.b.format_on_save_disable = true
            vim.notify("Format-on-save disabled locally", vim.log.levels.INFO)
        else
            vim.g.format_on_save_disable = true
            vim.notify("Format-on-save disabled globally", vim.log.levels.INFO)
        end
    end, {
        bang = true,
        desc = "Disable format-on-save",
    })

    vim.api.nvim_create_user_command("FormatOn", function(args)
        if args.bang then
            vim.b.format_on_save_disable = false
            vim.notify("Format-on-save enabled locally", vim.log.levels.INFO)
        else
            vim.g.format_on_save_disable = false
            vim.notify("Format-on-save enabled globally", vim.log.levels.INFO)
        end
    end, {
        bang = true,
        desc = "Enable format-on-save",
    })
end

vim.api.nvim_create_autocmd("BufWritePre", {
    once = true,
    callback = setup,
})
vim.api.nvim_create_autocmd("CmdUndefined", {
    pattern = { "ConformInfo", "FormatOff", "FormatOn" },
    once = true,
    callback = setup,
})
