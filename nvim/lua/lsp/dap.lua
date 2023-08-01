local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")
local dap_virtual = require("nvim-dap-virtual-text")

dap_python.setup("~/.virtualenvs/debugpy/bin/python")


table.insert(require("dap").configurations.python, {
    type = "python",
    request = "launch",
    name = "Module",
    console = "integratedTerminal",
    module = "src", -- edit this to be your app's main module
    cwd = "${workspaceFolder}",
})

dap.adapters.lldb = {
	type = "executable",
	command = "/usr/bin/lldb",
	name = "lldb",
}

dap.configurations.cpp = {
	{
		name = "Launch",
		type = "lldb",
		request = "launch",
		program = function()
			return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
			-- return vim.fn.expand("%:p")
		end,
		cwd = "${workspaceFolder}",
		stopOnEntry = false,
		args = {}
	}
}

dap.adapters.cpp = function(callback, config)
	callback { type = "server", host = config.host, port = config.port }
end


dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup {
	layouts = { {
		elements = { {
			id = "scopes",
			size = 0.14
		}, {
			id = "breakpoints",
			size = 0.14
		}, {
			id = "stacks",
			size = 0.14
		}, {
			id = "watches",
			size = 0.14
		}, {
			id = "repl",
			size = 0.14
		}, {
			id = "console",
			size = 0.14
		} },
	position = "left",
	size = 40
} }
}
dap_virtual.setup {}

