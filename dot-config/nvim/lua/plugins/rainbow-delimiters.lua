return {
    enabled = false,
    "HiPhish/rainbow-delimiters.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = {
        query = {
            lua = "rainbow-blocks",
            query = "rainbow-blocks",
        },
    },
}
