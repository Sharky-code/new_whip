require("plugin")
vim.cmd(":colo rose-pine")

require("lsp.luasnips")
require("lsp.lspserver")
require("lsp.cmp")
require("lsp.lspconfig")
require("lsp.lsputils")

require("plugins.dap")
require("plugins.neotest")
require("plugins.nvim_tree")
require("plugins.treesitter")
require("plugins.statusline")

require("settings.options")
require("settings.mappings")
require("settings.commands")
require("settings.autocommands")
