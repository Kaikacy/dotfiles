return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { { "nvim-lua/plenary.nvim", lazy = true } },
    keys = {
        { "<LEADER>a", desc = "Add to harpoon" },
        { "<A-e>", desc = "Open harpoon menu" },
        { "<A-1>", desc = "Harpoon select 1" },
        { "<A-2>", desc = "Harpoon select 2" },
        { "<A-3>", desc = "Harpoon select 3" },
        { "<A-4>", desc = "Harpoon select 4" },
        { "<A-5>", desc = "Harpoon select 5" },
        { "<A-6>", desc = "Harpoon select 6" },
        { "<A-7>", desc = "Harpoon select 7" },
        { "<A-8>", desc = "Harpoon select 8" },
        { "<A-9>", desc = "Harpoon select 9" },
        { "<A-l>", desc = "Harpoon next" },
        { "<A-h>", desc = "Harpoon prev" },
    },
    config = function()
        local harpoon = require("harpoon")
        harpoon:setup()

        local map = vim.keymap.set
        -- stylua: ignore start
        map("n", "<LEADER>a", function() harpoon:list():add() end)
        map("n", "<A-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)
        map("n", "<A-1>", function() harpoon:list():select(1) end)
        map("n", "<A-2>", function() harpoon:list():select(2) end)
        map("n", "<A-3>", function() harpoon:list():select(3) end)
        map("n", "<A-4>", function() harpoon:list():select(4) end)
        map("n", "<A-5>", function() harpoon:list():select(5) end)
        map("n", "<A-6>", function() harpoon:list():select(6) end)
        map("n", "<A-7>", function() harpoon:list():select(7) end)
        map("n", "<A-8>", function() harpoon:list():select(8) end)
        map("n", "<A-9>", function() harpoon:list():select(9) end)
        map("n", "<A-l>", function() harpoon:list():next() end)
        map("n", "<A-h>", function() harpoon:list():prev() end)
        -- stylua: ignore end
    end,
}
