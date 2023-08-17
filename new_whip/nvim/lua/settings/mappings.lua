-- MAPPINGS.LUA

local wk = require("which-key")
wk.setup({})

wk.register({
	g = {
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "LSP: List declarations" },
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "LSP: List definitions" },
		I = { "<cmd>lua vim.lsp.buf.implementation()<CR>", "LSP: List implementation" },
		r = { "<cmd>lua vim.lsp.buf.references()<CR>", "LSP: List references" },
		l = { "<cmd>lua vim.diagnostic.open_float()<CR>", "LSP: List diagnostic" },
		f = { "<cmd>lua vim.lsp.buf.format()<CR>", "LSP: Format file" },
	},
}, { mode = "n" })
wk.register({
	l = {
		f = { "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", "LSP: Format file (async)" },
		i = { "<cmd>LspInfo<cr>", ":LspInfo" },
		a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "LSP: Code action" },
		j = { "cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", "LSP: Go to next diagnostic" },
		k = { "cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", "LSP: Go to previous diagnostic" },
		r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "LSP: Rename a variable with lsp" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "LSP: Signature help" },
		q = { "<cmd>lua vim.diagnostic.setloclist()<CR>", "LSP: setloclist" },
	},
}, { prefix = "<Leader>", mode = "n" })
wk.register({
	p = {
		name = "dap-python",
		n = { "<cmd>lua require('dap-python').test_method() <CR>", "Dap-python: Test method" },
		f = { "<cmd>lua require('dap-python').test_class() <CR>", "Dap-python: Test class" },
		s = { "<cmd>lua require('dap-python').debug_selection() <CR>", "Dap-python: Debug select" },
	},
}, { prefix = "<Leader>", mode = "n" })
wk.register({
	d = {
		name = "dap",
		R = { "<cmd>lua require'dap'.run_to_cursor()<CR>", "Dap: Run to cursor" },
		E = { "<cmd>lua require'dapui'.eval(vim.fn.input '[Expression] > ')<CR>", "Dap: Eval expression" },
		C = {
			"<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<CR>",
			"Dap: Create conditioned breakpoint",
		},
		U = { "<cmd>lua require'dapui'.toggle()<CR>", "DapUi: Toggle ui" },
		b = { "<cmd>lua require'dap'.step_back()<CR>", "Dap: Step back" },
		c = { "<cmd>lua require'dap'.continue()<CR>", "Dap: Continue" },
		d = { "<cmd>lua require'dap'.disconnect()<CR>", "Dap: Disconnect" },
		e = { "<cmd>lua require'dapui'.eval()<CR>", "Dap: Eval expression under cursor" },
		g = { "<cmd>lua require'dap'.session()<CR>", "Dap: Session" },
		h = { "<cmd>lua require'dap.ui.widgets'.hover()<CR>", "Dap: Hover widgets" },
		S = { "<cmd>lua require'dap.ui.widgets'.scopes()<CR>", "Dap: Scopes" },
		i = { "<cmd>lua require'dap'.step_into()<CR>", "Dap: Step into" },
		o = { "<cmd>lua require'dap'.step_over()<CR>", "Dap: Step_over" },
		p = { "<cmd>lua require'dap'.pause_toggle()<CR>", "Dap: Toggle pause" },
		q = { "<cmd>lua require'dap'.close()<CR>", "Dap: Close" },
		r = { "<cmd>lua require'dap'.repl.toggle()<CR>", "Dap: Toggle repl" },
		x = { "<cmd>lua require'dap'.terminate()<CR>", "Dap: Terminate" },
		u = { "<cmd>lua require'dap'.step_out()<CR>", "Dap: Step out" },
		T = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Dap: Toggle Breakpoint" },
	},
}, { prefix = "<leader>", name = "n" })

wk.register({
	d = {
		name = "neotest",
		m = { "<cmd>lua require('neotest').run.run()", "Neotest: Test Method" },
		M = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})", "Test Method DAP" },
		f = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<cr>", "Test Class" },
		F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Test Class DAP" },
		S = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Test Summary" },
	},
}, { mode = "n" })

wk.register({
	C = {
		name = "Python",
		c = { "<cmd>lua require('swenv.api').pick_venv()<cr>", "Choose Env" },
	},
}, { mode = "n" })

-- set up keymaps for more special keys that override the defailt
local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_buf_set_keymap
keymap(0, "n", "<F1>", "<cmd>lua require('settings.runfile').main() <CR>", opts)
keymap(0, "n", "<F3>", ":Telescope <CR>", opts)
keymap(0, "n", "<F5>", "<C-\\><C-n>:ToggleTerm direction=float<CR>", opts)
