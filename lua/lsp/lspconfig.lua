-- LSPCONFIG.LUA

-- Add custom signs
local signs = {
	{ name = "DiagnosticSignError", text = "●" },
	{ name = "DiagnosticSignWarn", text = "●" },
	{ name = "DiagnosticSignHint", text = "●" },
	{ name = "DiagnosticSignInfo", text = "●" },
}

for _, sign in ipairs(signs) do
	vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

-- Set up config for vim diagnostic
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

-- Change the style for hover and signatureHelp
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "single",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "single",
})


-- Set up mason.nvim
local mason = require("mason")
mason.setup({
	pip = {
		upgrade_pip = true,
	},
})

local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.black,
		null_ls.builtins.formatting.stylua,
	},
})

-- Set up treesitter based highlighting
local ts = require("nvim-treesitter.configs").setup({
	ensure_installed = { "cpp", "rust", "python", "lua" },
})
