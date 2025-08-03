return {
    "saghen/blink.cmp",
    version = "1.*",
    event = { "InsertEnter", "CmdlineEnter" },
    ---@module "blink.cmp"
    ---@type blink.cmp.Config
    opts = {
        keymap = {
            ["<C-u>"] = { "scroll_documentation_up", "fallback" },
            ["<C-d>"] = { "scroll_documentation_down", "fallback" },
        },
        appearance = {
            nerd_font_variant = "normal",
            kind_icons = {
                Array = "",
                Boolean = "󰔡",
                Text = "󰉿",
                Method = "",
                Function = "󰡱",
                Constructor = "󰒓",
                Field = "󰜢",
                Variable = "󰫧",
                Property = "󰖷",
                Class = "󰠱",
                Interface = "󱡠",
                Struct = "󰙅",
                Module = "󰅩",
                Package = "󰏗",
                Namespace = "󰦮",
                Object = "󰮄",
                Unit = "",
                Value = "󰎠",
                Enum = "",
                EnumMember = "",
                Keyword = "",
                Constant = "󰏿",
                Snippet = "󱄽",
                Color = "󰏘",
                File = "󰈔",
                Reference = "󰈇",
                Folder = "󰉋",
                Event = "",
                Operator = "󰆕",
                TypeParameter = "󰬛",
            },
        },
        completion = {
            menu = {
                max_height = vim.o.pumheight,
                draw = {
                    treesitter = { "lsp" },
                },
            },
            documentation = {
                auto_show = true,
            },
        },
        fuzzy = {
            sorts = {
                "exact",
                "score",
                "sort_text",
            },
        },
        sources = {
            default = { "lazydev", "lsp", "path", "snippets", "buffer" },
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            },
        },
    },
}
