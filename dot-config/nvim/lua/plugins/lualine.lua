return {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
        options = {
            component_separators = "",
            section_separators = "",
        },
        sections = {
            lualine_a = {
                "mode",
            },
            lualine_b = {
                "branch",
                "diff",
                {
                    "diagnostics",
                    symbols = {
                        error = "E",
                        warn = "W",
                        info = "I",
                        hint = "H",
                    },
                },
            },
            lualine_c = {
                {
                    "filename",
                    newfile_status = true,
                    path = 1,
                },
            },
            lualine_x = {
                "filetype",
            },
            lualine_y = {
                "lsp_status",
                "progress",
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {
                "filetype",
                {
                    "filename",
                    newfile_status = true,
                    path = 1,
                },
            },
            lualine_x = {
                "location",
            },
            lualine_y = {},
            lualine_z = {},
        },
    },
}
