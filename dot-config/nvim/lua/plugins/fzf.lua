return {
    "ibhagwan/fzf-lua",
    dependencies = { "echasnovski/mini.icons" },
    config = function()
        local fzf = require("fzf-lua")
        fzf.setup({
            fzf_colors = true,
            winopts = {
                border = "single",
                fullscreen = true,
                preview = {
                    delay = 60,
                    border = "single",
                    horizontal = "right:55%",
                    scrollbar = "border",
                },
            },
            keymap = {
                builtin = {
                    true,
                    ["<C-d>"] = "preview-half-page-down",
                    ["<C-u>"] = "preview-half-page-up",
                    ["<C-r>"] = "preview-reset",
                    ["<TAB>"] = "toggle+down",
                    ["<S-TAB>"] = "toggle+up",
                    ["<A-a>"] = "toggle-all",
                },
                fzf = {
                    ["ctrl-f"] = "half-page-down",
                    ["ctrl-b"] = "half-page-up",
                    ["ctrl-i"] = "beginning-of-line",
                    ["ctrl-a"] = "beginning-of-line",
                    ["ctrl-d"] = "preview-half-page-down",
                    ["ctrl-u"] = "preview-half-page-up",
                    ["tab"] = "toggle+down",
                    ["shift-tab"] = "toggle+up",
                    ["alt-a"] = "toggle-all",
                },
            },
            previewers = {
                builtin = {
                    extensions = {
                        ["png"] = { "ueberzug" },
                        ["jpg"] = { "ueberzug" },
                        ["jpeg"] = { "ueberzug" },
                    },
                },
            },
            files = {
                hidden = false,
                formatter = "path.filename_first",
            },
        })

        fzf.register_ui_select()

        -- KEYMAPS --
        local map = vim.keymap.set

        local function with(func, opts)
            opts = opts or {}
            return function()
                func(opts)
            end
        end

        -- stylua: ignore start
        map("n", "<C-p>", fzf.files, { desc = "Find files" })
        map("n", "<LEADER>ff", fzf.files, { desc = "Find files" })
        map("n", "<LEADER>fo", fzf.oldfiles, { desc = "Old files" })
        map("n", "<C-/>", fzf.grep, { desc = "Grep" })
        map("n", "<LEADER>/", fzf.grep_visual, { desc = "Grep visual selection" })
        map("n", "<LEADER>z", fzf.zoxide, { desc = "Zoxide" })
        map("n", "<LEADER>fc", with(fzf.files, { cwd = vim.fn.stdpath("config") }), { desc = "Find config files" })
        map("n", "<LEADER>sh", fzf.helptags, { desc = "Search help" })
        map("n", "<LEADER>sk", fzf.keymaps, { desc = "Search keymaps" })
        map( "n", "<LEADER>sc", with(fzf.colorschemes, { winopts = { fullscreen = false } }), { desc = "Search colorschemes" })
        map("n", "<LEADER>st", fzf.treesitter, { desc = "Search treesitter symbols" })
        map("n", "<LEADER>sM", fzf.manpages, { desc = "Search man pages" })
        map("n", "<LEADER>sm", fzf.marks, { desc = "Search marks" })
        map("n", "<LEADER>sH", fzf.highlights, { desc = "Search highlights" })
        map("n", "<LEADER>sa", fzf.autocmds, { desc = "Search autocmds" })
        map("n", "<LEADER>so", fzf.nvim_options, { desc = "Search options" })
        map("n", "<LEADER>sj", fzf.jumps, { desc = "Search jumps" })
        map("n", "<LEADER>:", fzf.command_history, { desc = "Command history" })
        map("n", "<LEADER>?", fzf.search_history, { desc = "Search history" })
        map("n", "<LEADER>gf", fzf.git_files, { desc = "Search git files" })
        map("n", "<LEADER>gs", fzf.git_status, { desc = "Git status" })
        map("n", "<LEADER>gd", fzf.git_diff, { desc = "Git diff" })
        map("n", "<LEADER>gh", fzf.git_hunks, { desc = "Git hunks" })
        map("n", "<LEADER>gc", fzf.git_commits, { desc = "Git commits" })
        -- stylua: ignore end
    end,
}
