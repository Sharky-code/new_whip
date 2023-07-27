local M = {}

function M.set_highlights()
	vim.cmd[[
		hi NvimTreeWinSeparator guibg=bg guifg=bg

		hi Winbar guifg=#81888C

		hi NavicText guifg=#81888C 
		hi NavicSeparator guifg=#81888C 

		hi NvimTreeStatusLine guibg=bg guifg=bg
	]]
	vim.api.nvim_set_hl(0, "StatusLineConst", {
		bg = "#7CA2DE",
		fg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})

	vim.api.nvim_set_hl(0, "StatusLineBold", {
		bold = true,
		bg = "#7CA2DE",
		fg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "StatusLineSeparator", {
		fg = "#7CA2DE",
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "NvimTreeRootFolder", {
		bg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).background,
		fg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).background
	})
	vim.api.nvim_set_hl(0, "GitSignsAdd", {
		fg = "#0000FF",
		bg = "#7CA2DE"
	})
	vim.api.nvim_set_hl(0, "GitSignsChange", {
		fg = "#0000FF",
		bg = "#7CA2DE"
	})
	vim.api.nvim_set_hl(0, "GitSignsDelete", {
		fg = "#FF0000",
		bg = "#7CA2DE"
	})
	vim.api.nvim_set_hl(0, "NvimTreeStatusLine", {
		fg = vim.api.nvim_get_hl_by_name("NvimTreeNormal", true).background,
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "StatusLineNC", {
		fg = vim.api.nvim_get_hl_by_name("StatusLineConst", true).background,
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "lspdiagnosticssignerror", {
		fg = "#FF0000",
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "lspdiagnosticssignwarning", {
		fg = "#FFFF00",
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "lspdiagnosticssignhint", {
		fg = "#00FFFF",
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
	vim.api.nvim_set_hl(0, "lspdiagnosticssigninformation", {
		fg = "#00FF00",
		bg = vim.api.nvim_get_hl_by_name("Normal", true).background
	})
end

return M
