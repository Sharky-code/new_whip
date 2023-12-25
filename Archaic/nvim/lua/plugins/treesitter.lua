-- TREESITTER.LUA

require("nvim-treesitter.configs").setup({
	ensure_installed = { "c", "lua", "vim", "vimdoc", "python", "cpp", "rust" },
	highlight = {
		enable = true,
	},
})
