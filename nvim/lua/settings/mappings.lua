local nest = require('nest')
nest.applyKeymaps {
	{"<F1>", "<cmd>lua require('settings.runfile').runfile(vim.fn.expand('%'), vim.fn.expand('%:r')) <CR>"},
	{"<F2>", ":Gitsigns toggle_signs <CR>"},
	{"<F3>", ":Telescope <CR>"},
	{"<F4>", ":NvimTreeToggle <CR>"},
	{"<F5>", ":ToggleTerm <CR>"},

	{"<Leader>dt", "<cmd>lua require('dap').toggle_breakpoint() <CR>"},
	{"<Leader>dc", "<cmd>lua require('dap').continue() <CR>"},
	{"<Leader>dso", "<cmd>lua require('dap').step_over() <CR>"},
	{"<Leader>dsi", "<cmd>lua require('dap').step_into() <CR>"},
	{"<Leader>dr", "<cmd>lua require('dap').repl.open() <CR>"},

	{"<Leader>pn", "<cmd>lua require('dap-python').test_method() <CR>"},
	{"<Leader>pf", "<cmd>lua require('dap-python').test_class() <CR>"},
	{"<Leader>ps", "<cmd>lua require('dap-python').debug_selection() <CR>"},


	{mode = "n",
		{"y", "\"+y"},
		{"Y", "\"+yy"},
		{"<Up>", "<C-w>k"},
		{"<Down>", "<C-w>j"},
		{"<Left>", "<C-w>h"},
		{"<Right>", "<C-w>l"},
		{"<Leader>g", ":Gitsigns toggle_signs <CR>"},
	},

	{mode = "t",
		{"<C-K>", "<C-c><C-\\><C-n><C-w>k"},
		{"<Esc>", "<C-c><C-\\><C-n><C-w>k"},
		{"<C-J>", "<C-c><C-\\><C-n><C-w>j"},
		{"<C-H>", "<C-c><C-\\><C-n><C-w>h"},
		{"<C-L>", "<C-c><C-\\><C-n><C-w>l"},
	},
}
