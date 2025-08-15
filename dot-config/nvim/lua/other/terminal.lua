local defaults = {
    ["floating"] = {
        fullscreen = true,
        width = 0.8,
        height = 0.75,
        border = vim.o.winborder,
    },
    ["vertical"] = {
        width = 0.35,
    },
    ["horizontal"] = {
        height = 0.35,
    },
}

-- shared between terminals to avoid having more than 1 window
local term_win = -1

local function new_terminal(type)
    local state = {
        buf = -1,
        mode_terminal = true,
    }

    local config = {}
    if type == "vertical" then
        local width = math.floor(vim.o.columns * defaults[type].width)
        config = {
            width = width,
            vertical = true,
        }
    elseif type == "horizontal" then
        local height = math.floor(vim.o.lines * defaults[type].height)
        config = {
            height = height,
            vertical = false,
        }
    else
        if defaults[type].fullscreen then
            config = {
                width = vim.o.columns,
                height = vim.o.lines - 1,
                col = 0,
                row = 0,
                border = "none",
            }
        else
            local width = math.floor(vim.o.columns * defaults[type].width)
            local height = math.floor(vim.o.lines * defaults[type].height)
            local col = math.floor((vim.o.columns - width) * 0.5)
            local row = math.floor((vim.o.lines - height) * 0.5)
            config = {
                width = width,
                height = height,
                col = col,
                row = row,
                border = defaults[type].border,
            }
        end
        config.relative = "editor"
    end

    return function()
        local buf_valid = vim.api.nvim_buf_is_valid(state.buf)

        if not buf_valid then
            state.buf = vim.api.nvim_create_buf(false, true)
            vim.bo[state.buf].bufhidden = "hide"
        end

        if not vim.api.nvim_win_is_valid(term_win) then
            term_win = vim.api.nvim_open_win(state.buf, true, config)
            if state.mode_terminal then
                vim.cmd.startinsert()
            end
        else
            state.mode_terminal = vim.fn.mode() == "t"
            vim.api.nvim_win_hide(term_win)
            return
        end

        if not buf_valid then
            vim.wo[term_win].winhighlight = "NormalFloat:Normal" -- why does this work?
            vim.fn.jobstart(vim.o.shell, { term = true })
        end
    end
end

local horizontal, vertical, floating

vim.api.nvim_create_user_command("TermToggleHorizontal", function()
    if not horizontal then
        horizontal = new_terminal("horizontal")
    end
    horizontal()
end, {})

vim.api.nvim_create_user_command("TermToggleVertical", function()
    if not vertical then
        vertical = new_terminal("vertical")
    end
    vertical()
end, {})

vim.api.nvim_create_user_command("TermToggleFloating", function()
    if not floating then
        floating = new_terminal("floating")
    end
    floating()
end, {})
