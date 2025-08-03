local follow_file_uri = require("other.follow-md-file-uri")

vim.keymap.set("n", "<CR>", function()
    if not follow_file_uri("current") then
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<CR>", true, false, true), "n", false)
    end
end, { buffer = 0, desc = "Follow zls file URI" })

vim.keymap.set("n", "\\", function()
    if not follow_file_uri("vertical") then
        vim.api.nvim_feedkeys("\\", "n", true)
    end
end, { buffer = 0, desc = "Follow zls file URI (vertical split)" })

vim.keymap.set("n", "|", function()
    if not follow_file_uri("horizontal") then
        vim.api.nvim_feedkeys("|", "n", true)
    end
end, { buffer = 0, desc = "Follow zls file URI (horizontal split)" })
