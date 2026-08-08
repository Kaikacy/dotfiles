vim.api.nvim_set_hl(0, "BlinkCmpLabelMatch", { link = "PmenuMatch" })

require("blink.cmp").setup({
    keymap = {
        preset = "default",
        ["<C-k>"] = { "fallback" },
        ["<C-s>"] = { "show_signature", "hide_signature" },
        ["<A-f>"] = { "scroll_signature_down" },
        ["<A-b>"] = { "scroll_signature_up" },
    },
    completion = {
        menu = {
            max_height = vim.o.pumheight,
            draw = {
                components = {
                    kind_icon = {
                        text = function(ctx)
                            local kind_icon, _, _ =
                                require("mini.icons").get("lsp", ctx.kind)
                            return kind_icon
                        end,
                        highlight = function(ctx)
                            local _, hl, _ =
                                require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end,
                    },
                    kind = {
                        highlight = function(ctx)
                            local _, hl, _ =
                                require("mini.icons").get("lsp", ctx.kind)
                            return hl
                        end,
                    },
                },
            },
        },
    },
    signature = {
        enabled = true,
    },
    appearance = {
        nerd_font_variant = "normal",
    },
})
