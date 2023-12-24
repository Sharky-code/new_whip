-- PLUGIN.LUA

-- for more plugins, take this as reference:
-- https://github.com/rockerBOO/awesome-neovim#lsp

-- Set up plugins using packer.nvim
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")

	-- ColorSchemes
	use("rose-pine/neovim")
	use("Mofiqul/dracula.nvim")

	-- Lsp
	use("neovim/nvim-lspconfig")
	use("williamboman/mason.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("nvim-lua/plenary.nvim")
	use("folke/neodev.nvim")
	use("ray-x/lsp_signature.nvim")
	use("nvim-lua/lsp-status.nvim")
	use("onsails/lspkind.nvim")
	use({
		"nvimdev/lspsaga.nvim",
		after = "nvim-lspconfig",
		config = function()
			require("lspsaga").setup({
				symbol_in_winbar = {
					enable = false,
				},
			})
		end,
	})
	use({
		"kosayoda/nvim-lightbulb",
		config = function()
			require("nvim-lightbulb").setup({
				autocmd = { enabled = true },
				virtual_text = {
					enabled = false,
				},
			})
		end,
	})
	use({ "RishabhRD/nvim-lsputils", requires = { "RishabhRD/popfix" } })
	use({
		"j-hui/fidget.nvim",
		tag = "legacy",
		config = function()
			require("fidget").setup({})
		end,
	})
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("navigator").setup({
				lsp = {
					format_on_save = false,
					diagnostic = {
						underline = true,
						virtual_text = false,
						update_in_insert = false,
					},
					document_highlight = false,
					display_diagnostic_qf = false,
				},
			})
		end,
	})

	-- Dropbar
	use({
		"Bekaboo/dropbar.nvim",
		config = function()
			require("dropbar").setup({
				icons = {
					ui = {
						bar = {
							separator = "  ",
						},
					},
				},
			})
		end,
	})

	-- Autocomplete and Snippets
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("michaelb/sniprun")

	-- DAP and neotest
	use("mfussenegger/nvim-dap")
	use("mfussenegger/nvim-dap-python")
	use("theHamsta/nvim-dap-virtual-text")
	use("rcarriga/nvim-dap-ui")
	use("Pocco81/DAPInstall.nvim")
	use("klen/nvim-test")
	use("nvim-neotest/neotest")
	use("nvim-neotest/neotest-python")

	-- Python virtual environment
	use("AckslD/swenv.nvim")
	use("stevearc/dressing.nvim")

	-- Which Key
	use("folke/which-key.nvim")

	-- Autoclose (bracket and auto indent)
	use({
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({})
		end,
	})
	use({
		"kylechui/nvim-surround",
		tag = "*",
		config = function()
			require("nvim-surround").setup({})
		end
	})

	-- Terminal
	--[[
	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup({
				size = 20,
				direction = "horizontal",
				winbar = {
					enabled = true,
				},
				terminal_mappings = true,
				insert_mappings = true
			})
		end,
	})
	]]
	use ({'voldikss/vim-floaterm'})


	-- Async Run
	use("skywind3000/asyncrun.vim")

	-- Tmux with neovim
	use({
		"aserowy/tmux.nvim",
		config = function()
			return require("tmux").setup()
		end,
	})

	-- Ui
	use("MunifTanjim/nui.nvim")
	use("SmiteshP/nvim-navic")
	use({
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup({})
		end,
	})

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Easier Commenting
	use("numToStr/Comment.nvim")

	-- NvimTree
	use("nvim-tree/nvim-tree.lua")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Legendary
	use({ "mrjones2014/legendary.nvim", config = function() end })

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup()
		end,
	})
	use({
		"Badhi/nvim-treesitter-cpp-tools",
		config = function()
			require("nt-cpp-tools").setup({})
		end,
	})

	-- Multiple cursors
	use("mg979/vim-visual-multi")

end)

-- Unused

-- Will be implemented

--[[
use({
	"rmagatti/goto-preview",
	config = function()
		require("goto-preview").setup({ default_mappings = true })
	end,
})
use({
	"SmiteshP/nvim-navbuddy",
	config = function()
		require("nvim-navbuddy").setup({})
	end,
})

-- Grapple for file travel
use({
	"cbochs/grapple.nvim",
	requires = { "nvim-lua/plenary.nvim" },
})

-- use Glance for a navigator ui replacement
use({
	"dnlhc/glance.nvim",
	config = function()
		require('glance').setup({})
	end,
})

use("mhartington/formatter.nvim")
]]
