--[[
-- EMILIVIM --

What is the purpose of this?
This is the possibly the fifth time you have tried to rewrite Neovim. Isn't 4 Enough?
The purpose of this is to delve even deeper into the Neovim rabbit hole.
Last time wasn't good enough - you copied code and used the first result from Google, albeit you did credit.
This time you read from the documentation. Certain code can be spared from this strict rule; options will be 
copied from last time as it is a refined taste.
The structure of the files this time would be simplistic, and instead of many files, there would be few, structured
with comments such as these.
]]

--[[
-- ToDo --
- Appearances
	- Treesitter
		- LUA PARSER BUG - FIX NOW 
- LSP - instructions should be embedded to install the corresponding LSP servers
- Syntax Highlighting
- DAP
- NeoTest
- alpha.nvim
- Try to replace lspconfig with custom lsp customisation 
]]

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
1. Lazy
	a. Lazy Setup
	b. Plugin List
	c. Lazy Options
	d. .Setup()
2. Aesthetics
	a. Transparent Background Plugin
3. Treesitter
4. Runtime Commands
]]

-- 1. _L. A. Z. Y._ --

-- Lazy Setup (Copy and Paste from the website) --
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

-- Plugin List --
local plugins = {
	-- Colorscheme
	"folke/tokyonight.nvim",
	
	-- Treesitter
	"nvim-treesitter/nvim-treesitter",
	"ThePrimeagen/refactoring.nvim",
	"Badhi/nvim-treesitter-cpp-tools",
	
	-- Lsp
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

	-- Aesthetics
	"xiyaowong/transparent.nvim",
	"goolord/alpha-nvim",
	"nvim-lualine/lualine.nvim",
	"mrjones2014/legendary.nvim",

	-- Dropbar
	"Bekaboo/dropbar.nvim",

	-- Float Terminal
	"voldikss/vim-floaterm",

	-- Asyncrun
	"skywind3000/asyncrun.vim",

	-- Telescope
	"nvim-telescope/telescope.nvim"
}

-- Lazy Options --
local opts = {}

-- .Setup() -- 
require("lazy").setup(plugins, opts)

-- 2. _A. E. S. T. H. E. T. I. C. S._ -- 

-- Transparent Background Plugin -- 
require("transparent").setup {}

-- 3. _T. R. E. E. S. I. T. T. E. R._ (Copy and Paste from website :P) --
require("nvim-treesitter.configs").setup {
	ensure_installed = {"rust", "vim", "cpp", "python", "cmake", "lua"},
	auto_install = true,
	highlight = {
		enable = true,
	}
}

-- 4. _L. S. P. (Minor) --

-- LSP server settings --
require("lspconfig").clangd.setup {
	autostart = true,
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--header-insertion=iwyu",
		"--completion-style=detailed",
		"--function-arg-placeholders",
		-- vim.fn.input("Input custom argument for clangd: ")
	},
	on_attach = function(client, bufnr)
		custom_on_attach(client, bufnr)
	end,
	capabilities = capabilities,
}

require("lspconfig").lua_ls.setup {
	capabilities = capabilities,
	settings = {
		Lua = {
			runtime = {
				version = "LuaJIT",
				path = vim.split(package.path, ";"),
			},
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
					[vim.fn.expand("$VIMRUNTIME/lua")] = true,
					[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
				},
			},
			completion = {
				callSnippet = "Replace",
			},
		},
	},
}

local neodev = require("neodev")
neodev.setup{}

require("lspconfig").pyright.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		custom_on_attach(client, bufnr)
	end,
	analysis = {
		typeCheckingMode = 'off',
		diagnosticMode = 'workspace',
		autoSearchPaths = true,
		autoImportCompletions = true,
		useLibraryCodeForTypes = true,
	}
})

require("lspconfig").rust_analyzer.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
		custom_on_attach(client, bufnr)
	end,
})

require("mason").setup{}

-- Handler Settings --
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})

-- Diagnostic Settings (Copied from last config) --
local config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = true,
	underline = true,
	severity_sort = true,
	float = {
		focusable = true,
		style = "minimal",
		border = "single", -- rounded
		source = "always",
		header = "",
		prefix = "",
	},
}
vim.diagnostic.config(config)

-- Add Custom Signs (Copied from last config) --
local signs = {
	{ name = "DiagnosticSignError", text = "●" },
	{ name = "DiagnosticSignWarn", text = "●" },
	{ name = "DiagnosticSignHint", text = "●" },
	{ name = "DiagnosticSignInfo", text = "●" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- NullLS setup --
require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.stylua,
	},
})

-- 4. _R. U. N. T. I. M. E.  C. O. M. M. A. N. D. S_ --

vim.cmd(":TransparentEnable")
vim.cmd(":color tokyonight")

require("lua.lsp")
require("lua.option")
require("lua.alpha")
