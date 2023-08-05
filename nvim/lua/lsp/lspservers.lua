local lspconfig = require("lspconfig")

lspconfig.pyright.setup {
	settings = {
    python = {
      analysis = {
        typeCheckingMode = "off",
      },
    },
  },
}
lspconfig.lua_ls.setup {
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
lspconfig.clangd.setup {
	cmd = {
		"clangd",
		"--offset-encoding=utf-16"
	}
}
lspconfig.ltex.setup {}
