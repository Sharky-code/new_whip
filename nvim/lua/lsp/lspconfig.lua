local signs = {
	{ name = "DiagnosticSignError", text = "●" },
	{ name = "DiagnosticSignWarn", text = "●" },
	{ name = "DiagnosticSignHint", text = "●" },
	{ name = "DiagnosticSignInfo", text = "●" },
}

local neodev = require("neodev")
local null_ls = require("null-ls")
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

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
		border = "single",  -- rounded
		source = "always",
		header = "",
		prefix = "",
	},
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",  -- rounded
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",  -- rounded
})

neodev.setup { library = { plugins = { "nvim-dap-ui" }, types = true }, }

mason.setup {}

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.blue,
    },
})
