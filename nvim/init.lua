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
		xi. Dap and Neotest #00102b
		xii. Github #00102c
		xiii. Miscellaneous #00102d
	c. Lazy Options #001030
2. .Setup() #001040
	a. Lazy .Setup() #002010
	b. Treesitter .Setup() #002020
	c. Transparent Background Plugin .Setup() #002030
	d. True Zen .Setup() #002040
	e. Telescope .Setup() #002050
	f. Naviagator .Setup() #002060
	g. Gitsigns .Setup() #002070
	h. Better Escape .Setup() #002080
	i. UFO .Setup() #002090
	j. Neodev .Setup() #0020a0
	k. Zen Mode .Setup() #0020b0
	l. Alpha .Setup() #0020c0
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
		"Badhi/nvim-treesitter-cpp-tools",
		"nvim-treesitter/nvim-treesitter-context",
	"ThePrimeagen/refactoring.nvim",
	
	-- > Lsp #001023
	"neovim/nvim-lspconfig",
		"williamboman/mason.nvim",
		"jose-elias-alvarez/null-ls.nvim",
		"nvim-lua/plenary.nvim",
		"folke/neodev.nvim",
		"ray-x/lsp_signature.nvim",
		"nvim-lua/lsp-status.nvim",
		"onsails/lspkind.nvim",
		"nvimdev/lspsaga.nvim",
		"kosayoda/nvim-lightbulb",
		"RishabhRD/nvim-lsputils",
			"RishabhRD/popfix",
		"ray-x/navigator.lua",
		"ray-x/guihua.lua",
		"mfussenegger/nvim-dap",
	
	-- > Autocomplete and Snippets #001024
	"hrsh7th/nvim-cmp",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-cmdline",
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
	"debugloop/telescope-undo.nvim",

	-- > True Zen #00102a
	"pocco81/true-zen.nvim",
	"folke/zen-mode.nvim",

	-- > Dap and Neotest #00102b
	"mfussenegger/nvim-dap",
	"mfussenegger/nvim-dap-python",
	"theHamsta/nvim-dap-virtual-text",
	"rcarriga/nvim-dap-ui",
	"Pocco81/DAPInstall.nvim",
	"klen/nvim-test",
	"nvim-neotest/neotest",
	"nvim-neotest/neotest-python",

	-- > Github #00102c
	"kdheepak/lazygit.nvim",
	"lewis6991/gitsigns.nvim",

	-- > Misellaneous #00102d
	"nvim-lua/plenary.nvim",
	"folke/which-key.nvim",
	"edluffy/hologram.nvim",
	"max397574/better-escape.nvim",
	"kevinhwang91/nvim-ufo",
		"kevinhwang91/promise-async",
	"MunifTanjim/nui.nvim",
	-- "benlubas/wrapping-paper.nvim"  -- This is a promising plugin that I will use in the future when its fully developed
}

-- Lazy Options -- #001030
local opts = {}

-- 2. _. S. E. T. U. P. (. )_ --  #002000

-- Lazy .Setup() --  #002010
require("lazy").setup(plugins, opts)


-- Treesitter .Setup() --  #002020
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

-- Transparent Background Plugin .Setup() -- #002030
require("transparent").setup {
	extra_groups = {
		--"Nui",
		--"NormalFloat"
	}

}

-- True Zen .Setup() -- #002040
require("true-zen").setup {}

-- Telescope .Setup() -- #002050
require("telescope").setup {
	defaults = {
		layout_strategy = "vertical",
		layout_config = {}
	},
	extensions = {
		file_browser = {
			hijack_netrw = true
		}
	}
}
require("telescope").load_extension "file_browser"

-- https://github.com/nvim-telescope/telescope.nvim/blob/master/developers.md#guide-to-your-first-picker
-- Very fucking annoying to do since the code required ISN'T even in the fucking :h telescope

-- Naviagator .Setup() -- #002060

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

-- Hologram.Setup() -- #002060
require("hologram").setup{
    auto_display = true
}

-- Gitsigns .Setup() -- #002070
require("gitsigns").setup {}

-- Better Escape .Setup() -- #002080
require("better_escape").setup()

-- UFO .Setup() -- #002090
require('ufo').setup()

-- Neodev .Setup() -- #0020a0
require("neodev").setup {}

-- Zen Mode .Setup() -- #0020b0
require("zen-mode").setup {
	window = {
		width = 100
	},
	plugins = {
		options = {
			enabled = true,
			ruler = true
		},
		kitty = {
			enabled = true,
			font = "+4"
		}
	}
}

