local function map(mode, lhs, rhs, opts)
    vim.keymap.set(mode, lhs, rhs, vim.tbl_extend("force", { buf = 0 }, opts))
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

map("n", "<S-Tab>", function()
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
            ("File '%s' doesn't exist or isn't readable"):format(other_file),
            vim.log.levels.WARN
        )
    end
    vim.cmd("edit " .. other_file)
end, { desc = "Switch between .c and .h files" })
