return {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",

                        ["aa"] = "@parameter.outer",
                        ["ia"] = "@parameter.inner",

                        ["a/"] = "@conditional.outer",
                        ["i/"] = "@conditional.inner",

                        ["ac"] = "@comment.outer",
                        ["ic"] = "@comment.inner",

                        ["am"] = "@call.outer",
                        ["im"] = "@call.inner",

                        ["a="] = "@assignment.outer",
                        ["i="] = "@assignment.inner",
                        ["-l"] = "@assignment.lhs",
                        ["-r"] = "@assignment.rhs",

                        ["ar"] = "@return.outer",
                        ["ir"] = "@return.inner",

                        ["al"] = "@statement.outer",

                        ["in"] = "@number.inner",

                        ["ik"] = "@block.inner",
                        ["ak"] = "@block.outer",
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true,
                    goto_next_start = {
                        ["]f"] = "@function.outer",
                        ["]a"] = "@parameter.inner",
                        ["]k"] = "@block.outer",
                        ["]c"] = "@comment.outer",
                        ["]m"] = "@call.outer",
                        ["]/"] = "@conditional.outer",
                        ["]r"] = "@return.inner",
                    },
                    goto_next_end = {
                        ["]F"] = "@function.outer",
                        ["]A"] = "@parameter.inner",
                        ["]K"] = "@block.outer",
                        ["]C"] = "@comment.outer",
                        ["]M"] = "@call.outer",
                        ["]?"] = "@conditional.outer",
                        ["]R"] = "@return.inner",
                    },
                    goto_previous_start = {
                        ["[f"] = "@function.outer",
                        ["[a"] = "@parameter.inner",
                        ["[k"] = "@block.outer",
                        ["[c"] = "@comment.outer",
                        ["[m"] = "@call.outer",
                        ["[/"] = "@conditional.outer",
                        ["[r"] = "@return.inner",
                    },
                    goto_previous_end = {
                        ["[F"] = "@function.outer",
                        ["[A"] = "@parameter.inner",
                        ["[K"] = "@block.outer",
                        ["[C"] = "@comment.outer",
                        ["[M"] = "@call.outer",
                        ["[?"] = "@conditional.outer",
                        ["[R"] = "@return.inner",
                    },
                },
                swap = {
                    enable = true,
                    swap_next = {
                        ["]<C-f>"] = "@function.outer",
                        ["]<C-a>"] = "@parameter.inner",
                    },
                    swap_previous = {
                        ["[<C-f>"] = "@function.outer",
                        ["[<C-a>"] = "@parameter.inner",
                    },
                },
            },
        })

        local ts_repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
        vim.keymap.set({ "n", "x", "o" }, ";", ts_repeat_move.repeat_last_move)
        vim.keymap.set({ "n", "x", "o" }, ",", ts_repeat_move.repeat_last_move_opposite)
        vim.keymap.set({ "n", "x", "o" }, "f", ts_repeat_move.builtin_f_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "F", ts_repeat_move.builtin_F_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "t", ts_repeat_move.builtin_t_expr, { expr = true })
        vim.keymap.set({ "n", "x", "o" }, "T", ts_repeat_move.builtin_T_expr, { expr = true })
    end,
}
