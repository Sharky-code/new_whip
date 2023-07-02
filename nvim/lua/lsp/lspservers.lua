local lspconfig = require("lspconfig")
local navic = require("nvim-navic")
local lsp_mappings = require("lsp.lspmappings")

lspconfig.pyright.setup {
	lsp_mappings.lsp_keymaps(),
	settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}
lspconfig.lua_ls.setup {
	lsp_mappings.lsp_keymaps(),
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
					[vim.fn.expand "$VIMRUNTIME/lua"] = true,
					[vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
				},
			},
		},
	},
}
