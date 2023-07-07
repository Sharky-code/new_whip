vim.cmd[[
	"au WinEnter, BufWinEnter, BufEnter * lua require('ui.winbar').set_winbar()
	au Filetype * lua require"ui.winbar".set_winbar()	

	au WinEnter,BufEnter * setlocal statusline=%{%v:lua.require('ui.statusbar').statusbar_active()%}
	au WinLeave,BufLeave * setlocal statusline=%{%v:lua.require('ui.statusbar').statusbar_inactive()%}

	au BufWinEnter NvimTree setlocal statusline=%#Normal#
	au Filetype NvimTree hi FoldColumn guibg=None
]]
