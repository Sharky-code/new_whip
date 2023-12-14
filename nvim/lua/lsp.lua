--[[ 
-- LSP.LUA (Parent file: ../init.lua) --
LSPConfig will be (unfortunately) used because of its wide spread support 
In many useful plugins that I just cannot ignore

CMP and its related plugins will be written here due to its relations
]]

--[[
-- INDEX --
1. LSP #001000
	a. .Setup() #001010
		i. Lsp Signature .Setup() #001011
		ii. Neodev .Setup() #001012
		iii. NullLS .Setup() #001013
		iv. Mason .Setup() #001014
	b. Custom Nvim Methods #001020
	c. Lsp Server Settings #001030
		i. Clangd #001031
		ii. Lua Language Server #001032
		iii. Pyright #001033
	d. Handler Settings #001040
	e. LSP Diagnostic Customisation #001050
		i. Add Custom Signs #001051
		ii. Diagnostic Settings #001052
2. CMP #002000
]]

-- 1. _L. S. P._ -- #001000

-- > .Setup() -- #001010

-- > Lsp Signature .Setup() #001011
local lsp_signature = require("lsp_signature").setup {}

-- > Neodev .Setup() #001012
local neodev = require("neodev")
neodev.setup {}

-- > NullLS .Setup() #001013
require("null-ls").setup {
	sources = {
		require("null-ls").builtins.formatting.black,
		require("null-ls").builtins.formatting.stylua,
	},
}

-- > Mason .Setup() #001014
require("mason").setup {}

-- Custom Nvim Methods/	 On_attach/ Capabilities -- #001020
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local function custom_on_attach(client, bufnr)
	lsp_signature.on_attach({}, bufnr)
end

-- LSP Server Settings -- #001030

-- > Clangd #001031
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

-- > Lua Language Server #001032
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

-- > Pyright #001033
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


-- Handler Settings -- #001040
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})

-- LSP Diagnostic Customisation -- #001050

-- > Add Custom Signs (Copied from last config) #001051
local signs = {
	{ name = "DiagnosticSignError", text = "●" },
	{ name = "DiagnosticSignWarn", text = "●" },
	{ name = "DiagnosticSignHint", text = "●" },
	{ name = "DiagnosticSignInfo", text = "●" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Diagnostic Settings (Copied from last config) #001052

local diagnostic_config = {
	virtual_text = false,
	signs = {
		active = signs,
	},
	update_in_insert = false,
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

vim.diagnostic.config(diagnostic_config)
