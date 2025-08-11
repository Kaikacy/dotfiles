return {
    "neovim/nvim-lspconfig",
    dependencies = {
        {
            "mason-org/mason.nvim",
            cmd = {
                "Mason",
                "MasonInstall",
                "MasonUninstall",
                "MasonUninstallAll",
                "MasonLog",
                "MasonUpdate",
            },
            keys = {
                { "<LEADER>M", "<CMD>Mason<CR>" },
            },
            opts = {},
        },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
        vim.diagnostic.config({
            severity_sort = true,
            virtual_text = {
                current_line = true,
            },
        })

        vim.keymap.set("n", "<LEADER>l", "<CMD>LspInfo<CR>")

        -- inlay hints
        vim.keymap.set("n", "<LEADER>i", function()
            vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
        end, { desc = "Toggle inlay hint" })

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("user-lsp", {}),
            callback = function(args)
                local client = vim.lsp.get_client_by_id(args.data.client_id)
                if not client then
                    return
                end

                vim.keymap.set("n", "K", function()
                    vim.lsp.buf.hover({ max_width = math.floor(vim.o.columns * 0.75) })
                end, { buffer = args.buf, desc = "Hover doc" })
                -- stylua: ignore start
                vim.keymap.set("n", "gd", "<CMD>FzfLua lsp_definitions<CR>", { buffer = args.buf, desc = "Goto definition" })
                vim.keymap.set("n", "grr", "<CMD>FzfLua lsp_references<CR>", { buffer = args.buf, desc = "References" })
                vim.keymap.set("n", "grt", "<CMD>FzfLua lsp_typedefs<CR>", { buffer = args.buf, desc = "Goto type definition" })
                vim.keymap.set("n", "gri", "<CMD>FzfLua lsp_implementations<CR>", { buffer = args.buf, desc = "Implementations" })
                vim.keymap.set("n", "gO", "<CMD>FzfLua lsp_document_symbols<CR>", { buffer = args.buf, desc = "Document symbols" })
                vim.keymap.set("n", "grd", "<CMD>FzfLua lsp_document_diagnostics<CR>", { buffer = args.buf, desc = "Document diagnostics" })
                vim.keymap.set("n", "<LEADER>wo", "<CMD>FzfLua lsp_workspace_symbols<CR>", { buffer = args.buf, desc = "Workspace symbols" })
                vim.keymap.set("n", "<LEADER>wd", "<CMD>FzfLua lsp_workspace_diagnostics<CR>", { buffer = args.buf, desc = "Workspace diagnostics" })
                -- stylua: ignore end

                -- codelens
                if client:supports_method("textDocument/codeLens") then
                    vim.lsp.codelens.refresh({ bufnr = args.buf })
                    vim.api.nvim_create_autocmd({ "BufEnter", "InsertLeave", "BufWritePost" }, {
                        group = vim.api.nvim_create_augroup("user-lsp", { clear = false }),
                        buffer = args.buf,
                        callback = function()
                            vim.lsp.codelens.refresh({ bufnr = args.buf })
                        end,
                    })
                end
            end,
        })

        -- servers
        vim.lsp.enable({
            "lua_ls",
            "zls",
            "gdscript",
            "bashls",
        })
    end,
}
