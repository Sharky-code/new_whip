local dap = require("dap")
local dapui = require("dapui")
local dap_python = require("dap-python")
local dap_virtual = require("nvim-dap-virtual-text")

dap_python.setup("~/.virtualenvs/debugpy/bin/python")

dap.adapters.lldb = {
	type = "executable",
	command = "~/local/codelldb-1.9.2/adapter",
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

}
dap_virtual.setup {}

