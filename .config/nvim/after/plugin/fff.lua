vim.g.fff = {
    prompt = "> ",
    layout = {
        width = 0.95,
        height = 0.95,
        prompt_position = "top",
    },
    preview = {
        wrap_lines = true,
    },
    keymaps = {
        close = "<C-c>",
        focus_list = "<A-l>",
        focus_preview = "<A-p>",
    },
    hl = {
        border = "Whitespace",
        matched = "PmenuMatch",
        scrollbar = "PmenuThumb",
        cursor = "CursorLine",
    },
}

local map = vim.keymap.set

-- stylua: ignore start
map("n", "<LEADER>f", function() require("fff").find_files() end, { desc = "Find files" })
map( "n", "<LEADER>c", function() require("fff").find_files_in_dir(vim.fn.stdpath("config")) end, { desc = "Config files" })
map("n", "<LEADER>/", function() require("fff").live_grep() end, { desc = "Live grep" })
map( "n", "<LEADER>sw", function() require("fff").live_grep({ query = vim.fn.expand("<cword>") }) end, { desc = "Grep cword" })
map( "n", "<LEADER>sW", function() require("fff").live_grep({ query = vim.fn.expand("<cWORD>") }) end, { desc = "Grep cWORD" })
-- stylua: ignore end
