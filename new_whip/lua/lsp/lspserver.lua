-- LSPSERVER.LUA

-- Setup LSP servers with lspconfig

-- Setup Lsp signature for hover text
local lsp_signature = require("lsp_signature")
lsp_signature.setup({})

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")

-- if the lsp supports codelens, then you can use virtual types

lspconfig.clangd.setup({
	autostart = true,
	on_attach = function(client, bufnr)
		lsp_signature.on_attach({}, bufnr)
	end,
	capabilities = capabilities,
})

-- If lsp in c++ is on a older version, do
-- ```
-- CompileFlags:
--    Add: [-std=c++<ver>]
-- ```
-- to change the version

lspconfig.lua_ls.setup({
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
})

-- Neodev for a slightly better time when configuring
local neodev = require("neodev")
neodev.setup({})

lspconfig.pyright.setup({
	capabilities = capabilities,
	on_attach = function(client, bufnr)
	end,
})
