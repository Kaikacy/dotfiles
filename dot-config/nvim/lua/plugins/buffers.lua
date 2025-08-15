return {
    dir = "~/Code/other/nvim-plugins/buffers",
    keys = { { "<TAB>", "<CMD>BuffersToggle<CR>" } },
    config = function()
        ---@module "buffers"
        ---@type buffers.Config
        vim.g.buffers_config = {
            close_keys = { "<ESC>", "<TAB>" },
            separator = " - ",
            formatter = "filename_first",
        }
    end,
}
