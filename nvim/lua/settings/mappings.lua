-- MAPPINGS.LUA

require("legendary").setup({
	keymaps = {
		{
			"<Leader>pn",
			"<cmd>lua require('dap-python').test_method() <CR>",
			description =
			"Dap-python: Test method"
		},
		{
			"<Leader>ps",
			"<cmd>lua require('dap-python').debug_selection() <CR>",
			description =
			"Dap-python: Debug select"
		},
		{
			"<Leader>pf",
			"<cmd>lua require('dap-python').test_class() <CR>",
			description =
			"Dap-python: Test class"
		},
		{
			"<Leader>lf",
			"<cmd>lua vim.lsp.buf.format{ async = true } <CR>",
			description =
			"LSP: Format file (async)"
		},
		{
			"<Leader>dR",
			"<cmd>lua require('dap').run_to_cursor() <CR>",
			description =
			"Dap: Run to cursor"
		},
		{
			"<Leader>dE",
			"<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ')<CR>",
			description =
			"Dap: Eval expression"
		},
		{
			"<Leader>dC",
			"<cmd>lua require('dap').set_breakpoint(vim.fn.input '[Condition] > ') <CR>",
			description =
			"Dap: Create conditioned breakpoint"
		},
		{
			"<Leader>dU",
			"<cmd>lua require('dapui').toggle() <CR>",
			description =
			"DapUi: Toggle ui"
		},
		{
			"<Leader>db",
			"<cmd> lua require('dap').step_back() <CR>",
			description =
			"Dap: Step back"
		},
		{
			"<Leader>dc",
			"<cmd>lua require('dap').continue() <CR>",
			description =
			"Dap: Continue"
		},
		{
			"<Leader>dd",
			"<cmd> lua require('dap').disconnect() <CR>",
			description =
			"Dap: Disconnect"
		},
		{
			"<Leader>de",
			"<cmd>lua require'dapui'.eval()<CR>",
			description =
			"Dap: Eval expression under cursor"
		},
		{
			"<Leader>dg",
			"<cmd>lua require'dap'.session()<CR>",
			description =
			"Dap: Session"
		},
		{
			"<Leader>dh",
			"<cmd>lua require'dap.ui.widgets'.hover()<CR>",
			description =
			"Dap: Hover widgets"
		},
		{
			"<Leader>ds",
			"<cmd>lua require'dap.ui.widgets'.scopes()<CR>",
			description =
			"Dap: Scopes"
		},
		{
			"<Leader>di",
			"<cmd>lua require'dap'.step_into()<CR>",
			description =
			"Dap: Step into"
		},
		{
			"<Leader>do",
			"<cmd>lua require'dap'.step_over()<CR>",
			description =
			"Dap: Step_over"
		},
		{
			"<Leader>dq",
			"<cmd>lua require'dap'.close()<CR>",
			description =
			"Dap: Close"
		},
		{ "<Leader>dt", "<cmd>lua require'dap'.repl.toggle()<CR>", "Dap: Toggle repl" },
		{
			"<Leader>dx",
			"<cmd>lua require'dap'.terminate()<CR>",
			description =
			"Dap: Terminate"
		},
		{ "<Leader>du", "<cmd>lua require'dap'.step_out()<CR>",    "Dap: Step out" },
		{
			"<Leader>dT",
			"<cmd>lua require'dap'.toggle_breakpoint()<CR>",
			description =
			"Dap: Toggle Breakpoint"
		},
		{
			"dm",
			"<cmd>lua require('neotest').run.run()",
			description =
			"Neotest: Test Method"
		},
		{
			"dM",
			"<cmd>lua require('neotest').run.run({strategy = 'dap'})",
			description =
			"Test Method DAP"
		},
		{
			"df",
			"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>",
			description =
			"Test Class"
		},
		{
			"dF",
			"<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>",
			description =
			"Test Class DAP"
		},
		{
			"dS",
			"<cmd>lua require('neotest').summary.toggle()<cr>",
			description =
			"Test Summary"
		},
		{
			"Cc",
			"<cmd>lua require('swenv.api').pick_venv()<cr>",
			description =
			"Choose Env"
		},
	},
})

-- set up keymaps for more special keys that override the defailt
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap
keymap(0, "n", "<F1>", "<cmd>lua require('settings.runfile').main() <CR>", opts)
keymap(0, "n", "<F3>", ":Telescope <CR>", opts)
vim.cmd[[
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F12>'
]]
