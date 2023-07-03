vim.cmd[[
	"au WinEnter, BufWinEnter, BufEnter * lua require('ui.winbar').set_winbar()
	au Filetype * lua require"ui.winbar".set_winbar()	

	au BufWinEnter NvimTree_1 setlocal statusline=%#Normal#
	au Filetype NvimTree hi FoldColumn guibg=None
	
	au Filetype * setlocal statusline=%{%v:lua.require('ui.statusbar').statusbar_active()%}
]]
