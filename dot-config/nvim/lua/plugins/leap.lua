return {
    "ggandor/leap.nvim",
    config = function()
        local leap = require("leap")
        leap.set_default_mappings()

        leap.opts.preview_filter = function(prev, curr, next)
            -- stylua: ignore
            return not (
                curr:match("%s") or
                prev:match("%a") and curr:match("%l") and next:match("%a")
            )
        end

        vim.keymap.set({ "n", "o" }, "gs", function()
            require("leap.remote").action()
        end)

        local remote_text_object = function(prefix)
            local ok, ch = pcall(vim.fn.getcharstr)
            if not ok or (ch == vim.keycode("<CR>")) then
                return
            end
            require("leap.remote").action({ input = prefix .. ch })
        end
        vim.keymap.set({ "o", "x" }, "ar", function()
            remote_text_object("a")
        end, { desc = "Around remote textobject" })
        vim.keymap.set({ "o", "x" }, "ir", function()
            remote_text_object("i")
        end, { desc = "Inside remote textobject" })
    end,
}
