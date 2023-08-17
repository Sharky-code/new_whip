-- NEOTEST.LUA

local nvim_test = require("neotest")
local nvim_test_python = require("neotest-python")
nvim_test.setup({
	adapters = {
		require("neotest-python")({
			dap = {
				justMyCode = false,
				console = "integratedTerminal",
			},
			args = { "--log-level", "DEBUG", "--quiet" },
			runner = "pytest",
		}),
	},
})
