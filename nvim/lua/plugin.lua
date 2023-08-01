vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
	use "wbthomason/packer.nvim"
	-- Color Themes
	use "Mofiqul/dracula.nvim"
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
	use "theHamsta/nvim-dap-virtual-text"
	use "rcarriga/nvim-dap-ui"
	use "Pocco81/DAPInstall.nvim"

	use "akinsho/toggleterm.nvim"
	use "windwp/nvim-autopairs"
	use "dinhhuy258/git.nvim"
	use "lewis6991/gitsigns.nvim"

	use {
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } }
	}
	use "ThePrimeagen/harpoon"
	use "simrat39/symbols-outline.nvim"
	use "kdheepak/lazygit.nvim"
	use "folke/which-key.nvim"
	use "mg979/vim-visual-multi"
	use "williamboman/mason.nvim"
	use "terrortylor/nvim-comment"
	use "williamboman/mason.nvim"

	use "jose-elias-alvarez/null-ls.nvim"
	use "klen/nvim-test" -- remember to implement this lmao
end)
--[[
-- Use the below for neotree, allowing for a window with three different buffers
use {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v2.x",
	requires = {
		"nvim-lua/plenary.nvim",
		"kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
	}
}

-- use this for competitive programming
use "xeluxee/competitest.nvim"

-- use this for a sidebar
use "ldelossa/nvim-ide"

-- use this for a neat sidebar
use "sidebar-nvim/sidebar.nvim"

-- use this for different customisable sidebars
use "folke/edgy.nvim"
]]
