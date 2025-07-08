return {
	"mason-org/mason.nvim",
	cmd = {
		"Mason",
		"MasonInstall",
		"MasonLog",
		"MasonUpdate",
		"MasonUninstall",
		"MasonUninstallAll",
	},
	keys = {
		{ "<leader>M", "<cmd>Mason<cr>", desc = "Mason" },
	},
	build = ":MasonUpdate",
	opts = {
		ui = {
			icons = {
				package_installed = " ",
				package_pending = " ",
				package_uninstalled = " ",
			},
		},
	},
}
