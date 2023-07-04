vim.cmd[[
	hi NvimTreeWinSeparator guibg=bg guifg=bg

	hi Winbar guifg=#81888C

	hi NavicText guifg=#81888C 
	hi NavicSeparator guifg=#81888C 

	hi StatusLine guibg=#7CA2DE guifg=bg
	hi StatusLineNC guibg=#7CA2DE guifg=#7CA2DE
]]

vim.api.nvim_set_hl(0, "StatusLineBold", {
	bold = true,
	bg = "#7CA2DE",
	fg = vim.api.nvim_get_hl_by_name("Normal", true).background
})
vim.api.nvim_set_hl(0, "NvimTreeRootFolder", {
	bg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).background,
	fg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).background
})
