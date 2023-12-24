-- AUTOCOMMANDS.LUA
vim.cmd([[
	au BufWinEnter NvimTree setlocal statusline=%#Normal#
	au Filetype NvimTree hi FoldColumn guibg=None

	au ColorScheme * set showtabline=0

	au VimEnter * setlocal cursorline
    au WinEnter * setlocal cursorline
    au BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
]])
