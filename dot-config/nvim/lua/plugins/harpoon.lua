return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	keys = {
		{ "<leader>a", desc = "Add to harpoon" },
		{ "<A-e>", desc = "Open harpoon menu" },
		{ "<A-1>", desc = "Harpoon file #1" },
		{ "<A-2>", desc = "Harpoon file #2" },
		{ "<A-3>", desc = "Harpoon file #3" },
		{ "<A-4>", desc = "Harpoon file #4" },
		{ "<A-5>", desc = "Harpoon file #5" },
		{ "<A-6>", desc = "Harpoon file #6" },
		{ "<A-7>", desc = "Harpoon file #7" },
		{ "<A-8>", desc = "Harpoon file #8" },
		{ "<A-9>", desc = "Harpoon file #9" },
		{ "<A-l>", desc = "Harpoon next file" },
		{ "<A-h>", desc = "Harpoon prev file" },
	},
	config = function()
		local harpoon = require("harpoon")

		harpoon:setup()

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<A-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<A-1>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<A-2>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<A-3>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<A-4>", function()
			harpoon:list():select(4)
		end)
		vim.keymap.set("n", "<A-5>", function()
			harpoon:list():select(5)
		end)
		vim.keymap.set("n", "<A-6>", function()
			harpoon:list():select(6)
		end)
		vim.keymap.set("n", "<A-7>", function()
			harpoon:list():select(7)
		end)
		vim.keymap.set("n", "<A-8>", function()
			harpoon:list():select(8)
		end)
		vim.keymap.set("n", "<A-9>", function()
			harpoon:list():select(9)
		end)

		vim.keymap.set("n", "<A-h>", function()
			harpoon:list():prev()
		end)
		vim.keymap.set("n", "<A-l>", function()
			harpoon:list():next()
		end)
	end,
}
