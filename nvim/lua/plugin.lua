vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	-- Color Themes
	use "folke/tokyonight.nvim" 
	-- Plugins
	use {
    "SmiteshP/nvim-navic",
    requires = "neovim/nvim-lspconfig"
	}
	use "neovim/nvim-lspconfig"
	use "folke/neodev.nvim"
	use "natebosch/vim-lsc"
	use "ray-x/lsp_signature.nvim"
  use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-nvim-lsp"
	use "L3MON4D3/LuaSnip"

	use {
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons"
	}
	use "nvim-treesitter/nvim-treesitter"
	use "nvim-tree/nvim-tree.lua"
	use "LionC/nest.nvim"
  use "lukas-reineke/indent-blankline.nvim"
	use "mfussenegger/nvim-dap"
	use "mfussenegger/nvim-dap-python"
	use "akinsho/toggleterm.nvim"
	use "windwp/nvim-autopairs"
	use "dinhhuy258/git.nvim"
	use "lewis6991/gitsigns.nvim"

	use {
  'nvim-telescope/telescope.nvim', 
  requires = {{'nvim-lua/plenary.nvim'}}
	}
end)
