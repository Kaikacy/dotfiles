local notify = vim.notify
local notify_once = vim.notify_once

---@param msg string
---@param level integer|nil
---@param opts table|nil
---@diagnostic disable-next-line: duplicate-set-field
vim.notify = function(msg, level, opts)
    if not opts then
        notify(msg, level, opts)
    else
        notify((opts.title .. ": " or "") .. msg, level, opts)
    end
end

---@param msg string
---@param level integer|nil
---@param opts table|nil
---@diagnostic disable-next-line: duplicate-set-field
vim.notify_once = function(msg, level, opts)
    if not opts then
        notify_once(msg, level, opts)
    else
        notify_once((opts.title .. ": " or "") .. msg, level, opts)
    end
end
