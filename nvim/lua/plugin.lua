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
	use "nvim-tree/nvim-tree.lua"
	use {
		"akinsho/bufferline.nvim",
		tag = "*",
		requires = "nvim-tree/nvim-web-devicons"}
	use "nvim-treesitter/nvim-treesitter"
	use "neovim/nvim-lspconfig"
	use "folke/neodev.nvim"
	use "natebosch/vim-lsc"
	use "L3MON4D3/LuaSnip"
  use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-nvim-lsp"
	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}
	use "LionC/nest.nvim"
  use "lukas-reineke/indent-blankline.nvim"
end)