-- Alpha .Setup() -- #0020c0
local dashboard = require("alpha.themes.dashboard")
--[[
dashboard.section.header.val = {
"=============================================================",
"------------@                    @@@@Rie Takahashi Vim-------",
"--------@+#@ ████  █ % █  ███ %%%%@@@@@@@@@@@@+****+=-----",
"----#@+++++% ██    █ █ %  █  %%    %%@@@@@@@@@@@@@@@------",
"-@++:------- ███   ███ -- █ -- █████ %%%@@@@@@@@@@@@@-----",
"::-#@@@@@%%% ██    █   █ %% █ @@@     --+%%%@@@@@@@@@@@@----",
"@@@@@@@@%%%% ████  █ % █ %% █ %%@%%%%%@@=----=%@@@@@@@@@@@--",
"@@@@@@@+++%%%  %  %  +++ %%%   %%% %%  %%%%%%@#---+#@@@@@@@@@",
"@@@@@@++%%%%%%@%%%@ █ % █  ███  █ % █ %%%%*%@%%@@+++++@@@@@",
"%@@@@+%%%%%%%%%%%@= █ % █ %% █ %@ █ █ %%%%%%%%%%%%%%@#++++@",
"----@%%%%%@%%@%%@== █ █ %% █ %@ ███ %@%%%%%@%%%%%%%%@@@@+",
"---@%%%%%%@%%@%@==..███%%% █  = █   █ %@%%%%%%%%%%%%%%%@@@@",
"---%%%%%%%@%%@@=:....█%% ███  █ + █ %@%%%%%%@%%%%%%%%%@@@",
"--@%%%%%%%@%%@=......-%%%%%%%%@=....@.@ %@%%%%%%@%%%%%%%%%@@@",
"--@%%%%%%%%%%=.@@@@@@.@%%%%%@@=@@...@@.:@@%%%%%%@%%%%%%%%%@@@",
"--@@%%%%%%%@%@@..*@@-..@%%%%%.....@@@.@@.%%%@%%%@%%%%%%%@%@--",
"--@@%@%%%%%@%@..@@@@@..........@@@@@@+.@@%%@%%%%@%%%%%%%%%@--",
"--@@%@%%%%@@@@..@###@..........@##**##..@%@%%%%%@%%%%%%%%@+--",
"--@-%@%%%%%@.@..%=-=@...........#=--#..@%@%%%%Megumin%%%%@---",
"----@@@%%@%%:....@-@.............@=@..%@+%%%%%%%%-%%%%%%%@---",
"-----@-@%@%%%..::.......................@%%%%%%%=@%%%%%@%@---",
"------@@@@%%#..:.........-=-.......:::..@%%%%%%@@%%%%%%@%@---",
"-------@%%%%@..........@---=+@..........%%%%%%%@%%%%%%%@@@---",
"-------@%%%%%%..........------.........%%%%%%%%@%%%%%@%@@@---",
"-------@%%%%%%@%@@..................@@@@%%%%%%%@%%%%@@%@@@---",
"-------@%%%%%%@@%@%@@@@@@@@@@@@%=+@@@@%@%%@%%%%@%%%%-%@-@----",
}
]]

dashboard.section.header.val = {
"=============================================================",
"",
"			  ████  █   █  ███",
"			  ██    █ █    █",
"			  ███   ███    █    █████",
"			  ██    █   █    █",
"			  ████  █   █    █",
"",
"					 █   █  ███  █   █",
"					 █   █    █    █ █",
"					 █ █    █    ███",
"					 ███    █    █   █",
"					  █   ███  █   █",
"",
"",
"=============================================================",
}

require("alpha").setup(dashboard.config)

dashboard.section.buttons.val = {
	dashboard.button( "e", "  New file" , ":ene <BAR> startinsert <CR>"),
	dashboard.button( "t", "  Open Telescope" , ":Telescope <CR>"),
	-- Gallery Option
	-- Choose Waifu Option
	dashboard.button( "q", "󰅚  Quit NVIM" , ":qa <CR>"),
}
dashboard.config.opts.noautocmd = true
--  r01_R. U. N. T. I. M. E.  C. O. M. M. A. N. D. S_ -- #004000

vim.cmd(":TransparentEnable")
vim.cmd(":color tokyonight")

require("lsp")
require("option")
require("mappings")
-- require("lua.alpha")

-- NOENTRYBEYONDPOINT --> TESTING GROUNDS :>
