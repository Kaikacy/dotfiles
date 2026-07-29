return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    -- stylua: ignore
    opts = {},
    keys = {
        { "<leader>qs", function() require("persistence").load() end },
        { "<leader>qa", function() require("persistence").select() end },
        { "<leader>ql", function() require("persistence").load({last=true}) end },
        { "<leader>qd", function() require("persistence").stop() end },
    },
}
