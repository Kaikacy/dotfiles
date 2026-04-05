vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Plugin hooks",
    callback = function(ev)
        local kind, name = ev.data.kind, ev.data.spec.name
        if kind == "update" then
            if name == "nvim-treesitter" then
                if not ev.data.active then vim.cmd.packadd("nvim-treesitter") end
                vim.cmd("TSUpdate")
            elseif name == "fff.nvim" then
                require("fff.download").download_or_build_binary()
            end
        end
    end,
})

local gh = "https://github.com/"
vim.pack.add({
    gh .. "nvim-treesitter/nvim-treesitter",
    gh .. "dmtrKovalenko/fff.nvim",
    gh .. "nvim-mini/mini.icons",
    { src = gh .. "nvim-mini/mini.test", data = { lazy = true } },
    { src = gh .. "nvim-mini/mini.diff", data = { lazy = true } },
    gh .. "nvim-treesitter/nvim-treesitter-textobjects",
    gh .. "nvim-treesitter/nvim-treesitter-context",
    { src = gh .. "stevearc/conform.nvim", data = { lazy = true } },
    { src = gh .. "nmac428/guess-indent.nvim", data = { lazy = true } },
    { src = gh .. "mfussenegger/nvim-lint", data = { lazy = true } },
    gh .. "folke/persistence.nvim",
    { src = gh .. "kylechui/nvim-surround", version = vim.version.range("^4.0.0") },
    gh .. "tpope/vim-fugitive",
}, {
    load = function(plug_data)
        if plug_data.spec.data and plug_data.spec.data.lazy then return end
        vim.cmd.packadd(plug_data.spec.name)
    end,
})

-- Local plugins
vim.cmd.packadd("seashells.nvim")
vim.cmd.packadd("omb.nvim")
