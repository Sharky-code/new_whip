local nest = require('nest')
nest.applyKeymaps {
	{"<F1>", "<cmd>lua require('settings.runfile').runfile(vim.fn.expand('%'), vim.fn.expand('%:p')) <CR>"},
	{"<F2>", ":Gitsigns toggle_signs <CR>"},
	{"<F3>", ":Telescope <CR>"},
	{"<F4>", ":NvimTreeToggle <CR>"},
	{"<F5>", ":ToggleTerm <CR>"},
	{"<F6>", "<cmd>lua vim.cmd('NvimTreeClose'); require('dapui').toggle() <CR>"},

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
		{"<Leader>gg", ":LazyGit <CR>"},
	},

	{mode = "t",
		{"<Esc>", "<C-\\><C-n>:ToggleTerm <CR>"},
	},
}
