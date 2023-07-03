local M = {}

local navic = require("nvim-navic")

local winbar_filetype_exclude = {
  "help",
  "startify",
  "dashboard",
  "packer",
  "neogitstatus",
  "NvimTree",
  "Trouble",
  "alpha",
  "lir",
  "Outline",
  "spectre_panel",
  "toggleterm",
}

function M.get_winbar()
	local filetype = vim.bo.filetype
	-- The following space uses the "⠀" character - a braile unicode character, due to automatic
	-- shortening when using regular space
	local text = "⠀" .. string.upper(filetype) ..  " /"
	if navic.is_available() then
		return text .. " " .. navic.get_location()
	else
		return text
	end
end

function M.set_winbar()
	local path = vim.fn.expand("%:p")
	if path == "" or vim.tbl_contains(winbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.winbar = nil
		return
	end
	vim.opt_local.winbar = "%{%v:lua.require('ui.winbar').get_winbar()%}"
end

return M
