return {
    "folke/persistence.nvim",
    event = "BufReadPre",
    -- stylua: ignore
    keys = {
        { "<LEADER>qs", function() require("persistence").load() end },
        { "<LEADER>qa", function() require("persistence").select() end },
        { "<LEADER>ql", function() require("persistence").load({last=true}) end },
        { "<LEADER>qd", function() require("persistence").stop() end },
    },
    opts = {},
}
