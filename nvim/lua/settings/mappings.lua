local nest = require('nest')
nest.applyKeymaps {
	--{"<F1><F2>", ":HopAnywhere <CR>"},
	--{"<F2>", ":Gitsigns toggle_signs <CR>"},
	--{"<F4>", ":Telescope <CR>"},
	{"<F5>", ":NvimTreeToggle <CR>"},
	--{"<F6>", ":ToggleTerm <CR>"},
	{"<F1>", "<cmd>lua require('settings.runfile').hi(vim.fn.expand('%'), vim.fn.expand('%:r')) <CR>"},


	{mode = "n",
		{"y", "\"+y"},
		{"Y", "\"+yy"},
		{"<Up>", "<C-w>k"},
		{"<Down>", "<C-w>j"},
		{"<Left>", "<C-w>h"},
		{"<Right>", "<C-w>l"},
		{"<Leader>o", "o<Esc>"},
		{"<Leader>O", "O<Esc>"},
		{"<Leader>J", "kJ"},
	},

	{mode = "v", {"y", "\"+y"} },
	{mode = "t",
		{"<C-K>", "<C-c><C-\\><C-n><C-w>k"},
		{"<Esc>", "<C-c><C-\\><C-n><C-w>k"},
		{"<C-J>", "<C-c><C-\\><C-n><C-w>j"},
		{"<C-H>", "<C-c><C-\\><C-n><C-w>h"},
		{"<C-L>", "<C-c><C-\\><C-n><C-w>l"},
	},
}
