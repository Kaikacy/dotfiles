-- icons
local icons = require("mini.icons")
icons.setup()
icons.mock_nvim_web_devicons()

-- diff, hipatterns
vim.api.nvim_create_autocmd({ "BufReadPre", "BufNewFile" }, {
    once = true,
    callback = function()
        require("mini.diff").setup()
        local hipatterns = require("mini.hipatterns")
        hipatterns.setup({
            highlighters = {
                hex_color = hipatterns.gen_highlighter.hex_color(),
                fixme = { pattern = "FIXME", group = "@comment.error" },
                hack = { pattern = "HACK", group = "@comment.warning" },
                todo = { pattern = "TODO", group = "@comment.todo" },
                note = { pattern = "NOTE", group = "@comment.note" },
            },
        })
    end,
})

-- test
vim.api.nvim_create_autocmd("FileType", {
    pattern = "lua",
    once = true,
    callback = function()
        local test = require("mini.test")
        test.setup()

        vim.keymap.set("n", "<LEADER>tf", test.run_file)
        vim.keymap.set("n", "<LEADER>tl", test.run_at_location)
    end,
})
