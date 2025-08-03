return {
    dir = "~/Code/other/nvim-plugins/buffers",
    keys = { "<TAB>", "<CMD>BuffersToggle<CR>" },
    config = function()
        ---@module "buffers"
        ---@type buffers.Config
        vim.g.buffers_config = {
            border = "none",
            close_keys = { "<ESC>", "<TAB>" },
        }
    end,
}
