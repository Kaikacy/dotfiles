return {
	"mfussenegger/nvim-dap",
	dependencies = {
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "nvim-neotest/nvim-nio" },
		},
	},
	keys = {
		{
			"<leader>dt",
			"<cmd>DapToggleBreakpoint<cr>",
			desc = "Toggle breakpoint",
		},
		{
			"<leader>dT",
			function()
				require("dap").toggle_breakpoint(nil, nil, vim.fn.input("Log message: "))
			end,
			desc = "Toggle breakpoint with log",
		},
		{
			"<leader>dC",
			"<cmd>DapClearBreakpoints<cr>",
			desc = "Clear all breakpoints",
		},
		{
			"<leader>dc",
			"<cmd>DapContinue<cr>",
			desc = "Start / Continue",
		},
		{
			"<leader>dd",
			"<cmd>DapDisconnect<cr>",
			desc = "Disconnect",
		},
		{
			"<leader>dk",
			"<cmd>DapTerminate<cr>",
			desc = "Kill / Terminate",
		},
		{
			"<leader>ds",
			"<cmd>DapStepOver<cr>",
			desc = "Step over",
		},
		{
			"<leader>di",
			"<cmd>DapStepInto<cr>",
			desc = "Step into",
		},
		{
			"<leader>do",
			"<cmd>DapStepOut<cr>",
			desc = "Step out",
		},
		{
			"<leader>db",
			"<cmd>DapStepBack<cr>",
			desc = "Step back",
		},
		{
			"<leader>de",
			function()
				require("dapui").eval()
			end,
			desc = "Evaluate current word",
		},
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")
		dapui.setup()

		dap.adapters.lldb = {
			type = "executable",
			command = "lldb-dap",
			name = "lldb",
		}

		dap.configurations.zig = {
			{
				name = "Launch file",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
