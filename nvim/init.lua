--[[
TODO: Create a window that contains several buffers such as nvimtree, nvimdap and git, similar to neotree
]]

require("plugin")

local files = {
	lsp = {
		"lspconfig",
		"lspservers",
		"lspmappings",
		"cmp",
		"dap",
		"lspsignature"
	},
	plugins = {
		"navic",
		"nvimtree",
		"treesitter",
		"indentblankline",
		"toggleterm",
		"autopairs",
		"git",
		"telescope",
		"bufferline",
		"symbolsoutline",
		"whichkey"
	},
	settings = {
		"highlights",
		"options",
		"autocommands",
		"mappings"
	},
	ui = {
		"winbar",
		"statusbar"
	}
}

for k, v in pairs(files) do
	for x = 1, #v do
		require(k .. "." .. v[x])
	end
end

vim.cmd[[color dracula]]
