local configs = require("nvim-treesitter.configs")

configs.setup {
	ensure_installed = { "cpp", "lua", "python", "java" },
	ignore_install = { "javascript" },
	auto_install = true,
	sync_install = true,
	playground = {},
	highlight = {
		enable = true,
		disable = {},
	},
	rainbow = {
		enable = true,
		extended_mode = true,
	},
	additional_vim_regex_highlighting = false,
}