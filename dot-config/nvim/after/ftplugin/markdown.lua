vim.keymap.set("n", "<cr>", function()
	if not require("other.follow-md-file-uri")("current") then
		vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<cr>", true, false, true), "n", false)
	end
end, { buffer = 0, desc = "Follow md file URI link" })
