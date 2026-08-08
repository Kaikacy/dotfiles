local function map(mode, lhs, rhs, opts)
    vim.keymap.set(
        mode,
        lhs,
        rhs,
        vim.tbl_extend("force", { buf = 0 }, opts or {})
    )
end

local ALIGN_BACKSLASH_SUB =
    [[s/\s*\\$/\=repeat(' ', max([80-col('.'), 1])).'\']]
local ALIGN_BACKSLASH_RESET = [[let @/ = '']]
local ALIGN_BACKSLASH_FULL_CMD = (":%s<CR>:%s<CR>"):format(
    ALIGN_BACKSLASH_SUB,
    ALIGN_BACKSLASH_RESET
)

function _G.My_align_backslash_operator(type)
    if type == nil then
        -- Reuse this function, but `type` will be set
        vim.o.operatorfunc = "v:lua.My_align_backslash_operator"
        return "g@"
    end
    vim.cmd("'[,']" .. ALIGN_BACKSLASH_SUB)
    vim.cmd(ALIGN_BACKSLASH_RESET)
end

-- Align backslashes for function-like macros
map(
    "n",
    "g\\",
    My_align_backslash_operator,
    { silent = true, expr = true, desc = "Try to align backslash" }
)
map(
    "n",
    "g\\\\",
    ALIGN_BACKSLASH_FULL_CMD,
    { silent = true, desc = "Try to align backslash on current line" }
)
map(
    "x",
    "g\\",
    ALIGN_BACKSLASH_FULL_CMD,
    { silent = true, desc = "Try to align backslash in selection" }
)

-- Switch between .c and corresponding .h files
map("n", "<S-Tab>", function()
    local clangd_avail = #vim.lsp.get_clients({
        bufnr = 0,
        name = "clangd",
        ---@diagnostic disable-next-line: assign-type-mismatch
        method = "textDocument/switchSourceHeader",
    }) > 0
    -- nvim-lspconfig defines "LspClangdSwitchSourceHeader" for clangd config
    local clangd_cmd = "LspClangdSwitchSourceHeader"
    if clangd_avail and vim.fn.exists(clangd_cmd) then
        vim.cmd(clangd_cmd)
        return
    end

    -- Dumber method
    local ext = vim.fn.expand("%:e")
    local other_file
    if ext == "c" then
        other_file = vim.fn.expand("%:s/c$/h/")
    elseif ext == "h" then
        other_file = vim.fn.expand("%:s/h$/c/")
    else
        vim.notify("File extension must be .c or .h", vim.log.levels.WARN)
        return
    end
    if vim.fn.filereadable(other_file) == 0 then
        vim.notify(
            ("Corresponding file '%s' is not available"):format(other_file),
            vim.log.levels.WARN
        )
        return
    end
    vim.cmd("edit " .. other_file)
end, { desc = "Switch between .c and .h files" })

-- Add include guard
map("n", "<LEADER>ig", function()
    vim.ui.input(
        { prompt = "Include guard name: ", scope = "buffer" },
        function(name)
            if not name then return end
            if name == "" then name = vim.fn.expand("%:t:r") end
            name = name:upper()
            if not name:match("_H$") then name = name .. "_H" end

            local row, col = unpack(vim.api.nvim_win_get_cursor(0))
            local keys = vim.api.nvim_replace_termcodes(
                ("gg[ kO#ifndef %s<CR>#define %s<ESC>G] jo#endif // %s<ESC>"):format(
                    name,
                    name,
                    name
                ),
                true,
                true,
                true
            )
            vim.api.nvim_feedkeys(keys, "", false)
            vim.schedule(function()
                -- +3 for #ifndef, #define and newline
                vim.api.nvim_win_set_cursor(0, { row + 3, col })
            end)
        end
    )
end)
