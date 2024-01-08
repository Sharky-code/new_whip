-- MAPPINGS.LUA

local wk = require("which-key")
local l = require("legendary")
wk.setup({})

l.setup({
	keymaps = {
		--[[
		{
			itemgroup = "LSP",
			description = "General keymaps for LSP",
			keymaps = {
				{ "gA", "<cmd>lua vim.lsp.buf.code_action()<cr>",    description = "LSP: Code action" },
				{ "gd", "<cmd>lua vim.lsp.buf.definition()<CR>",     description = "LSP: List definitions" },
				{ "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>",    description = "LSP: List declarations" },
				{ "gf", "<cmd>lua vim.lsp.buf.format()<CR>",         description = "LSP: Format file" },
				{ "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", description = "LSP: List implementation" },
				{ "gr", "<cmd>lua vim.lsp.buf.references()<CR>",     description = "LSP: List references" },
				{ "gl", "<cmd>lua vim.diagnostic.open_float()<CR>",  description = "LSP: List diagnostic" },
				{
					"gj",
					"<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>",
					description = "LSP: Go to next diagnostic",
				},
				{
					"gk",
					"<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>",
					description = "LSP: Go to previous diagnostic",
				},
				{ "gq", "<cmd>lua vim.diagnostic.setloclist()<cr>",        description = "LSP: Signature_help" },
				{
					"gR",
					"<cmd>lua vim.lsp.buf.rename()<cr>",
					description = "LSP: Rename a variable with lsp",
				},
				{ "gs", "<cmd>lua vim.lsp.buf.signature_help()<cr>",       description = "LSP: Signature_help" },
				{ "gt", "<cmd>lua vim.lsp.buf.type_definition()<cr>",       description = "LSP: Signature_help" },
				{ "lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", description = "LSP: Format file (async)" },
				{ "lI", "<cmd>LspInfo<cr>",                                description = ":LspInfo" },
				{"<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", description = "TESTING"},
				{"<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", description = "TESTING"},
			},
		},
		]]

		{ "gf",   "<cmd>lua vim.lsp.buf.format()<CR>",               description = "LSP: Format file" },
		{
			itemgroup = "Python DAP",
			description = "General keymaps for dap-python",
			keymaps = {
				{
					"<Leader>pn",
					"<cmd>lua require('dap-python').test_method()",
					description = "Dap-python: Test method",
				},
				{ "<Leader>pf", "<cmd>lua require('dap-python').test_class()", description = "Dap-python: Test class" },
				{
					"<Leader>ps",
					"<cmd> lua require('dap-python').test_class() <CR>",
					description = "Dap-python: Debug select",
				},
			},
		},
		{
			itemgroup = "DAP",
			description = "General keymaps for dap",
			keymaps = {
				{ "<leader>dR", "<cmd>lua require('dap').run_to_cursor()<CR>", description = "Dap: Run to cursor" },
				{
					"<leader>dE",
					"<cmd>lua require('dapui').eval(vim.fn.input '[Expression] > ')<CR>",
					description = "Dap: Eval expression",
				},
				{
					"<leader>dC",
					"<cmd>lua require('dap').set_breakpoint(vim.fn.input '[Expression] > ')<CR>",
					description = "Dap: Create conditioned breakpoint",
				},
				{ "<leader>dU", "<cmd>lua require('dapui').toggle()<CR>",      description = "DapUi: Toggle ui" },
				{ "<leader>db", "<cmd>lua require('dap').step_back()<CR>",     description = "Dap: Step back" },
				{ "<leader>dc", "<cmd>lua require('dap').continue()<CR>",      description = "Dap: continue" },
				{ "<leader>dd", "<cmd>lua require('dap').disconnect()<CR>",    description = "Dap: Disconnect" },
				{
					"<leader>de",
					"<cmd>lua require('dapui').eval()<CR>",
					description = "Dap: Eval expression under cursor",
				},
				{ "<leader>dg", "<cmd>lua require('dap').session()<CR>",           description = "Dap: Session" },
				{ "<leader>dh", "<cmd>lua require('dap.ui.widgets').hover()<CR>",  description = "Dap: Hover widgets" },
				{ "<leader>dS", "<cmd>lua require('dap.ui.widgets').scopes()<CR>", description = "Dap: Scopes" },
				{ "<leader>di", "<cmd>lua require('dap').step_into()<CR>",         description = "Dap: Step into" },
				{ "<leader>do", "<cmd>lua require('dap').step_over()<CR>",         description = "Dap: Step over" },
				{ "<leader>dp", "<cmd>lua require('dap').pause_toggle()<CR>",      description = "Dap: Toggle pause" },
				{ "<leader>dq", "<cmd>lua require('dap').close()<CR>",             description = "Dap: Close" },
				{ "<leader>dr", "<cmd>lua require('dap').repl.toggle()<CR>",       description = "Dap: Toggle repl" },
				{ "<leader>dx", "<cmd>lua require('dap').terminate()<CR>",         description = "Dap: Termimate" },
				{ "<leader>du", "<cmd>lua require('dap').step_out()<CR>",          description = "Dap: Step out" },
				{
					"<leader>dT",
					"<cmd>lua require('dap').toggle_breakpoint()<CR>",
					description = "Dap: Toggle Breakpoint",
				},
			},
		},
		{
			itemgroup = "Neotest",
			description = "General keymappings for neotest",
			keymaps = {
				{
					"dm",
					"<cmd>lua require('neotest').run.run()<CR>",
					description = "Neotest: Test Method",
				},
				{
					"df",
					"<cmd>lua require('neotest').run.run({vim.fn.expand('%')})<CR>",
					description = "Neotest: Test Class",
				},
				{
					"dM",
					"<cmd>lua require('neotest').run.run({strategy = 'dap'})<CR>",
					description = "Neotest: Test Method DAP",
				},
				{
					"df",
					"<cmd>lua require('neotest').run.run({vim.fn.expand('%')}, strategy = 'dap')<CR>",
					description = "Neotest: Test Class DAP",
				},
				{ "df", "<cmd>lua require('neotest').summary.toggle()<CR>", description = "Neotest: Test Summary" },
			},
		},
		{ "Cc",   "<cmd>lua require('swenv.api').pick_venv()<CR>",   description = "Choose Env" },
		{ "<F1>", "<cmd>lua require('settings.runfile').main()<CR>", description = "" },
		{ "<F2>", "<cmd>lua require('settings.runfile').temp()<CR>", description = "" },
		{ "<F3>", ":Telescope<CR>" },
		{ "<F5>", "<C-\\><C-n><CR>:ToggleTerm<CR>",                  description = "",                mode = "t" },
		{ "<F5>", "<C-\\><C-n><CR>:ToggleTerm direction=float<CR>",  description = "",                mode = "n" },
	},
})

