vim.cmd[[color tokyonight]]
require("plugin")

require("settings.options")
require("settings.autocommands")
require("settings.highlights")
require("settings.mappings")

require("lsp.lspconfig")
require("lsp.lspservers")
require("lsp.lspmappings")
require("lsp.cmp")

require("plugins.navic")
require("plugins.nvimtree")
require("plugins.treesitter")
require("plugins.indentblankline")

require("ui.winbar")
require("ui.statusbar")
