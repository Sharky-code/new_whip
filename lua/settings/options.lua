-- OPTIONS.LUA

local options = {
	foldcolumn = "0",
	signcolumn = "yes:1",
	foldmethod = "expr",
	foldexpr = "nvim_treesitter#foldexpr()",
	laststatus = 3,
	nocompatible,
	swapfile = false,
	number = true,
	scrolloff = 5,
	cursorline = true,
	tabstop = 4,
	shiftwidth = 4,
	mouse = "a",
	hidden = true,
	noshowmode,
	smartindent = true,
	foldlevel = 20,
	--showtabline=2,
	showtabline = 0,
	syntax = "on",
	showmode = false,
	termguicolors = true,
	numberwidth = 1,
	cmdheight = 0,
}

for k, v in pairs(options) do
	vim.opt[k] = v
end

vim.opt.fillchars:append({ eob = " " })