vim.keymap.set("x", "<leader>re", function() require('refactoring').refactor('Extract Function') end)
vim.keymap.set("x", "<leader>rf", function() require('refactoring').refactor('Extract Function To File') end)
-- Extract function supports only visual mode
vim.keymap.set("x", "<leader>rv", function() require('refactoring').refactor('Extract Variable') end)
-- Extract variable supports only visual mode
vim.keymap.set({ "n", "x" }, "<leader>ri", function() require('refactoring').refactor('Inline Variable') end)
-- Inline var supports both normal and visual mode

vim.keymap.set("n", "<leader>rb", function() require('refactoring').refactor('Extract Block') end)
vim.keymap.set("n", "<leader>rbf", function() require('refactoring').refactor('Extract Block To File') end)
-- Extract block supports only normal mode
-- vim.keymap.set("x", "<leader>re", ":Refactor extract ")
vim.keymap.set("x", "<leader>rf", ":Refactor extract_to_file ")

vim.keymap.set("x", "<leader>rv", ":Refactor extract_var ")

vim.keymap.set({ "n", "x" }, "<leader>ri", ":Refactor inline_var")

vim.keymap.set("n", "<leader>rb", ":Refactor extract_block")
vim.keymap.set("n", "<leader>rbf", ":Refactor extract_block_to_file")

