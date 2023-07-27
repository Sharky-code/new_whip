local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")

dap_python.setup("~/.virtualenvs/debugpy/bin/python")

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb-vscode",
	name = "lldb"
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			-- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			return vim.fn.expand("%:p")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {}
	}
}

dapui.setup {}
