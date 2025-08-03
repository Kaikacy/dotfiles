---script to follow markdown links, specifically file URI schemes, with #L<n> suffix, where
---<n> is line number; this syntax is used by zls on hover doc.
---https://www.reddit.com/r/neovim/comments/1lw7qcs/follow_markdown_file_uri_with_line_number/

local ts_utils = require("nvim-treesitter.ts_utils")
local ts = vim.treesitter

local function get_link_destination_at_cursor()
    local buf = vim.api.nvim_win_get_buf(0)
    local node = ts_utils.get_node_at_cursor()
    if node == nil then
        return nil
    end
    local node_type = node:type()
    if node_type == "link_destination" and node:parent():type() == "inline_link" then
        return ts.get_node_text(node, buf)
    elseif node_type == "link_text" then
        local dest_node = node:next_named_sibling()
        if dest_node and dest_node:type() == "link_destination" then
            return ts.get_node_text(dest_node, buf)
        else
            return nil
        end
    elseif node_type == "inline_link" then
        for _, child in ipairs(node:named_children()) do
            if child:type() == "link_destination" then
                return ts.get_node_text(child, buf)
            end
        end
    else
        return nil
    end
end

---@param dest string
local function get_destination_line_number(dest)
    local num_str = dest:match("%#L(%d*)$")
    return num_str and tonumber(num_str) or nil
end

---@param win_type 'vertical'|'horizontal'|'current'
---@return boolean ok
return function(win_type)
    local win = 0
    local dest = get_link_destination_at_cursor()
    if dest == nil or dest:match("^file://") == nil then
        return false
    end

    local line_num = get_destination_line_number(dest)
    local dest_buf = vim.uri_to_bufnr(dest)
    vim.bo[dest_buf].buflisted = true
    local is_float = vim.api.nvim_win_get_config(0).relative ~= ""
    if is_float then
        vim.api.nvim_win_close(0, true)
    end
    if win_type == "current" then
        win = vim.api.nvim_get_current_win()
    elseif win_type == "vertical" then
        win = vim.api.nvim_open_win(dest_buf, true, { split = "right" })
    elseif win_type == "horizontal" then
        win = vim.api.nvim_open_win(dest_buf, true, { split = "below" })
    end
    vim.api.nvim_win_set_buf(win, dest_buf)
    if line_num ~= nil then
        vim.api.nvim_win_set_cursor(win, { line_num, 0 })
    end

    return true
end
