--[[
-- OPTIONS.LUA (Parent file: ../init.lua) --
The purpose of this file is to put the typical Nvim options and settings	

]]

--[[
-- INDEX --
1. Nvim Options #001000
	a. Fill Chars #001010
]]

-- 1. _N. V. I. M.  O. P. T. I. O. N. S._ --

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

-- Uses the vim command to turn the table into options
for k, v in pairs(options) do
	vim.opt[k] = v
end

-- Fill Chars -- #001010

-- Turns the ~ Character at the end of buffer blank lines into nothing as its ugly
vim.opt.fillchars:append({ eob = " " })

