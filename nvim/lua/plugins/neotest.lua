-- NEOTEST.LUA

local nvim_test = require("neotest")
nvim_test.setup({
	adapters = {
		require("neotest-python")
	},
	status = { virtual_text = true },
	output = { open_on_run = true },
})
