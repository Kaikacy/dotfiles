vim.lsp.enable({
    "lua_ls",
    "clangd",
    "ols",
    "zls",
    "rust_analyzer",
})

local function lsp_progress(ev)
    local value = ev.data.params.value
    vim.api.nvim_echo({ { value.message or "done" } }, false, {
        id = "lsp." .. ev.data.params.token,
        kind = "progress",
        source = "vim.lsp",
        title = value.title,
        status = value.kind ~= "end" and "running" or "success",
        percent = value.percentage,
    })
end

local map = vim.keymap.set
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local AUGROUP_NAME = "lsp-config"

local first_attach = true

autocmd("LspAttach", {
    desc = "Lsp attach config",
    group = augroup(AUGROUP_NAME, {}),
    callback = function(ev)
        local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))

        if first_attach then
            first_attach = false

            vim.lsp.codelens.enable(false)
            map(
                "n",
                "grc",
                function()
                    vim.lsp.codelens.enable(not vim.lsp.codelens.is_enabled())
                end
            )
            map(
                "n",
                "grh",
                function()
                    vim.lsp.inlay_hint.enable(
                        not vim.lsp.inlay_hint.is_enabled()
                    )
                end
            )
            vim.lsp.linked_editing_range.enable()
            -- Unnecessary with blink.cmp
            -- require("mini.icons").tweak_lsp_kind()

            -- Already using mini.hipatterns
            vim.lsp.document_color.enable(false)
        end

        map(
            "n",
            "gd",
            function() vim.lsp.buf.definition() end,
            { buf = ev.buf }
        )
        map(
            "n",
            "gD",
            function() vim.lsp.buf.declaration() end,
            { buf = ev.buf }
        )
        map(
            "n",
            "grI",
            function() vim.lsp.buf.incoming_calls() end,
            { buf = ev.buf }
        )
        map(
            "n",
            "grO",
            function() vim.lsp.buf.outgoing_calls() end,
            { buf = ev.buf }
        )

        -- Use conform instead
        vim.bo[ev.buf].formatexpr = nil

        autocmd("LspProgress", {
            buffer = ev.buf,
            callback = lsp_progress,
        })

        -- if client:supports_method("textDocument/completion") then
        --     vim.lsp.completion.enable(true, client.id, ev.buf)
        --     map("i", "<C-SPACE>", function() vim.lsp.completion.get() end, { buf = ev.buf })
        -- end

        if client:supports_method("textDocument/foldingRange") then
            -- Overrides treesitter
            vim.wo[0][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
            vim.wo[0][0].foldmethod = "expr"
        end

        if client:supports_method("textDocument/documentHighlight") then
            -- CursorHold is triggered periodically
            local hl_active = false
            autocmd("CursorHold", {
                group = augroup(AUGROUP_NAME, { clear = false }),
                buffer = ev.buf,
                callback = function()
                    if not hl_active then
                        vim.lsp.buf.document_highlight()
                        hl_active = true
                    end
                end,
            })
            autocmd("CursorMoved", {
                group = augroup(AUGROUP_NAME, { clear = false }),
                buffer = ev.buf,
                callback = function()
                    vim.lsp.buf.clear_references()
                    hl_active = false
                end,
            })
        end
    end,
})
