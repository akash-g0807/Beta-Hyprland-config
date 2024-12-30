return {
	-- Debug Adapter Protocol
	"mfussenegger/nvim-dap",
	-- UI for DAP
	"rcarriga/nvim-dap-ui",
	-- Manage DAP in Mason
	"jay-babu/mason-nvim-dap.nvim",

	config = function()
		-- UI
		require("dapui").setup()

		-- Debugger
		local dap = require("dap")
		dap.adapters.codelldb = {
			type = "server",
			port = "${port}",
			executable = {
				-- CHANGE THIS to your path!
				command = "/home/akashg/.local/share/nvim/mason/packages/codelldb/extension/adapter/codelldb",
				args = { "--port", "${port}" },

				-- On windows you may have to uncomment this:
				-- detached = false,
			},
		}

		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		-- dap.configurations.rust = dap.configurations.cpp
	end,
}
