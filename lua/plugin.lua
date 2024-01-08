-- PLUGIN.LUA

-- for more plugins, take this as reference:
-- https://github.com/rockerBOO/awesome-neovim#lsp

-- Plugins that i may forget about because i seldomly use them
-- > Telescope -> projects and file_browser
-- > Legendary

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
			require("fidget").setup({
				-- options
			})
		end,
	})
	-- TRY FIND ALTERNATIVE AS SOME SETTINGS ARE UNWANTED
	use({
		"ray-x/navigator.lua",
		requires = {
			{ "ray-x/guihua.lua",     run = "cd lua/fzy && make" },
			{ "neovim/nvim-lspconfig" },
		},
		config = function()
			require("navigator").setup({
				ts_fold = true,
				lsp = {
					format_on_save = false,
					diagnostic = {
						underline = true,
						virtual_text = false,
						update_in_insert = false,
					},
					display_diagnostic_qf = false,
					document_highlight = false,
				},
			})
		end,
	})
	-- Rust tools
	use({
		"simrat39/rust-tools.nvim",
		config = function()
			require("rust-tools").setup({})
		end,
	})
	use("Bekaboo/dropbar.nvim")

	-- Autocomplete and Snippets
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("hrsh7th/nvim-cmp")
	use("saadparwaiz1/cmp_luasnip")

	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")

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

	-- Which Key and Legendary
	use("folke/which-key.nvim")
	use({
		"mrjones2014/legendary.nvim",
		version = "v2.1.0",
		priority = 10000,
		lazy = false,
	})

	-- Autoclose (bracket and auto indent)
	use({
		"m4xshen/autoclose.nvim",
		config = function()
			require("autoclose").setup({})
		end,
	})

	-- Terminal
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
			})
		end,
	})

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
	use({ "nvim-telescope/telescope-project.nvim" })
	use({ "nvim-telescope/telescope-file-browser.nvim" })
	use({
		"nvim-telescope/telescope.nvim",
		config = function()
			require("telescope").load_extension("project")
			require("telescope").load_extension("file_browser")
		end,
	})

	-- Easier Commenting
	use("numToStr/Comment.nvim")

	-- NvimTree
	use("nvim-tree/nvim-tree.lua")

	-- Lualine
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
	})

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			{ "duane9/nvim-rg" },
		},
	})
	use("nvim-treesitter/playground")
	use({
		"nvim-treesitter/nvim-treesitter-context",
		config = {
			require("treesitter-context").setup({}),
		},
	})
	use({
		"Badhi/nvim-treesitter-cpp-tools",
		config = function()
			require("nt-cpp-tools").setup({
				preview = {
					quit = "q",
					accept = "<tab>",
				},
				header_extension = "h",
				source_extension = "cxx",
				custom_define_class_function_commands = {
					TSCppImplWrite = {
						output_handle = require("nt-cpp-tools.output_handlers").get_add_to_cpp(),
					},
				},
			})
		end,
	})
	use({
		"ThePrimeagen/refactoring.nvim",
		requires = {
			{ "nvim-lua/plenary.nvim" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
		config = function()
			require("refactoring").setup({
				prompt_func_return_type = {
					cpp = true,
					cxx = true,
				},
				prompt_func_param_type = {
					cpp = true,
					cxx = true,
				},
			})
		end,
	})

	-- Trouble.nvim
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {
			indent_lines = false,
		},
	})
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

-- Grapple for file travel
use({
	"cbochs/grapple.nvim",
	requires = { "nvim-lua/plenary.nvim" },
	config = function()
		require("grapple").setup({})
	end,
})

use("michaelb/sniprun")

use("nvim-treesitter/nvim-treesitter-refactor")


use({
	"SmiteshP/nvim-navbuddy",
	config = function()
		require("nvim-navbuddy").setup({})
	end,
})
]]
