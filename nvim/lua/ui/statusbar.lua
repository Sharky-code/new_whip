local M = {}

local statusbar_filetype_exclude = {
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

M.components = {
	mode = function ()
		local modes = {
			["n"] = "NORMAL",
			["no"] = "NORMAL",
			["v"] = "VISUAL",
			["V"] = "VISUAL LINE",
			[""] = "VISUAL BLOCK",
			["s"] = "SELECT",
			["S"] = "SELECT LINE", [""] = "SELECT BLOCK",
			["i"] = "INSERT",
			["ic"] = "INSERT",
			["R"] = "REPLACE",
			["Rv"] = "VISUAL REPLACE",
			["c"] = "COMMAND",
			["cv"] = "VIM EX",
			["ce"] = "EX",
			["r"] = "PROMPT",
			["rm"] = "MOAR",
			["r?"] = "CONFIRM",
			["!"] = "SHELL",
			["t"] = "TERMINAL", }
		modes = modes[vim.api.nvim_get_mode().mode]:upper()
		return modes
	end,
	modes_colours = function ()
		local current_mode = vim.api.nvim_get_mode().mode
		local mode_color = "%#StatusLine#"
		if current_mode == "n" then
			mode_color = "%#StatusLineNormal#"
		elseif current_mode == "i" or current_mode == "ic" then
			mode_color = "%#StatusLineInsert#"
		elseif current_mode == "v" or current_mode == "V" or current_mode == "" then
			mode_color = "%#StatusLineVisual#"
		elseif current_mode == "R" then
			mode_color = "%#StatusLineReplace#"
		elseif current_mode == "c" then
			mode_color = "%#StatusLineCmdLine#"
		elseif current_mode == "t" then
			mode_color = "%#StatusLineTerminal#"
		end
		mode_color = "%#StatusLineBold#" -- Remove to add custom colours
		return mode_color
	end,
	file_name = function ()
		local file_name = vim.fn.expand("%:t")
		if file_name == "" then
			return "-<nil>-"
		else
			return file_name
		end
	end,
	lsp = function ()
		local count = {}
		local levels = {
			errors = "Error",
			warnings = "Warn",
			info = "Info",
			hints = "Hint",
		}

		for k, level in pairs(levels) do
			count[k] = vim.tbl_count(vim.diagnostic.get(0, { severity = level }))
		end

		local errors = ""
		local warnings = ""
		local hints = ""
		local info = ""

		if count["errors"] ~= 0 then
			errors = " %#LspDiagnosticsSignError# " .. count["errors"]
		end
		if count["warnings"] ~= 0 then
			warnings = " %#LspDiagnosticsSignWarning# " .. count["warnings"]
		end
		if count["hints"] ~= 0 then
			hints = " %#LspDiagnosticsSignHint# " .. count["hints"]
		end
		if count["info"] ~= 0 then
			info = " %#LspDiagnosticsSignInformation# " .. count["info"]
		end

		return errors .. warnings .. hints .. info
	end,
	line_info = function ()
		if vim.bo.filetype == "alpha" then
			return ""
		end
		return " %P %l:%c "
	end
}

-- TODO: vim.api.nvim_buf_line_count(0) and nerd font symbols to show location of file
-- LEFT %= MIDDLE %= RIGHT
function M.statusbar_active()
	local statusbar_text = ""
	if vim.tbl_contains(statusbar_filetype_exclude, vim.bo.filetype) then
		vim.opt_local.statusline = M.statusbar_inactive()
		return
	end
	statusbar_text = statusbar_text .. "%#StatusLine#  " .. M.components.modes_colours() .. M.components.mode() ..
		"%#StatusLine#" .. "  " .. M.components.file_name() .. "  " ..
		"%=" ..  "%=%#StatusLine#" ..  "  " .. "%{get(b:,'gitsigns_status','')}" .. M.components.lsp() .. "  " ..
		M.components.line_info() .. "  " 
	return statusbar_text
end

function M.statusbar_inactive()
	local statusbar_text = ""
	if vim.tbl_contains({"NvimTree"}, vim.bo.filetype) then
		return "%#NvimTreeNormal#"
	end
	statusbar_text = statusbar_text  .. "%#StatusLineNC#  " .. M.components.file_name()	
	return statusbar_text
end

return M
