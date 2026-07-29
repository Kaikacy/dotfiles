-- Disable entire builit-in ftplugin mappings to avoid conflicts
vim.g.no_plugin_maps = true

require("nvim-treesitter-textobjects").setup({
    select = {
        lookahead = true,
        include_surrounding_whitespace = true,
    },
    move = {
        set_jump = true,
    },
})

local select_keymaps = {
    ["ia"] = "@parameter.inner",
    ["aa"] = "@parameter.outer",
    ["if"] = "@function.inner",
    ["af"] = "@function.outer",
    ["im"] = "@call.inner",
    ["am"] = "@call.outer",
    ["i?"] = "@conditional.inner",
    ["a?"] = "@conditional.outer",
    ["il"] = "@loop.inner",
    ["al"] = "@loop.outer",
    ["ik"] = "@block.inner",
    ["ak"] = "@block.outer",
    ["ic"] = "@class.inner",
    ["ac"] = "@class.outer",
    ["io"] = "@comment.inner",
    ["ao"] = "@comment.outer",
    ["i@"] = "@attribute.inner",
    ["a@"] = "@attribute.outer",
    ["ir"] = "@return.inner",
    ["ar"] = "@return.outer",
    ["ae"] = "@statement.outer",
    ["i="] = "@assignment.inner",
    ["a="] = "@assignment.outer",
    ["-l"] = "@assignment.lhs",
    ["-r"] = "@assignment.rhs",
}
for key, capture in pairs(select_keymaps) do
    vim.keymap.set(
        { "x", "o" },
        key,
        function() require("nvim-treesitter-textobjects.select").select_textobject(capture, "textobjects") end
    )
end

local swap_keymaps = {
    swap_next = {
        ["]<C-f>"] = "@function.outer",
        ["]<C-a>"] = "@parameter.inner",
    },
    swap_previous = {
        ["[<C-f>"] = "@function.outer",
        ["[<C-a>"] = "@parameter.inner",
    },
}
for action, mappings in pairs(swap_keymaps) do
    for key, capture in pairs(mappings) do
        vim.keymap.set("n", key, function() require("nvim-treesitter-textobjects.swap")[action](capture) end)
    end
end

local move_keymaps = {
    goto_next_start = {
        ["]a"] = "@parameter.inner",
        ["]o"] = "@comment.outer",
        ["]F"] = "@function.outer",
        ["]M"] = "@call.outer",
        ["]C"] = "@class.outer",
    },
    goto_previous_start = {
        ["[a"] = "@parameter.inner",
        ["[o"] = "@comment.outer",
        ["[F"] = "@function.outer",
        ["[M"] = "@call.outer",
        ["[C"] = "@class.outer",
    },
    goto_next_end = {
        ["]A"] = "@parameter.inner",
        ["]O"] = "@comment.outer",
    },
    goto_previous_end = {
        ["[A"] = "@parameter.inner",
        ["[O"] = "@comment.outer",
    },
    goto_next = {
        ["]m"] = "@call.outer",
        ["]f"] = "@function.outer",
        ["]c"] = "@class.outer",
        ["]v"] = "@assignment.rhs",
        ["]?"] = "@conditional.outer",
    },
    goto_previous = {
        ["[m"] = "@call.outer",
        ["[f"] = "@function.outer",
        ["[c"] = "@class.outer",
        ["[v"] = "@assignment.rhs",
        ["[?"] = "@conditional.outer",
    },
}
for action, mappings in pairs(move_keymaps) do
    for key, capture in pairs(mappings) do
        vim.keymap.set(
            "n",
            key,
            function() require("nvim-treesitter-textobjects.move")[action](capture, "textobjects") end
        )
    end
end
