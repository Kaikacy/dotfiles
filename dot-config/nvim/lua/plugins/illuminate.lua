return {
    "RRethy/vim-illuminate",
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        require("illuminate").configure({
            delay = 500,
            modes_allowlist = { "n", "c" },
        })
    end,
}
