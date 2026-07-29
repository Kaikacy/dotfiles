local hooks = {
    ["nvim-treesitter"] = function(data)
        if data.kind == "update" then vim.cmd("TSUpdate") end
    end,
    ["fff.nvim"] = function(data)
        if data.kind == "install" or data.kind == "update" then
            require("fff.download").download_or_build_binary()
        end
    end,
}

vim.api.nvim_create_autocmd("PackChanged", {
    desc = "Plugin hooks",
    callback = function(ev)
        local name = ev.data.spec.name
        if hooks[name] then hooks[name](ev.data) end
    end,
})

local function gh(path, data, version, name)
    return {
        src = "https://github.com/" .. path,
        data = data,
        version = version,
        name = name,
    }
end
vim.pack.add({
    gh("nvim-treesitter/nvim-treesitter"),
    gh("dmtrKovalenko/fff.nvim"),
    gh("saghen/blink.cmp", nil, vim.version.range("1.*")),
    gh("nvim-mini/mini.nvim"),
    gh("nvim-treesitter/nvim-treesitter-textobjects"),
    gh("nvim-treesitter/nvim-treesitter-context"),
    gh("stevearc/conform.nvim", { lazy = true }),
    gh("nmac427/guess-indent.nvim"),
    gh("mfussenegger/nvim-lint", { lazy = true }),
    gh("folke/persistence.nvim"),
    gh("kylechui/nvim-surround", nil, vim.version.range("^4.0.0")),
    gh("tpope/vim-fugitive"),
    gh("neovim/nvim-lspconfig"),
}, {
    load = function(plug_data)
        if plug_data.spec.data and plug_data.spec.data.lazy then return end
        vim.cmd.packadd(plug_data.spec.name)
    end,
})

-- Local plugins
vim.cmd.packadd("blackbg.nvim")
vim.cmd.packadd("buffers.nvim")
