--[[
-- EMILIVIM --

What is the purpose of this?
This is the possibly the fifth time you have tried to rewrite Neovim. Isn't 4 Enough?
The purpose of this is to delve even deeper into the Neovim rabbit hole.

Last time wasn't good enough - you copied code and used the first result from Google, albeit you did credit.

This time you read from the documentation. Certain code can be spared from this strict rule; options will be 
copied from last time as it is a refined taste.

The structure of the files this time would be simplistic, and instead of many files, there would be few, structured 
with comments such as these - structural integrity of each individual files is preferred
due to easy accessibilty of the different regions of code.

I want to give the text editor a largely simplified and furnished feel, and instead of the typical over-
reliance on plugins, I will use largely the built in Nvim features - because typically, you only just need
a terminal to be effective
]]


-- The ToDo list is on my Notion

--[[
-- DEPENDENCIES --
1. npm
2. neovim (ofc)
]]

--[[
-- CODING LANGUAGES I USE (LSPs I will install) --
1. Python -> pyright
2. C++ -> clangd
3. Lua (Neovim) -> lua-language-server
4. Rust
5. Vim
6. Cmake
]]

--[[
-- INDEX --
1. Lazy #001000
	a. Lazy Setup #001010
	b. Plugin List #001020
	c. Lazy Options #001030
	d. .Setup() #001040
		i. Colorscheme #001021
		ii. Treesitter #001022
		iii. Lsp #001023
		iv. Autocomplete and Snippets #001024
		v. Aesthetics #001025
		vi. Dropbar #001026
		vii. Float Terminal #001027
		viii. Asyncrun #001028
		ix. Telescope #001029
		x. True Zen #00102a
		xi. Miscellaneous #00102b
2. Treesitter setup #002000
3. Miscellaneous #003000
	a. Transparent Background Plugin #003010
	b. True Zen #003020
	c. Telescope .Setup() #003030
	d. Naviagator .Setup() #003040
4. Runtime Commands #00400
]]

-- 1. _L. A. Z. Y._ -- #001000

-- Lazy Setup (Copy and Paste from the website) -- #001010
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Plugin List -- #001020
local plugins = {
	-- > Colorscheme #001021
	"folke/tokyonight.nvim",
	
	-- > Treesitter #001022
	"nvim-treesitter/nvim-treesitter",
	"ThePrimeagen/refactoring.nvim",
	"Badhi/nvim-treesitter-cpp-tools",
	"nvim-treesitter/nvim-treesitter-context",
	
	-- > Lsp #001023
	"williamboman/mason.nvim",
	"neovim/nvim-lspconfig",
	"jose-elias-alvarez/null-ls.nvim",
	"nvim-lua/plenary.nvim",
	"folke/neodev.nvim",
	"ray-x/lsp_signature.nvim",
	"nvim-lua/lsp-status.nvim",
	"onsails/lspkind.nvim",
	"nvimdev/lspsaga.nvim",
	"kosayoda/nvim-lightbulb",
	"RishabhRD/nvim-lsputils",
	"ray-x/navigator.lua",
	"ray-x/guihua.lua",
	
	-- > Autocomplete and Snippets #001024
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-cmdline",
	"hrsh7th/nvim-cmp",
	"saadparwaiz1/cmp_luasnip",

	"L3MON4D3/LuaSnip",
	"rafamadriz/friendly-snippets",
	"michaelb/sniprun",

	-- > Aesthetics #001025
	"xiyaowong/transparent.nvim",
	"goolord/alpha-nvim",
	"nvim-lualine/lualine.nvim",
	"mrjones2014/legendary.nvim",

	-- > Dropbar #001026
	-- "Bekaboo/dropbar.nvim",  -- This plugin only works for 0.10.0, so switch to it when neovim releases
				    -- a stable release.
					
	-- > Float Terminal #001027
	"voldikss/vim-floaterm",

	-- > Asyncrun #001028
	"skywind3000/asyncrun.vim",

	-- > Telescope #001029
	"nvim-telescope/telescope.nvim",
	"nvim-telescope/telescope-file-browser.nvim",

	-- > True Zen #00102a
	"pocco81/true-zen.nvim",

	-- > Misellaneous #00102b
	"nvim-lua/plenary.nvim"
}

-- Lazy Options -- #001030
local opts = {}

-- .Setup() --  #001040
require("lazy").setup(plugins, opts)


-- 2. _T. R. E. E. S. I. T. T. E. R._ (Copy and Paste from website :P) -- #002000
require("nvim-treesitter.configs").setup {
	ensure_installed = {"rust", "vim", "cpp", "python", "cmake", "lua"},
	auto_install = true,
	highlight = {
		enable = true,
	}
}

require("treesitter-context").setup {
	enable = true
}

-- 3. _M. I. S. C. E. L. L. A. N. E. O. U. S.  S. E. T. U. P_ -- #003000

-- Transparent Background Plugin setup() -- #003010
require("transparent").setup {}

-- True Zen .Setup() -- #003020
require("true-zen").setup {}

-- Telescope .Setup() -- #003030
require("telescope").setup {
	extensions = {
		file_browser = {
			hijack_netrw = true
		}
	}
}
require("telescope").load_extension "file_browser"

-- Naviagator .Setup() -- #003040

-- The great thing of this is that its an extra layer of LSP configuration, so that I can rely on 
-- LSPConfig/others for custom visualisation changes, and Navigator for keybinds and other more active
-- components
require("navigator").setup {
	lsp = {
		format_on_save = false,
		diagnostic = {
			underline = true,
			virtual_text = false,
			under_in_insert = false,
		},
		document_highlight = false,
		display_diagnostic_qf = false
	}
}

-- 4. _R. U. N. T. I. M. E.  C. O. M. M. A. N. D. S_ -- #004000

vim.cmd(":TransparentEnable")
vim.cmd(":color tokyonight")

require("lsp")
require("option")
-- require("lua.alpha")
