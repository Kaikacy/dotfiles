return {
    {
        "stevearc/oil.nvim",
        dependencies = { "echasnovski/mini.icons" },
        keys = {
            { "<LEADER>e", "<CMD>Oil<CR>", desc = "Open oil" },
        },
        config = function()
            local oil = require("oil")
            function _G.get_oil_winbar()
                local bufnr = vim.api.nvim_win_get_buf(vim.g.statusline_winid)
                local dir = oil.get_current_dir(bufnr)
                if dir then
                    return vim.fn.fnamemodify(dir, ":~")
                else
                    -- If there is no current directory (e.g. over ssh), just show the buffer name
                    return vim.api.nvim_buf_get_name(0)
                end
            end
            local details = true
            oil.setup({
                delete_to_trash = true,
                skip_confirm_for_simple_edits = true,
                constrain_cursor = "name",
                columns = {
                    "permissions",
                    "size",
                    "mtime",
                    "icon",
                },
                win_options = {
                    signcolumn = "yes:2",
                    winbar = "%!v:lua.get_oil_winbar()",
                },
                view_options = {
                    show_hidden = true,
                },
                keymaps = {
                    ["<C-p>"] = false,
                    ["<LEADER>p"] = "actions.preview",
                    ["<BS>"] = { "actions.parent", mode = "n" },
                    ["gd"] = {
                        desc = "Toggle detail view",
                        callback = function()
                            details = not details
                            if details then
                                oil.set_columns({ "permissions", "size", "mtime", "icon" })
                            else
                                oil.set_columns({ "icon" })
                            end
                        end,
                    },
                },
            })
        end,
    },
    {
        "refractalize/oil-git-status.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {},
    },
    {
        "JezerM/oil-lsp-diagnostics.nvim",
        dependencies = { "stevearc/oil.nvim" },
        opts = {
            diagnostic_symbols = {
                error = "E",
                warn = "W",
                info = "I",
                hint = "H",
            },
        },
    },
}
