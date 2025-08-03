return {
    "nvim-treesitter/nvim-treesitter",
    branch = "master",
    build = ":TSUpdate",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "nvim-treesitter/nvim-treesitter-context", opts = {} },
    },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "markdown",
                "markdown_inline",
                "vimdoc",
                "query",
            },
            auto_install = true,

            highlight = {
                enable = true,
                additional_vim_regex_highlighting = false,
            },

            indent = {
                enable = true,
            },

            incremental_selection = {
                enable = true,
                keymaps = {
                    init_selection = "<C-SPACE>",
                    node_incremental = "C-SPACE>",
                    node_decremental = "<BS>",
                    scope_incremental = false,
                },
            },
        })
    end,
}
